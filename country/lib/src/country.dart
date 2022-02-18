part 'country.g.dart';

/// Class for storing information of the country
class Country {
  /// Creates country
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

  /// Creates a country with a decoded json object from [countries](https://github.com/countries/countries)
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
      Week.fromWireName(json['start_of_week']),
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

  /// ISO 3166-1 alpha-2 codes are two-letter country codes defined in
  /// ISO 3166-1, part of the ISO 3166 standard published by the International
  /// Organization for Standardization (ISO), to represent countries, dependent
  /// territories, and special areas of geographical interest.
  final String alpha2;

  /// ISO 3166-1 alpha-3 codes are three-letter country codes defined in
  /// ISO 3166-1, part of the ISO 3166 standard published by the International
  /// Organization for Standardization (ISO), to represent countries, dependent
  /// territories, and special areas of geographical interest.
  final String alpha3;

  /// The continent that this country belongs to.
  final Continent continent;

  /// Country calling codes or country dial-in codes are telephone number
  /// prefixes for reaching telephone subscribers in the networks of the member
  /// countries or regions of the International Telecommunication Union (ITU).
  ///
  /// The prefixes enable international direct dialing (IDD) and are also
  /// referred to as international subscriber dialing (ISD) codes.
  final String countryCode;

  /// ISO 4217 is a standard published by International Organization for
  /// Standardization (ISO) that defines alpha codes and numeric codes for the
  /// representation of currencies and provides information about the
  /// relationships between individual currencies and their minor units.
  final String currencyCode;

  /// The FIPS 10-4 standard, Countries, Dependencies, Areas of Special
  /// Sovereignty, and Their Principal Administrative Divisions, was a list of
  /// two-letter country codes that were used by the U.S. Government for
  /// geographical data processing in many publications.
  ///
  /// The FIPS 10-4 codes are similar to (but sometimes incompatible with) the
  /// [alpha2]. The standard also includes codes for the top-level subdivision
  /// of the countries, similar to but usually incompatible with the
  /// ISO 3166-2 standard.
  final String? gec;

  /// The geographic coordinate system (GCS) is a spherical or ellipsoidal
  /// coordinate system for measuring and communicating positions directly on
  /// the Earth as latitude and longitude.
  ///
  /// It is the simplest, oldest and most widely used of the thousands of
  /// spatial reference systems that are in use, and forms the basis for most
  /// others.
  final GeoData geo;

  /// An international call prefix or dial out code is a trunk prefix used to
  /// select an international telephone circuit for placing an international
  /// call.
  ///
  /// It is now called an IDD prefix (international direct dialing) – a country
  /// will typically have an NDD prefix as well (national direct dialing).
  final String internationalPrefix;

  /// The International Olympic Committee (IOC) uses three-letter abbreviation
  /// country codes to refer to each group of athletes that participate in
  /// the Olympic Games.
  ///
  /// Each geocode usually identifies a National Olympic Committee (NOC), but
  /// there are several codes that have been used for other instances in past
  /// Games, such as teams composed of athletes from multiple nations, or groups
  /// of athletes not formally representing any nation.
  final String? ioc;

  /// Country full name which is defined by ISO 3166-1, a standard defining
  /// codes for the names of countries, dependent territories, and special areas
  /// of geographical interest.
  final String isoLongName;

  /// Country short name which is defined by ISO 3166-1, a standard defining
  /// codes for the names of countries, dependent territories, and special areas
  /// of geographical interest.
  final String isoShortName;

  /// An official language is a language given a special status in a particular
  /// country, state, or other jurisdiction.
  ///
  /// Typically the term "official language" does not refer to the language used
  /// by a people or country, but by its government
  /// (e.g. judiciary, legislature, and/or administration).
  final List<String> languagesOfficial;

  /// This list shows countries/disputed countries organized by the languages
  /// which are spoken there.
  final List<String> languagesSpoken;

  /// National Destination Code (NDC or NXX), commonly referred to as an
  /// International City Code or Number Plan Area or Area Code or significant
  /// leading digits of National Significant Number, is specified in ITU-T E.164.
  final List<int> nationalDestinationCodeLengths;

  /// The lengths of national numbers valid for this country.
  ///
  /// These lengths represent numbers without the country code. For example,
  /// some European countries like Italy have variable national number lengths
  /// between 8 to 12.
  final List<int> nationalNumberLengths;

  /// The phone prefix used in this country for dialing national numbers
  final String nationalPrefix;

  /// Nationality is a legal identification of a person in international law,
  /// establishing the person as a subject, a national, of a sovereign state.
  ///
  /// It affords the state jurisdiction over the person and affords the person
  /// the protection of the state against other states.
  final String nationality;

