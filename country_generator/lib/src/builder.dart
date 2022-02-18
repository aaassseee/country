import 'dart:async';
import 'dart:convert';
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
  /// countries.json in [countryJsonFilePath] and all locale json in [localeFolderPath]
  @override
  FutureOr<void> build(BuildStep buildStep) async {
    try {
      final pubspecFile = File(pubspecPath);
      if (!pubspecFile.existsSync()) {
        throw FileSystemException(
            'Missing pubspec.yaml in ${pubspecFile.parent.absolute}');
      }

      final pubspec = loadYaml(pubspecFile.readAsStringSync()) as Map?;
      final config = pubspec?['country_generator'];
      final sourceFolderPath = config?['sourceFolder'] ?? 'countries';
      final outputFolderPath = config?['outputFolder'] ?? 'lib/gen';

      final sourceFolder = Directory(normalize(
          join(pubspecFile.parent.path, sourceFolderPath, cacheFolderPath)));
      if (!sourceFolder.existsSync()) {
        throw FileSystemException(
            'Missing folder on ${sourceFolder.absolute.path}');
      }

      final localeFolder = Directory(
          normalize(join(sourceFolder.absolute.path, localeFolderPath)));
      if (!localeFolder.existsSync()) {
        throw FileSystemException(
            'Missing folder on ${localeFolder.absolute.path}');
      }

      Map<String, Map<String, String>> localeMap = {};
      for (final localeFile in localeFolder.listSync().whereType<File>()) {
        if (!localeFile.uri.pathSegments.last.endsWith('.json')) {
          continue;
        }

        localeMap.addAll({
          localeFile.uri.pathSegments.last.replaceAll('.json', ''):
              (json.decode(localeFile.readAsStringSync()) as Map)
                  .cast<String, String>()
        });
      }

      Map<String, Map<String, String>> processedLocaleMap = {};
      localeMap.forEach((key, value) {
        value.forEach((countryCode, countryName) {
          if (!processedLocaleMap.containsKey(countryCode)) {
            processedLocaleMap[countryCode] = {key: countryName};
          } else {
            processedLocaleMap[countryCode]!.addAll({key: countryName});
          }
        });
      });

      final countryJsonFile = File(
          normalize(join(sourceFolder.absolute.path, countryJsonFilePath)));
      if (!countryJsonFile.existsSync()) {
        throw FileSystemException(
            'Missing countries.json in ${sourceFolder.absolute}');
      }

      final countryJson =
          json.decode(countryJsonFile.readAsStringSync()) as Map;
      final countryList = countryJson.values
          .map((country) => Country.fromJson(country))
          .toList();
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
        country.isoShortNameByLanguage
            .addAll(processedLocaleMap[country.alpha2]!);
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
}
