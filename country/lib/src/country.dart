class Country {
  const Country(
      this.alpha2,
      this.alpha3,
      this.continent,
      this.countryCode,
      this.currencyCode,
      this.gec,
      this.geo,
      this.internationalPrefix,
      this.ioc,
      this.isoLongName,
      this.isoShortName,
      this.languagesOfficial,
      this.languagesSpoken,
      this.nationalDestinationCodeLengths,
      this.nationalNumberLengths,
      this.nationalPrefix,
      this.nationality,
      this.number,
      this.postalCode,
      this.postalCodeFormat,
      this.region,
      this.startOfWeek,
      this.subregion,
      this.unLocode,
      this.unofficialNames,
      this.worldRegion,
      this.addressFormat,
      this.vatRates,
      this.nanpPrefix,
      this.eeaMember,
      this.euMember,
      this.esmMember,
      this.altCurrency,
      this.isoShortNameByLanguage);

  factory Country.fromJson(Map<String, dynamic> json) => Country(
      json['alpha2'],
      json['alpha3'],
      Continent.fromWireName(json['continent']),
      json['country_code'],
      json['currency_code'],
      json['gec'],
      GeoData.fromJson(json['geo']),
      json['international_prefix'],
      json['ioc'],
      json['iso_long_name'],
      json['iso_short_name'],
      List<String>.from(json['languages_official']),
      List<String>.from(json['languages_spoken']),
      List<int>.from(json['national_destination_code_lengths']),
      List<int>.from(json['national_number_lengths']),
      json['national_prefix'],
      json['nationality'],
      json['number'],
      json['postal_code'],
      json['postal_code_format'],
      Region.fromWireName(json['region']),
      json['start_of_week'],
      json['subregion'],
      json['un_locode'],
      List<String>.from(json['unofficial_names']),
      WorldRegion.fromWireName(json['world_region']),
      json['address_format'],
      json['vat_rates'] == null ? null : VatRates.fromJson(json['vat_rates']),
      json['nanp_prefix'],
      json['eea_member'],
      json['eu_member'],
      json['esm_member'],
      json['alt_currency'], {});

  final String alpha2;
  final String alpha3;
  final Continent continent;
  final String countryCode;
  final String currencyCode;
  final String? gec;
  final GeoData geo;
  final String internationalPrefix;
  final String? ioc;
  final String isoLongName;
  final String isoShortName;
  final List<String> languagesOfficial;
  final List<String> languagesSpoken;
  final List<int> nationalDestinationCodeLengths;
  final List<int> nationalNumberLengths;
  final String nationalPrefix;
  final String nationality;
  final String number;
  final bool postalCode;
  final String? postalCodeFormat;
  final Region region;
  final String startOfWeek;
  final String subregion;
  final String unLocode;
  final List<String> unofficialNames;
  final WorldRegion worldRegion;

  final String? addressFormat;
  final VatRates? vatRates;
  final String? nanpPrefix;
  final bool? eeaMember;
  final bool? euMember;
  final bool? esmMember;
  final String? altCurrency;

  final Map<String, String> isoShortNameByLanguage;

  @override
  String toString() {
    return 'Country{alpha2: $alpha2, alpha3: $alpha3, continent: $continent, countryCode: $countryCode, currencyCode: $currencyCode, gec: $gec, geo: $geo, internationalPrefix: $internationalPrefix, ioc: $ioc, isoLongName: $isoLongName, isoShortName: $isoShortName, languagesOfficial: $languagesOfficial, languagesSpoken: $languagesSpoken, nationalDestinationCodeLengths: $nationalDestinationCodeLengths, nationalNumberLengths: $nationalNumberLengths, nationalPrefix: $nationalPrefix, nationality: $nationality, number: $number, postalCode: $postalCode, postalCodeFormat: $postalCodeFormat, region: $region, startOfWeek: $startOfWeek, subregion: $subregion, unLocode: $unLocode, unofficialNames: $unofficialNames, worldRegion: $worldRegion, addressFormat: $addressFormat, vatRates: $vatRates, nanpPrefix: $nanpPrefix, eeaMember: $eeaMember, euMember: $euMember, esmMember: $esmMember, altCurrency: $altCurrency, isoShortNameByLanguage: $isoShortNameByLanguage}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Country &&
          runtimeType == other.runtimeType &&
          alpha2 == other.alpha2 &&
          alpha3 == other.alpha3 &&
          continent == other.continent &&
          countryCode == other.countryCode &&
          currencyCode == other.currencyCode &&
          gec == other.gec &&
          geo == other.geo &&
          internationalPrefix == other.internationalPrefix &&
          ioc == other.ioc &&
          isoLongName == other.isoLongName &&
          isoShortName == other.isoShortName &&
          languagesOfficial == other.languagesOfficial &&
          languagesSpoken == other.languagesSpoken &&
          nationalDestinationCodeLengths ==
              other.nationalDestinationCodeLengths &&
          nationalNumberLengths == other.nationalNumberLengths &&
          nationalPrefix == other.nationalPrefix &&
          nationality == other.nationality &&
          number == other.number &&
          postalCode == other.postalCode &&
          postalCodeFormat == other.postalCodeFormat &&
          region == other.region &&
          startOfWeek == other.startOfWeek &&
          subregion == other.subregion &&
          unLocode == other.unLocode &&
          unofficialNames == other.unofficialNames &&
          worldRegion == other.worldRegion &&
          addressFormat == other.addressFormat &&
          vatRates == other.vatRates &&
          nanpPrefix == other.nanpPrefix &&
          eeaMember == other.eeaMember &&
          euMember == other.euMember &&
          esmMember == other.esmMember &&
          altCurrency == other.altCurrency &&
          isoShortNameByLanguage == other.isoShortNameByLanguage;

  @override
  int get hashCode =>
      alpha2.hashCode ^
      alpha3.hashCode ^
      continent.hashCode ^
      countryCode.hashCode ^
      currencyCode.hashCode ^
      gec.hashCode ^
      geo.hashCode ^
      internationalPrefix.hashCode ^
      ioc.hashCode ^
      isoLongName.hashCode ^
      isoShortName.hashCode ^
      languagesOfficial.hashCode ^
      languagesSpoken.hashCode ^
      nationalDestinationCodeLengths.hashCode ^
      nationalNumberLengths.hashCode ^
      nationalPrefix.hashCode ^
      nationality.hashCode ^
      number.hashCode ^
      postalCode.hashCode ^
      postalCodeFormat.hashCode ^
      region.hashCode ^
      startOfWeek.hashCode ^
      subregion.hashCode ^
      unLocode.hashCode ^
      unofficialNames.hashCode ^
      worldRegion.hashCode ^
      addressFormat.hashCode ^
      vatRates.hashCode ^
      nanpPrefix.hashCode ^
      eeaMember.hashCode ^
      euMember.hashCode ^
      esmMember.hashCode ^
      altCurrency.hashCode ^
      isoShortNameByLanguage.hashCode;
}

class Coordinate {
  const Coordinate(this.latitude, this.longitude);

  final double latitude;
  final double longitude;

  @override
  String toString() {
    return 'Coordinate{latitude: $latitude, longitude: $longitude}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Coordinate &&
          runtimeType == other.runtimeType &&
          latitude == other.latitude &&
          longitude == other.longitude;

  @override
  int get hashCode => latitude.hashCode ^ longitude.hashCode;
}

class GeoData {
  const GeoData(this.coordinate, this.maxCoordinate, this.minCoordinate,
      this.boundary, this.longitudeDec);

  factory GeoData.fromJson(Map<String, dynamic> json) => GeoData(
      Coordinate(json['latitude'].toDouble(), json['longitude'].toDouble()),
      Coordinate(
          json['max_latitude'].toDouble(), json['max_longitude'].toDouble()),
      Coordinate(
          json['min_latitude'].toDouble(), json['min_longitude'].toDouble()),
      Boundary.fromJson(json['bounds']),
      json['longitude_dec']);

  final Coordinate coordinate;
  final Coordinate maxCoordinate;
  final Coordinate minCoordinate;
  final Boundary boundary;
  final String? longitudeDec;

  @override
  String toString() {
    return 'GeoData{coordinate: $coordinate, maxCoordinate: $maxCoordinate, minCoordinate: $minCoordinate, boundary: $boundary, longitudeDec: $longitudeDec}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GeoData &&
          runtimeType == other.runtimeType &&
          coordinate == other.coordinate &&
          maxCoordinate == other.maxCoordinate &&
          minCoordinate == other.minCoordinate &&
          boundary == other.boundary &&
          longitudeDec == other.longitudeDec;

  @override
  int get hashCode =>
      coordinate.hashCode ^
      maxCoordinate.hashCode ^
      minCoordinate.hashCode ^
      boundary.hashCode ^
      longitudeDec.hashCode;
}

class Boundary {
  const Boundary(this.northeast, this.southwest);

  factory Boundary.fromJson(Map<String, dynamic> json) => Boundary(
      Coordinate(json['northeast']['lat'].toDouble(),
          json['northeast']['lng'].toDouble()),
      Coordinate(json['southwest']['lat'].toDouble(),
          json['southwest']['lng'].toDouble()));

  final Coordinate northeast;
  final Coordinate southwest;

  @override
  String toString() {
    return 'Boundary{northeast: $northeast, southwest: $southwest}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Boundary &&
          runtimeType == other.runtimeType &&
          northeast == other.northeast &&
          southwest == other.southwest;

  @override
  int get hashCode => northeast.hashCode ^ southwest.hashCode;
}

class VatRates {
  const VatRates(this.standard, this.reduced, this.superReduced, this.parking);

  factory VatRates.fromJson(Map<String, dynamic> json) => VatRates(
      json['standard'].toDouble(),
      List.from(json['reduced'])
          .map((e) => e.toDouble())
          .cast<double>()
          .toList(),
      json['super_reduced']?.toDouble(),
      json['parking']?.toDouble());

  final double standard;

  final List<double> reduced;

  final double? superReduced;

  final double? parking;

  @override
  String toString() {
    return 'VatRates{standard: $standard, reduced: $reduced, superReduced: $superReduced, parking: $parking}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VatRates &&
          runtimeType == other.runtimeType &&
          standard == other.standard &&
          reduced == other.reduced &&
          superReduced == other.superReduced &&
          parking == other.parking;

  @override
  int get hashCode =>
      standard.hashCode ^
      reduced.hashCode ^
      superReduced.hashCode ^
      parking.hashCode;
}

class Continent {
  const Continent._(this.wireName);

  factory Continent.fromWireName(String wireName) {
    switch (wireName) {
      case africaWireName:
        return africa;

      case antarcticaWireName:
        return antarctica;

      case asiaWireName:
        return asia;

      case australiaWireName:
        return australia;

      case europeWireName:
        return europe;

      case northAmericaWireName:
        return northAmerica;

      case southAmericaWireName:
        return southAmerica;

      default:
        throw ArgumentError('Unsupported wireName: $wireName');
    }
  }

  final String wireName;

  static const africaWireName = "Africa";

  static const antarcticaWireName = "Antarctica";

  static const asiaWireName = "Asia";

  static const australiaWireName = "Australia";

  static const europeWireName = "Europe";

  static const northAmericaWireName = "North America";

  static const southAmericaWireName = "South America";

  static const africa = Continent._(africaWireName);

  static const antarctica = Continent._(antarcticaWireName);

  static const asia = Continent._(asiaWireName);

  static const australia = Continent._(australiaWireName);

  static const europe = Continent._(europeWireName);

  static const northAmerica = Continent._(northAmericaWireName);

  static const southAmerica = Continent._(southAmericaWireName);

  static get values =>
      [africa, antarctica, asia, australia, europe, northAmerica, southAmerica];

  @override
  String toString() {
    return 'Continent{wireName: $wireName}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Continent &&
          runtimeType == other.runtimeType &&
          wireName == other.wireName;

  @override
  int get hashCode => wireName.hashCode;
}

class Region {
  const Region._(this.wireName);

  factory Region.fromWireName(String wireName) {
    switch (wireName) {
      case europeWireName:
        return europe;

      case asiaWireName:
        return asia;

      case americasWireName:
        return americas;

      case africaWireName:
        return africa;

      case unknownWireName:
        return unknown;

      case oceaniaWireName:
        return oceania;

      default:
        throw ArgumentError('UnSupported wireName: $wireName');
    }
  }

  final String wireName;

  static const europeWireName = 'Europe';

  static const asiaWireName = 'Asia';

  static const americasWireName = 'Americas';

  static const africaWireName = 'Africa';

  static const unknownWireName = '';

  static const oceaniaWireName = 'Oceania';

  static const europe = Region._(europeWireName);

  static const asia = Region._(asiaWireName);

  static const americas = Region._(americasWireName);

  static const africa = Region._(africaWireName);

  static const unknown = Region._(unknownWireName);

  static const oceania = Region._(oceaniaWireName);

  static get values => [europe, asia, americas, africa, unknown, oceania];

  @override
  String toString() {
    return 'Region{wireName: $wireName}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Region &&
          runtimeType == other.runtimeType &&
          wireName == other.wireName;

  @override
  int get hashCode => wireName.hashCode;
}

class WorldRegion {
  const WorldRegion._(this.wireName);

  factory WorldRegion.fromWireName(String wireName) {
    switch (wireName) {
      case amerWireName:
        return amer;

      case apacWireName:
        return apac;

      case emeaWireName:
        return emea;

      default:
        throw ArgumentError();
    }
  }

  final String wireName;

  static const amerWireName = 'AMER';

  static const apacWireName = 'APAC';

  static const emeaWireName = 'EMEA';

  static const amer = WorldRegion._(amerWireName);

  static const apac = WorldRegion._(apacWireName);

  static const emea = WorldRegion._(emeaWireName);

  static get values => [amer, apac, emea];

  @override
  String toString() {
    return 'WorldRegion{wireName: $wireName}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WorldRegion &&
          runtimeType == other.runtimeType &&
          wireName == other.wireName;

  @override
  int get hashCode => wireName.hashCode;
}