  /// The ISO 3166-1 numeric code for this country
  final String number;

  /// Does this country uses postal codes in addresses
  ///
  /// A postal code (also known locally in various English-speaking countries
  /// throughout the world as a postcode, post code, PIN or ZIP Code) is a
  /// series of letters or digits or both, sometimes including spaces or
  /// punctuation, included in a postal address for the purpose of sorting mail.
  final bool postalCode;

  /// The regex for valid postal codes in this country
  final String? postalCodeFormat;

  /// The Region this country is in. Approximately matches the United Nations
  /// geoscheme
  final Region region;

  /// The starting day of the week
  final Week startOfWeek;

  /// The Subegion this country is in. Approximately matches the United Nations
  /// geoscheme's Subregions
  final String subregion;

  /// The UN/LOCODE prefix for this country
  ///
  /// UN/LOCODE, the United Nations Code for Trade and Transport Locations,
  /// is a geographic coding scheme developed and maintained by United Nations
  /// Economic Commission for Europe (UNECE). UN/LOCODE assigns codes to
  /// locations used in trade and transport with functions such as seaports,
  /// rail and road terminals, airports, Postal Exchange Office and border
  /// crossing points.
  final String unLocode;

  /// Array of unofficial, slang names or aliases for this country
  final List<String> unofficialNames;

  /// The World Region this country is in: [WorldRegion.amer]
  /// , [WorldRegion.apac] or [WorldRegion.emea]
  final WorldRegion worldRegion;

  /// A template for formatting addresses in this country.
  final String? addressFormat;

  /// The VAT rates that this country has
  final VatRates? vatRates;

  /// The North American Numbering Plan (NANP) is a telephone numbering plan for
  /// twenty-five regions in twenty countries, primarily in North America and
  /// the Caribbean.
  ///
  /// This group is historically known as World Zone 1 and has the international
  /// calling code 1. Some North American countries, most notably Mexico, do not
  /// participate in the NANP.
  final String? nanpPrefix;

  /// If this country is a member of the European Economic Area.
  final bool? eeaMember;

  /// If this country is a member of the European Union.
  final bool? euMember;

  /// If this country is a member of the European Single Market.
  final bool? esmMember;

  /// A complementary currency is a currency or medium of exchange that is not
  /// necessarily a national currency, but that is thought of as supplementing
  /// or complementing national currencies.
  final String? altCurrency;

  /// Map for storing country short name by locale
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

  /// Emoji flags are supported on all major platforms except Windows,
  /// which displays two-letter country codes instead of emoji flag images.
  String get flagEmoji {
    final countryCode = alpha2.toLowerCase();
    return String.fromCharCodes([
      countryCode.codeUnitAt(0) + 127365,
      countryCode.codeUnitAt(1) + 127365,
    ]);
  }
}

/// A class for storing information of coordinate
///
/// The geographic coordinate system (GCS) is a spherical or ellipsoidal
/// coordinate system for measuring and communicating positions directly on
/// the Earth as latitude and longitude.
///
/// It is the simplest, oldest and most widely used of the thousands of
/// spatial reference systems that are in use, and forms the basis for most
/// others.
class Coordinate {
  /// Creates coordinate
  const Coordinate(this.latitude, this.longitude);

  /// In geography, latitude is a geographic coordinate that specifies the
  /// north–south position of a point on the Earth's surface. Latitude is an
  /// angle (defined below) which ranges from 0° at the Equator to 90°
  /// (North or South) at the poles.
  final double latitude;

  /// Longitude is a geographic coordinate that specifies the east–west position
  /// of a point on the Earth's surface, or the surface of a celestial body.
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

/// A class for storing information of coordinate and bounding box
class GeoData {
  /// Creates Geodata
  const GeoData(this.coordinate, this.maxCoordinate, this.minCoordinate,
      this.boundary, this.longitudeDec);

  /// Creates geodata with a decoded json object from [countries](https://github.com/countries/countries)
  factory GeoData.fromJson(Map<String, dynamic> json) => GeoData(
      Coordinate(json['latitude'].toDouble(), json['longitude'].toDouble()),
      Coordinate(
          json['max_latitude'].toDouble(), json['max_longitude'].toDouble()),
      Coordinate(
          json['min_latitude'].toDouble(), json['min_longitude'].toDouble()),
      BoundingBox.fromJson(json['bounds']),
      json['longitude_dec']);

  /// The coordinate represent as the center point of this country
  final Coordinate coordinate;

  /// The coordinate represent as the most northeast point of this country
  final Coordinate maxCoordinate;

