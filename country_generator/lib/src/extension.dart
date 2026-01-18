import 'dart:convert';

import 'package:country/country.dart';
import 'package:yaml/yaml.dart';

/// Extension class for generating class string with [List<String>]
extension ListStringExtension on List<String> {
  String toClassString() {
    return '[${map((e) => '\'${e.replaceAll('\'', '\\\'')}\'').join(', ')}]';
  }
}

/// Extension class for generating class string with [List<int>]
extension ListIntExtension on List<int> {
  String toClassString() {
    return '[${join(', ')}]';
  }
}

/// Extension class for converting yaml map to map
extension YamlMapToMapExtension on YamlMap {
  dynamic _convertNode(dynamic node) {
    if (node is YamlMap) {
      return node.toMap();
    }

    if (node is YamlList) {
      var list = <dynamic>[];
      for (final item in node) {
        list.add(_convertNode(item));
      }
      return list;
    }

    return node;
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    nodes.forEach((k, v) {
      map[(k as YamlScalar).value.toString()] = _convertNode(v.value);
    });
    return map;
  }
}

/// Extension class for generating class string with [Country]
extension CountryClassStringExtension on Country {
  String toClassString() {
    return '''Country(
      alpha2: '${alpha2..replaceAll('\'', '\\\'')}',
      alpha3: '${alpha3..replaceAll('\'', '\\\'')}',
      continent: ${continent.toClassString()},
      countryCode: '${countryCode..replaceAll('\'', '\\\'')}',
      currencyCode: '${currencyCode..replaceAll('\'', '\\\'')}',
      distanceUnit: ${distanceUnit.toClassString()},
      gec: ${gec == null ? null : '\'${gec!.replaceAll('\'', '\\\'')}\''},
      geo: ${geo.toClassString()},
      internationalPrefix: ${internationalPrefix == null ? null : '\'${internationalPrefix!.replaceAll('\'', '\\\'')}\''},
      ioc: ${ioc == null ? null : '\'${ioc!.replaceAll('\'', '\\\'')}\''},
      isoLongName: '${isoLongName.replaceAll('\'', '\\\'')}',
      isoShortName: '${isoShortName.replaceAll('\'', '\\\'')}',
      isoShortNameLowerCase: ${isoShortNameLowerCase == null ? null : '\'${isoShortNameLowerCase!.replaceAll('\'', '\\\'')}\''},
      languagesOfficial: ${languagesOfficial.toClassString()},
      languagesSpoken: ${languagesSpoken.toClassString()},
      nationalDestinationCodeLengths: ${nationalDestinationCodeLengths.toClassString()},
      nationalNumberLengths: ${nationalNumberLengths.toClassString()},
      nationalPrefix: ${nationalPrefix == null ? null : '\'${nationalPrefix!.replaceAll('\'', '\\\'')}\''},
      nationality: ${nationality == null ? null : '\'${nationality!.replaceAll('\'', '\\\'')}\''},
      number: '${number..replaceAll('\'', '\\\'')}',
      postalCode: $postalCode,
      postalCodeFormat: ${postalCodeFormat == null ? null : 'r\'${postalCodeFormat!.replaceAll('\'', '\\\'')}\''},
      region: ${region?.toClassString()},
      startOfWeek: ${startOfWeek.toClassString()},
      subregion: ${subregion == null ? null : '\'${subregion!.replaceAll('\'', '\\\'')}\''},
      unLocode: '${unLocode..replaceAll('\'', '\\\'')}',
      unMember: $unMember,
      unofficialNames: ${unofficialNames.toClassString()},
      vehicleRegistrationCode: ${vehicleRegistrationCode == null ? null : '\'${vehicleRegistrationCode!.replaceAll('\'', '\\\'')}\''},
      worldRegion: ${worldRegion.toClassString()},
      addressFormat: ${addressFormat == null ? null : '\'\'\'$addressFormat\'\'\''},
      vatRates: ${vatRates?.toClassString()},
      nanpPrefix: ${nanpPrefix == null ? null : '\'${nanpPrefix!.replaceAll('\'', '\\\'')}\''},
      eeaMember: $eeaMember,
      euMember: $euMember,
      esmMember: $esmMember,
      altCurrency: ${altCurrency == null ? null : '\'${altCurrency!.replaceAll('\'', '\\\'')}\''},
      g7Member: $g7Member,
      g20Member: $g20Member,
      isoShortNameByLocale: ${json.encode(isoShortNameByLocale)},
      subdivision: ${subdivision.toClassString()},
      )''';
  }
}

/// Extension class for generating class string with [DistanceUnit]
extension DistanceUnitClassStringExtension on DistanceUnit {
  String toClassString() {
    switch (wireName) {
      case DistanceUnit.kilometresWireName:
        return 'DistanceUnit.kilometres';

      case DistanceUnit.milesWireName:
        return 'DistanceUnit.miles';

      default:
        throw ArgumentError('Unsupported wireName: $wireName');
    }
  }
}

