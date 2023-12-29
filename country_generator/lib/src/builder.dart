import 'dart:async';
import 'dart:io';

import 'package:build/build.dart';
import 'package:country/country.dart';
import 'package:country_generator/src/constant.dart';
import 'package:country_generator/src/extension.dart';
import 'package:path/path.dart';
import 'package:yaml/yaml.dart';

/// Country generator for generating classes from [countries](https://github.com/countries/countries)
class CountryGeneratorBuilder extends Builder {
  /// generate country.g.dart with [countries](https://github.com/countries/countries)
  /// countries data in [countryFolderPath] and all translation data in
  /// [translationFolderPath]
  @override
  FutureOr<void> build(BuildStep buildStep) async {
    try {
      final pubspecFile = File(pubspecPath);
      if (!pubspecFile.existsSync()) {
        throw FileSystemException(
            'Missing pubspec.yaml in ${pubspecFile.parent.absolute}');
      }

      // load pubspec settings
      final pubspec = loadYaml(pubspecFile.readAsStringSync()) as Map?;
      final config = pubspec?['country_generator'];
      final sourceFolderPath = config?['sourceFolder'] ?? 'countries';
      final outputFolderPath = config?['outputFolder'] ?? 'lib/gen';

      final dataFolder = Directory(normalize(
          join(pubspecFile.parent.path, sourceFolderPath, dataFolderPath)));
      if (!dataFolder.existsSync()) {
        throw FileSystemException(
            'Missing folder on ${dataFolder.absolute.path}');
      }

      final translationMap = _readTranslationData(dataFolder);
      final subdivisionData = _readSubdivisionData(dataFolder);
      final countryList =
          _readCountryData(dataFolder, translationMap, subdivisionData);

      final outputFile = File(normalize(
          join(pubspecFile.parent.path, outputFolderPath, outputFilePath)));
      if (!outputFile.existsSync()) {
        outputFile.createSync(recursive: true);
      }

      String countryImportOutput = '';
      String countryClassOutput = '';
      String countryAlpha3Output = '';
      for (final country in countryList) {
        countryImportOutput +=
            'import \'country/${country.alpha3.toLowerCase()}.g.dart\';\n';
        countryClassOutput += [
          '  /// Country: ${country.isoLongName}',
          '  static const Country ${country.alpha3.toLowerCase()} = country${country.alpha3};',
          '',
        ].join('\n');
        countryAlpha3Output += '        ${country.alpha3.toLowerCase()},\n';

        final countryFile = File(normalize(join(
            pubspecFile.parent.path,
            outputFolderPath,
            'country/${country.alpha3.toLowerCase()}.g.dart')));
        if (!countryFile.existsSync()) {
          countryFile.createSync(recursive: true);
        }

        final countryOutput = [
          'import \'../country.dart\';',
          '',
          'const country${country.alpha3} = ${country.toClassString()};'
        ].join('\n');

        countryFile.writeAsStringSync(countryOutput);
      }

      final output = [
        'import \'country.dart\';',
        '',
        countryImportOutput,
        '',
        '/// Class for storing all country object',
        'class Countries {',
        '  /// private constructor for preventing object construction',
        '  Countries._();',
        '',
        countryClassOutput,
        '',
        '  /// All countries in the world',
        'static const List<Country> values = [',
        countryAlpha3Output,
        '      ];',
        '}',
      ].join('\n');
      outputFile.writeAsStringSync(output);
    } catch (error, stackTrace) {
      log.shout(error);
      log.shout(stackTrace);
      rethrow;
    }
  }

  /// Define this is a aggregate builder bu returning synthetic input
  ///
  /// For more information on aggregate builder, see
  /// <https://github.com/dart-lang/build/blob/master/docs/writing_an_aggregate_builder.md>
  @override
  Map<String, List<String>> get buildExtensions => const {
        r'$lib$': ['country.g.dart']
      };

  Map<String, Map<String, String>> _readTranslationData(Directory dataFolder) {
    final translationFolder = Directory(
        normalize(join(dataFolder.absolute.path, translationFolderPath)));
    if (!translationFolder.existsSync()) {
      throw FileSystemException(
          'Missing translation folder on ${translationFolder.absolute.path}');
    }

    final allTranslationMap = <String, Map<String, String>>{};

    final translationFileList = translationFolder
        .listSync()
        .where((file) => file.uri.pathSegments.last.endsWith('.yaml'))
        .cast<File>();
    for (final translationFile in translationFileList) {
      final locale = RegExp('countries-(.*?).yaml')
          .firstMatch(translationFile.uri.pathSegments.last)
          ?.group(1);
      if (locale == null) continue;
      final translationData =
          (loadYamlNode(translationFile.readAsStringSync()) as YamlMap).toMap();
      for (final MapEntry(key: countryCode, value: translation)
          in translationData.entries) {
        if (!allTranslationMap.containsKey(countryCode)) {
          allTranslationMap[countryCode] = {locale: translation};
        } else {
          allTranslationMap[countryCode]!.addAll({locale: translation});
        }
      }
    }

    return allTranslationMap;
  }

  Map<String, List<Map<String, dynamic>>> _readSubdivisionData(
      Directory dataFolder) {
    final subdivisionFolder = Directory(
        normalize(join(dataFolder.absolute.path, subdivisionFolderPath)));
    if (!subdivisionFolder.existsSync()) {
      throw FileSystemException(
          'Missing subdivision folder on ${subdivisionFolder.absolute.path}');
    }

    final allSubdivisionMap = <String, List<Map<String, dynamic>>>{};

    final subdivisionFileList = subdivisionFolder
        .listSync()
        .where((file) => file.uri.pathSegments.last.endsWith('.yaml'))
        .cast<File>();
    for (final subdivisionFile in subdivisionFileList) {
      final countryCode = subdivisionFile.uri.pathSegments.last.substring(0, 2);
      final subdivisionData =
          (loadYamlNode(subdivisionFile.readAsStringSync()) as YamlMap).toMap();
      for (final MapEntry(key: _, value: data) in subdivisionData.entries) {
        if (!allSubdivisionMap.containsKey(countryCode)) {
          allSubdivisionMap[countryCode] = [data];
        } else {
          allSubdivisionMap[countryCode]!.addAll([data]);
        }
      }
    }

    return allSubdivisionMap;
  }

  List<Country> _readCountryData(
    Directory dataFolder,
    Map<String, Map<String, String>> allTranslationMap,
    Map<String, List<Map<String, dynamic>>> allSubdivisionMap,
  ) {
    final countryFolder =
        Directory(normalize(join(dataFolder.absolute.path, countryFolderPath)));
    if (!countryFolder.existsSync()) {
      throw FileSystemException(
          'Missing country folder on ${countryFolder.absolute.path}');
    }

    final List<Country> countryList = [];
    final countryFileList = countryFolder
        .listSync()
        .where((file) => file.uri.pathSegments.last.endsWith('.yaml'))
        .cast<File>();
    for (final countryFile in countryFileList) {
      final countryCode = countryFile.uri.pathSegments.last.substring(0, 2);
      final countryData =
          (loadYamlNode(countryFile.readAsStringSync(), recover: true)
                  as YamlMap)
              .toMap()[countryCode];
      countryData['isoShortNameByLocale'] = allTranslationMap[countryCode];
      countryData['subdivision'] = allSubdivisionMap[countryCode];

      final country = Country.fromJson(countryData);
      countryList.add(country);
    }

    return countryList;
  }
}