  /// The coordinate represent as the most southwest point of this country
  final Coordinate minCoordinate;

  /// The bounding box of this country
  final BoundingBox boundary;

  /// The description of the [coordinate.longitude]
  @Deprecated(
      'The Country#longitude_dec method has been deprecated and will be removed in 5.0. Please use Country#longitude instead.')
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

/// A class for storing information of bounding box
///
/// A bounding box is an area defined by northeast coordinate and southwest
/// coordinate.
class BoundingBox {
  /// Creates bounding box
  const BoundingBox(this.northeast, this.southwest);

  /// Creates bounding box with a decoded json object from [countries](https://github.com/countries/countries)
  factory BoundingBox.fromJson(Map<String, dynamic> json) => BoundingBox(
      Coordinate(json['northeast']['lat'].toDouble(),
          json['northeast']['lng'].toDouble()),
      Coordinate(json['southwest']['lat'].toDouble(),
          json['southwest']['lng'].toDouble()));

  /// The coordinate represent as the most northeast point of this country
  final Coordinate northeast;

  /// The coordinate represent as the most southwest point of this country
  final Coordinate southwest;

  @override
  String toString() {
    return 'Boundary{northeast: $northeast, southwest: $southwest}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BoundingBox &&
          runtimeType == other.runtimeType &&
          northeast == other.northeast &&
          southwest == other.southwest;

  @override
  int get hashCode => northeast.hashCode ^ southwest.hashCode;
}

/// A class for storing information of VAT rates
///
/// A value-added tax (VAT), known in some countries as a goods and services
/// tax (GST), is a type of tax that is assessed incrementally.
///
/// It is levied on the price of a product or service at each stage of
/// production, distribution, or sale to the end consumer.
class VatRates {
  /// Creates VAT rates
  const VatRates(this.standard, this.reduced, this.superReduced, this.parking);

  /// Creates VAT rates with a decoded json object from [countries](https://github.com/countries/countries)
  factory VatRates.fromJson(Map<String, dynamic> json) => VatRates(
      json['standard'].toDouble(),
      List.from(json['reduced'])
          .map((e) => e.toDouble())
          .cast<double>()
          .toList(),
      json['super_reduced']?.toDouble(),
      json['parking']?.toDouble());

  /// The standard rate of VAT rates
  final double standard;

  /// The reduced rate of VAT rates
  final List<double> reduced;

  /// The super-reduced rate of VAT rates
  final double? superReduced;

  /// The parking rate of VAT rates
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

/// A class for storing information of continent
///
/// A continent is any of several large landmasses. Generally identified by
/// convention rather than any strict criteria, up to seven geographical
/// regions are commonly regarded as continents.
///
/// Ordered from largest in area to smallest, these seven regions are:
/// [Continent.asia], [Continent.africa], [Continent.northAmerica],
/// [Continent.southAmerica], [Continent.antarctica], [Continent.europe],
/// and [Continent.australia].
class Continent {
  /// Creates continent
  const Continent._(this.wireName);

  /// Creates continent with a decoded json object from [countries](https://github.com/countries/countries)
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

  /// Actual value from json
  final String wireName;

  /// Value of [africa] in json
  static const africaWireName = "Africa";

  /// Value of [antarctica] in json
  static const antarcticaWireName = "Antarctica";

  /// Value of [asia] in json
  static const asiaWireName = "Asia";

  /// Value of [africa] in json
  static const australiaWireName = "Australia";

  /// Value of [europe] in json
  static const europeWireName = "Europe";

  /// Value of [northAmerica] in json
  static const northAmericaWireName = "North America";

  /// Value of [southAmerica] in json
  static const southAmericaWireName = "South America";

  /// Constant value of the [africa] enum
  static const africa = Continent._(africaWireName);

  /// Constant value of the [africa] enum
  static const antarctica = Continent._(antarcticaWireName);

  /// Constant value of the [asia] enum
  static const asia = Continent._(asiaWireName);

  /// Constant value of the [australia] enum
  static const australia = Continent._(australiaWireName);

  /// Constant value of the [europe] enum
  static const europe = Continent._(europeWireName);

  /// Constant value of the [northAmerica] enum
  static const northAmerica = Continent._(northAmericaWireName);

  /// Constant value of the [southAmerica] enum
  static const southAmerica = Continent._(southAmericaWireName);

  /// All values with [Continent]
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

/// A class for storing information of region
///
/// In geography, regions are areas that are broadly divided by physical
/// characteristics (physical geography), human impact characteristics
/// (human geography), and the interaction of humanity and the environment
/// (environmental geography).
///
/// Geographic regions and sub-regions are mostly described by their imprecisely
/// defined, and sometimes transitory boundaries, except in human geography,
/// where jurisdiction areas such as national borders are defined in law.
class Region {
  /// Creates region
  const Region._(this.wireName);

