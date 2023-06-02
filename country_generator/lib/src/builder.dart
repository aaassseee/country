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
      final countryList = _readCountryData(dataFolder, translationMap);

      final outputFile = File(normalize(
          join(pubspecFile.parent.path, outputFolderPath, outputFilePath)));
      if (!outputFile.existsSync()) {
        outputFile.createSync(recursive: true);
      }

      String output = '';
      output += 'part of \'country.dart\';\n\n';
      output += '/// Class for storing all country object\n';
      output += 'class Countries {\n';
      output +=
          '  /// private constructor for preventing object construction\n';
      output += '  Countries._();\n';
      for (final country in countryList) {
        output += '''
  
  /// Country: ${country.isoLongName}
  static const Country ${country.alpha3.toLowerCase()} = ${country.toClassString()};
''';
      }

      output += '''
  
  /// All countries in the world
  static List<Country> get values => [
        ${countryList.map((country) => country.alpha3.toLowerCase()).join(',\n        ')}
      ];
''';
      output += '}';
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

  List<Country> _readCountryData(Directory dataFolder,
      Map<String, Map<String, String>> allTranslationMap) {
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
          (loadYamlNode(countryFile.readAsStringSync()) as YamlMap)
              .toMap()[countryCode];
      countryData['isoShortNameByLocale'] = allTranslationMap[countryCode];

      final country = Country.fromJson(countryData);
      countryList.add(country);
    }

    return countryList;
  }
}