/// Extension class for generating class string with [Coordinate]
extension CoordinateClassStringExtension on Coordinate {
  String toClassString() {
    return '''Coordinate(
    latitude: $latitude,
    longitude: $longitude,
    )''';
  }
}

/// Extension class for generating class string with [GeoData]
extension GeoDataClassStringExtension on GeoData {
  String toClassString() {
    return '''GeoData(
          coordinate: ${coordinate.toClassString()},
          maxCoordinate: ${maxCoordinate.toClassString()},
          minCoordinate: ${minCoordinate.toClassString()},
          boundary: ${boundary.toClassString()},
          )''';
  }
}

/// Extension class for generating class string with [BoundingBox]
extension BoundingBoxClassStringExtension on BoundingBox {
  String toClassString() {
    return '''BoundingBox(
    northeast: ${northeast.toClassString()},
    southwest: ${southwest.toClassString()},
    )''';
  }
}

/// Extension class for generating class string with [VatRates]
extension VatRatesClassStringExtension on VatRates {
  String toClassString() {
    return '''VatRates(
              standard: $standard,
              reduced: $reduced,
              superReduced: $superReduced,
              parking: $parking,
              )''';
  }
}

/// Extension class for generating class string with [Continent]
extension ContinentClassStringExtension on Continent {
  String toClassString() {
    switch (wireName) {
      case Continent.africaWireName:
        return 'Continent.africa';

      case Continent.antarcticaWireName:
        return 'Continent.antarctica';

      case Continent.asiaWireName:
        return 'Continent.asia';

      case Continent.australiaWireName:
        return 'Continent.australia';

      case Continent.europeWireName:
        return 'Continent.europe';

      case Continent.northAmericaWireName:
        return 'Continent.northAmerica';

      case Continent.southAmericaWireName:
        return 'Continent.southAmerica';

      default:
        throw ArgumentError('Unsupported wireName: $wireName');
    }
  }
}

/// Extension class for generating class string with [Region]
extension RegionClassStringExtension on Region {
  String toClassString() {
    switch (wireName) {
      case Region.europeWireName:
        return 'Region.europe';

      case Region.asiaWireName:
        return 'Region.asia';

      case Region.americasWireName:
        return 'Region.americas';

      case Region.africaWireName:
        return 'Region.africa';

      case Region.unknownWireName:
        return 'Region.unknown';

      case Region.oceaniaWireName:
        return 'Region.oceania';

      default:
        throw ArgumentError('Unsupported wireName: $wireName');
    }
  }
}

/// Extension class for generating class string with [Week]
extension WeekClassStringExtension on Week {
  String toClassString() {
    switch (wireName) {
      case Week.mondayWireName:
        return 'Week.monday';

      case Week.tuesdayWireName:
        return 'Week.tuesday';

      case Week.wednesdayWireName:
        return 'Week.wednesday';

      case Week.thursdayWireName:
        return 'Week.thursday';

      case Week.fridayWireName:
        return 'Week.friday';

      case Week.saturdayWireName:
        return 'Week.saturday';

      case Week.sundayWireName:
        return 'Week.sunday';

      default:
        throw ArgumentError('Unsupported wireName: $wireName');
    }
  }
}

/// Extension class for generating class string with [WorldRegion]
extension WorldRegionClassStringExtension on WorldRegion {
  String toClassString() {
    switch (wireName) {
      case WorldRegion.amerWireName:
        return 'WorldRegion.amer';

      case WorldRegion.apacWireName:
        return 'WorldRegion.apac';

      case WorldRegion.emeaWireName:
        return 'WorldRegion.emea';

      default:
        throw ArgumentError('Unsupported wireName: $wireName');
    }
  }
}

extension SubdivisionGeoDataClassStringExtension on SubdivisionGeoData {
  String toClassString() {
    return '''SubdivisionGeoData(
          latitude: $latitude,
          longitude: $longitude,
          maxLatitude: $maxLatitude,
          maxLongitude: $maxLongitude,
          minLatitude: $minLatitude,
          minLongitude: $minLongitude,
          )''';
  }
}

extension SubdivisionClassStringExtension on Subdivision {
  String toClassString() {
    return '''Subdivision(
              name: '${name.replaceAll('\'', '\\\'')}',
              code: '$code',
              geo: ${geo?.toClassString()},
              translation: ${json.encode(translation)},
              type: '$type',
              )''';
  }
}

/// Extension class for generating class string with [List<int>]
extension ListSubdivisionExtension on List<Subdivision> {
  String toClassString() {
    return '[${map((e) => e.toClassString()).join(',')}]';
  }
}
