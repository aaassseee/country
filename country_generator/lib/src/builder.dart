import 'dart:async';
import 'dart:io';

import 'package:build/build.dart';
import 'package:collection/collection.dart';
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
      final generate = config?['generate'] ?? 'country';
      final sourceFolderPath = config?['sourceFolder'] ?? 'countries';
      final outputFolderPath = config?['outputFolder'] ?? 'lib/gen';

      final dataFolder = Directory(normalize(
          join(pubspecFile.parent.path, sourceFolderPath, dataFolderPath)));
      if (!dataFolder.existsSync()) {
        throw FileSystemException(
            'Missing folder on ${dataFolder.absolute.path}');
      }

      if (generate == 'country_subdivision') {
        _buildCountrySubdivision(
          pubspecFile: pubspecFile,
          dataFolder: dataFolder,
          outputFolderPath: outputFolderPath,
        );
        return;
      }

      final translationMap = _readTranslationData(dataFolder);
      final countryList = _readCountryData(dataFolder, translationMap);

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
        r'$lib$': ['country.g.dart', 'country_subdivision.g.dart']
      };

  void _buildCountrySubdivision({
    required File pubspecFile,
    required Directory dataFolder,
    required String outputFolderPath,
  }) {
    final countryFolder =
        Directory(normalize(join(dataFolder.absolute.path, countryFolderPath)));
    if (!countryFolder.existsSync()) {
      throw FileSystemException(
          'Missing country folder on ${countryFolder.absolute.path}');
    }

    final subdivisionFolder = Directory(
        normalize(join(dataFolder.absolute.path, subdivisionFolderPath)));
    if (!subdivisionFolder.existsSync()) {
      throw FileSystemException(
          'Missing subdivision folder on ${subdivisionFolder.absolute.path}');
    }

    final subdivisionFileList = subdivisionFolder
        .listSync()
        .where((file) => file.uri.pathSegments.last.endsWith('.yaml'))
        .sortedBy((file) => file.uri.pathSegments.last)
        .cast<File>();

    var subdivisionImportOutput = '';
    var subdivisionClassOutput = '';
    var subdivisionValuesOutput = '';
    var subdivisionByCountryOutput = '';

    for (final subdivisionFile in subdivisionFileList) {
      final countryCode = subdivisionFile.uri.pathSegments.last.substring(0, 2);
      final countryCodeLower = countryCode.toLowerCase();
      final countryAlpha3Lower =
          _countryAlpha3(countryFolder, countryCode).toLowerCase();
      final subdivisionData =
          (loadYamlNode(subdivisionFile.readAsStringSync(), recover: true)
                  as YamlMap)
              .toMap();

      subdivisionImportOutput +=
          'import \'country_subdivision/$countryCodeLower.g.dart\';\n';

      final countrySubdivisionFile = File(normalize(join(
          pubspecFile.parent.path,
          outputFolderPath,
          'country_subdivision/$countryCodeLower.g.dart')));
      if (!countrySubdivisionFile.existsSync()) {
        countrySubdivisionFile.createSync(recursive: true);
      }

      var countrySubdivisionOutput =
          'import \'../country_subdivision.dart\';\n';
      var countrySubdivisionAlpha2Output = '';
      for (final MapEntry(key: code, value: value) in subdivisionData.entries) {
        final subdivisionCode = code.toString();
        final variableName =
            _countrySubdivisionVariableName(countryCode, subdivisionCode);
        final subdivision = Map<String, dynamic>.from(value as Map);
        countrySubdivisionOutput += [
          '',
          'const $variableName = CountrySubdivision(',
          '  countryCode: \'$countryCode\',',
          '  code: \'${_escapeDartString((subdivision['code'] ?? subdivisionCode).toString())}\',',
          '  name: \'${_escapeDartString(subdivision['name'].toString())}\',',
          '  unofficialNames: ${_stringListClassString(subdivision['unofficial_names'])},',
          '  geo: ${_subdivisionGeoClassString(subdivision['geo'])},',
          '  translations: ${_stringMapClassString(subdivision['translations'])},',
          '  type: ${_nullableStringClassString(subdivision['type'])},',
          ');',
        ].join('\n');

        countrySubdivisionAlpha2Output += '        $variableName,\n';
        subdivisionValuesOutput += '        $variableName,\n';
      }

      countrySubdivisionFile.writeAsStringSync(countrySubdivisionOutput);

      subdivisionClassOutput += [
        '  /// Country subdivisions for $countryCode.',
        '  static const List<CountrySubdivision> $countryAlpha3Lower = [',
        countrySubdivisionAlpha2Output,
        '      ];',
        '',
      ].join('\n');

      subdivisionByCountryOutput +=
          '        \'$countryCode\': $countryAlpha3Lower,\n';
    }

    final outputFile = File(normalize(join(pubspecFile.parent.path,
        outputFolderPath, 'country_subdivision.g.dart')));
    if (!outputFile.existsSync()) {
      outputFile.createSync(recursive: true);
    }

    final output = [
      'import \'country_subdivision.dart\';',
      '',
      subdivisionImportOutput,
      '',
      '/// Class for storing all country subdivision objects.',
      'class CountrySubdivisions {',
      '  /// Private constructor for preventing object construction.',
      '  CountrySubdivisions._();',
      '',
      subdivisionClassOutput,
      '  /// All country subdivisions.',
      '  static const List<CountrySubdivision> values = [',
      subdivisionValuesOutput,
      '      ];',
      '',
      '  /// Country subdivisions grouped by ISO 3166-1 alpha-2 country code.',
      '  static const Map<String, List<CountrySubdivision>> byCountryCode = {',
      subdivisionByCountryOutput,
      '      };',
      '',
      '  /// Returns subdivisions for [countryCode].',
      '  static List<CountrySubdivision> byCountry(String countryCode) {',
      '    return byCountryCode[countryCode.toUpperCase()] ?? const [];',
      '  }',
      '',
      '  /// Returns the subdivision matching [countryCode] and [code], or `null`.',
      '  static CountrySubdivision? maybeByCode(String countryCode, String code) {',
      '    for (final subdivision in byCountry(countryCode)) {',
      '      if (subdivision.code == code) return subdivision;',
      '    }',
      '    return null;',
      '  }',
      '',
      '  /// Returns the subdivision matching [countryCode] and [code].',
      '  static CountrySubdivision byCode(String countryCode, String code) {',
      '    final subdivision = maybeByCode(countryCode, code);',
      '    if (subdivision == null) {',
      '      throw ArgumentError(\'Unsupported subdivision code: \$countryCode-\$code\');',
      '    }',
      '    return subdivision;',
      '  }',
      '}',
    ].join('\n');

    outputFile.writeAsStringSync(output);
  }

  String _countrySubdivisionVariableName(String countryCode, String code) {
    final normalizedCode =
        code.replaceAll(RegExp('[^a-zA-Z0-9]'), '').toLowerCase();
    return 'countrySubdivision${countryCode.toUpperCase()}${normalizedCode[0].toUpperCase()}${normalizedCode.substring(1)}';
  }

  String _countryAlpha3(Directory countryFolder, String countryCode) {
    final countryFile = File(normalize(
      join(countryFolder.absolute.path, '${countryCode.toUpperCase()}.yaml'),
    ));
    if (!countryFile.existsSync()) {
      throw FileSystemException('Missing country file', countryFile.path);
    }

    final countryData =
        (loadYamlNode(countryFile.readAsStringSync(), recover: true) as YamlMap)
            .toMap()[countryCode.toUpperCase()];
    return countryData['alpha3'].toString();
  }

  String _subdivisionGeoClassString(dynamic geo) {
    if (geo == null) return 'null';
    final map = Map<String, dynamic>.from(geo as Map);
    if (map['latitude'] == null || map['longitude'] == null) return 'null';
    final maxCoordinate = map['max_latitude'] == null ||
            map['max_longitude'] == null
        ? 'null'
        : 'CountrySubdivisionCoordinate(latitude: ${map['max_latitude']}, longitude: ${map['max_longitude']})';
    final minCoordinate = map['min_latitude'] == null ||
            map['min_longitude'] == null
        ? 'null'
        : 'CountrySubdivisionCoordinate(latitude: ${map['min_latitude']}, longitude: ${map['min_longitude']})';

    return 'CountrySubdivisionGeoData(coordinate: CountrySubdivisionCoordinate(latitude: ${map['latitude']}, longitude: ${map['longitude']}), maxCoordinate: $maxCoordinate, minCoordinate: $minCoordinate)';
  }

  String _stringListClassString(dynamic values) {
    return '[${List<String>.from(values ?? []).map((value) => '\'${_escapeDartString(value)}\'').join(', ')}]';
  }

  String _stringMapClassString(dynamic values) {
    if (values == null) return '{}';
    final entries = Map<String, dynamic>.from(values as Map).entries.map((entry) =>
        '\'${_escapeDartString(entry.key)}\': \'${_escapeDartString(entry.value.toString())}\'');
    return '{${entries.join(', ')}}';
  }

  String _nullableStringClassString(dynamic value) {
    return value == null
        ? 'null'
        : '\'${_escapeDartString(value.toString())}\'';
  }

  String _escapeDartString(String value) {
    return value.replaceAll('\\', '\\\\').replaceAll('\'', '\\\'');
  }

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
        .sortedBy((element) => element.uri.pathSegments.last)
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

  List<Country> _readCountryData(
    Directory dataFolder,
    Map<String, Map<String, String>> allTranslationMap,
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
        .sortedBy((file) => file.uri.pathSegments.last)
        .cast<File>();
    for (final countryFile in countryFileList) {
      final countryCode = countryFile.uri.pathSegments.last.substring(0, 2);
      final countryData =
          (loadYamlNode(countryFile.readAsStringSync(), recover: true)
                  as YamlMap)
              .toMap()[countryCode];
      countryData['isoShortNameByLocale'] = allTranslationMap[countryCode];

      final country = Country.fromJson(countryData);
      countryList.add(country);
    }

    return countryList;
  }
}