  /// Creates region with a decoded json object from [countries](https://github.com/countries/countries)
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

  /// Actual value from json
  final String wireName;

  /// Value of [europe] in json
  static const europeWireName = 'Europe';

  /// Value of [asia] in json
  static const asiaWireName = 'Asia';

  /// Value of [americas] in json
  static const americasWireName = 'Americas';

  /// Value of [africa] in json
  static const africaWireName = 'Africa';

  /// Value of [unknown] in json
  static const unknownWireName = '';

  /// Value of [oceania] in json
  static const oceaniaWireName = 'Oceania';

  /// Constant value of the [europe] enum
  static const europe = Region._(europeWireName);

  /// Constant value of the [asia] enum
  static const asia = Region._(asiaWireName);

  /// Constant value of the [americas] enum
  static const americas = Region._(americasWireName);

  /// Constant value of the [africa] enum
  static const africa = Region._(africaWireName);

  /// Constant value of the [unknown] enum
  static const unknown = Region._(unknownWireName);

  /// Constant value of the [oceania] enum
  static const oceania = Region._(oceaniaWireName);

  /// All values with [Region]
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

/// A class for storing information of week
class Week {
  /// Creates week
  const Week._(this.wireName);

  /// Creates week with a decoded json object from [countries](https://github.com/countries/countries)
  factory Week.fromWireName(String wireName) {
    switch (wireName) {
      case mondayWireName:
        return monday;

      case tuesdayWireName:
        return tuesday;

      case wednesdayWireName:
        return wednesday;

      case thursdayWireName:
        return thursday;

      case fridayWireName:
        return friday;

      case saturdayWireName:
        return saturday;

      case sundayWireName:
        return sunday;

      default:
        throw ArgumentError('UnSupported wireName: $wireName');
    }
  }

  /// Actual value from json
  final String wireName;

  /// Value of [monday] in json
  static const mondayWireName = 'monday';

  /// Value of [tuesday] in json
  static const tuesdayWireName = 'tuesday';

  /// Value of [wednesday] in json
  static const wednesdayWireName = 'wednesday';

  /// Value of [thursday] in json
  static const thursdayWireName = 'thursday';

  /// Value of [friday] in json
  static const fridayWireName = 'friday';

  /// Value of [saturday] in json
  static const saturdayWireName = 'saturday';

  /// Value of [sunday] in json
  static const sundayWireName = 'sunday';

  /// Constant value of the [monday] enum
  static const monday = Week._(mondayWireName);

  /// Constant value of the [tuesday] enum
  static const tuesday = Week._(tuesdayWireName);

  /// Constant value of the [wednesday] enum
  static const wednesday = Week._(wednesdayWireName);

  /// Constant value of the [thursday] enum
  static const thursday = Week._(thursdayWireName);

  /// Constant value of the [friday] enum
  static const friday = Week._(fridayWireName);

  /// Constant value of the [saturday] enum
  static const saturday = Week._(saturdayWireName);

  /// Constant value of the [sunday] enum
  static const sunday = Week._(sundayWireName);

  /// All values with [Week]
  static get values =>
      [monday, tuesday, wednesday, thursday, friday, saturday, sunday];

  @override
  String toString() {
    return 'Week{wireName: $wireName}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Week &&
          runtimeType == other.runtimeType &&
          wireName == other.wireName;

  @override
  int get hashCode => wireName.hashCode;
}

/// A class for storing information of world region
class WorldRegion {
  /// Creates world region
  const WorldRegion._(this.wireName);

  /// Creates world region with a decoded json object from [countries](https://github.com/countries/countries)
  factory WorldRegion.fromWireName(String wireName) {
    switch (wireName) {
      case amerWireName:
        return amer;

      case apacWireName:
        return apac;

      case emeaWireName:
        return emea;

      default:
        throw ArgumentError('UnSupported wireName: $wireName');
    }
  }

  /// Actual value from json
  final String wireName;

  /// Value of [amer] in json
  static const amerWireName = 'AMER';

  /// Value of [apac] in json
  static const apacWireName = 'APAC';

  /// Value of [emea] in json
  static const emeaWireName = 'EMEA';

  /// Constant value of the [amer] enum
  static const amer = WorldRegion._(amerWireName);

  /// Constant value of the [apac] enum
  static const apac = WorldRegion._(apacWireName);

  /// Constant value of the [emea] enum
  static const emea = WorldRegion._(emeaWireName);

  /// All values with [WorldRegion]
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
