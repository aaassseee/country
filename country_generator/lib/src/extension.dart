import 'dart:convert';

import 'package:country/country.dart';

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

/// Extension class for generating class string with [Country]
extension CountryClassStringExtension on Country {
  String toClassString() {
    return '''Country(
      '${alpha2..replaceAll('\'', '\\\'')}',
      '${alpha3..replaceAll('\'', '\\\'')}',
      ${continent.toClassString()},
      '${countryCode..replaceAll('\'', '\\\'')}',
      '${currencyCode..replaceAll('\'', '\\\'')}',
      ${gec == null ? null : '\'${gec!.replaceAll('\'', '\\\'')}\''},
      ${geo.toClassString()},
      '${internationalPrefix..replaceAll('\'', '\\\'')}',
      ${ioc == null ? null : '\'${ioc!.replaceAll('\'', '\\\'')}\''},
      '${isoLongName.replaceAll('\'', '\\\'')}',
      '${isoShortName.replaceAll('\'', '\\\'')}',
      ${languagesOfficial.toClassString()},
      ${languagesSpoken.toClassString()},
      ${nationalDestinationCodeLengths.toClassString()},
      ${nationalNumberLengths.toClassString()},
      '${nationalPrefix..replaceAll('\'', '\\\'')}',
      '${nationality..replaceAll('\'', '\\\'')}',
      '${number..replaceAll('\'', '\\\'')}',
      $postalCode,
      ${postalCodeFormat == null ? null : 'r\'${postalCodeFormat!.replaceAll('\'', '\\\'')}\''},
      ${region.toClassString()},
      ${startOfWeek.toClassString()},
      '${subregion..replaceAll('\'', '\\\'')}',
      '${unLocode..replaceAll('\'', '\\\'')}',
      ${unofficialNames.toClassString()},
      ${worldRegion.toClassString()},
      ${addressFormat == null ? null : '\'\'\'$addressFormat\'\'\''},
      ${vatRates?.toClassString()},
      ${nanpPrefix == null ? null : '\'${nanpPrefix!.replaceAll('\'', '\\\'')}\''},
      $eeaMember,
      $euMember,
      $esmMember,
      ${altCurrency == null ? null : '\'${altCurrency!.replaceAll('\'', '\\\'')}\''},
      ${json.encode(isoShortNameByLanguage)})''';
  }
}

/// Extension class for generating class string with [Coordinate]
extension CoordinateClassStringExtension on Coordinate {
  String toClassString() {
    return 'Coordinate($latitude, $longitude)';
  }
}

/// Extension class for generating class string with [GeoData]
extension GeoDataClassStringExtension on GeoData {
  String toClassString() {
    return '''GeoData(
          ${coordinate.toClassString()},
          ${maxCoordinate.toClassString()},
          ${minCoordinate.toClassString()},
          ${boundary.toClassString()},
          ${longitudeDec == null ? null : '\'${longitudeDec!.replaceAll('\'', '\\\'')}\''})''';
  }
}

/// Extension class for generating class string with [BoundingBox]
extension BoundingBoxClassStringExtension on BoundingBox {
  String toClassString() {
    return '''BoundingBox(${northeast.toClassString()},
              ${southwest.toClassString()})''';
  }
}

/// Extension class for generating class string with [VatRates]
extension VatRatesClassStringExtension on VatRates {
  String toClassString() {
    return '''VatRates(
              $standard, $reduced,
              $superReduced, $parking)''';
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
