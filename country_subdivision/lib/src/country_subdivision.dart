import 'package:collection/collection.dart';

/// Class for storing information of a country subdivision.
class CountrySubdivision {
  /// Creates a country subdivision.
  const CountrySubdivision({
    required this.countryCode,
    required this.code,
    required this.name,
    required this.unofficialNames,
    this.geo,
    required this.translations,
    this.type,
  });

  /// Creates a country subdivision with a decoded json object from
  /// [countries](https://github.com/countries/countries).
  factory CountrySubdivision.fromJson(
    Map<String, dynamic> json, {
    required String countryCode,
    required String code,
  }) =>
      CountrySubdivision(
        countryCode: countryCode,
        code: (json['code'] ?? code).toString(),
        name: json['name'],
        unofficialNames: List<String>.from(json['unofficial_names'] ?? []),
        geo: json['geo'] == null
            ? null
            : CountrySubdivisionGeoData.fromJson(json['geo']),
        translations: Map<String, String>.from(json['translations'] ?? {}),
        type: json['type'],
      );

  /// ISO 3166-1 alpha-2 country code.
  final String countryCode;

  /// ISO 3166-2 subdivision code without country code.
  final String code;

  /// ISO 3166-2 subdivision code with country code.
  String get fullCode => '$countryCode-$code';

  /// Subdivision name.
  final String name;

  /// Array of unofficial, slang names or aliases for this subdivision.
  final List<String> unofficialNames;

  /// Geographic information for this subdivision.
  final CountrySubdivisionGeoData? geo;

  /// Map for storing subdivision name by locale.
  final Map<String, String> translations;

  /// Subdivision type, such as state, province, parish, or district.
  final String? type;

  @override
  String toString() {
    return 'CountrySubdivision{countryCode: $countryCode, code: $code, name: $name, unofficialNames: $unofficialNames, geo: $geo, translations: $translations, type: $type}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CountrySubdivision &&
          runtimeType == other.runtimeType &&
          countryCode == other.countryCode &&
          code == other.code &&
          name == other.name &&
          const ListEquality<String>()
              .equals(unofficialNames, other.unofficialNames) &&
          geo == other.geo &&
          const MapEquality<String, String>()
              .equals(translations, other.translations) &&
          type == other.type;

  @override
  int get hashCode => Object.hash(
        countryCode,
        code,
        name,
        const ListEquality<String>().hash(unofficialNames),
        geo,
        const MapEquality<String, String>().hash(translations),
        type,
      );
}

/// Geographic information for a country subdivision.
class CountrySubdivisionGeoData {
  /// Creates subdivision geographic data.
  const CountrySubdivisionGeoData({
    required this.coordinate,
    this.maxCoordinate,
    this.minCoordinate,
  });

  /// Creates subdivision geographic data with a decoded json object from
  /// [countries](https://github.com/countries/countries).
  factory CountrySubdivisionGeoData.fromJson(Map<String, dynamic> json) =>
      CountrySubdivisionGeoData(
        coordinate: CountrySubdivisionCoordinate(
          latitude: json['latitude'].toDouble(),
          longitude: json['longitude'].toDouble(),
        ),
        maxCoordinate:
            json['max_latitude'] == null || json['max_longitude'] == null
                ? null
                : CountrySubdivisionCoordinate(
                    latitude: json['max_latitude'].toDouble(),
                    longitude: json['max_longitude'].toDouble(),
                  ),
        minCoordinate:
            json['min_latitude'] == null || json['min_longitude'] == null
                ? null
                : CountrySubdivisionCoordinate(
                    latitude: json['min_latitude'].toDouble(),
                    longitude: json['min_longitude'].toDouble(),
                  ),
      );

  /// The coordinate represented as the center point of this subdivision.
  final CountrySubdivisionCoordinate coordinate;

  /// The coordinate represented as the most northeast point of this subdivision.
  final CountrySubdivisionCoordinate? maxCoordinate;

  /// The coordinate represented as the most southwest point of this subdivision.
  final CountrySubdivisionCoordinate? minCoordinate;

  @override
  String toString() {
    return 'CountrySubdivisionGeoData{coordinate: $coordinate, maxCoordinate: $maxCoordinate, minCoordinate: $minCoordinate}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CountrySubdivisionGeoData &&
          runtimeType == other.runtimeType &&
          coordinate == other.coordinate &&
          maxCoordinate == other.maxCoordinate &&
          minCoordinate == other.minCoordinate;

  @override
  int get hashCode =>
      coordinate.hashCode ^ maxCoordinate.hashCode ^ minCoordinate.hashCode;
}

/// A class for storing latitude and longitude.
class CountrySubdivisionCoordinate {
  /// Creates coordinate.
  const CountrySubdivisionCoordinate({
    required this.latitude,
    required this.longitude,
  });

  /// Latitude is a geographic coordinate that specifies the north-south
  /// position of a point on the Earth's surface.
  final double latitude;

  /// Longitude is a geographic coordinate that specifies the east-west position
  /// of a point on the Earth's surface.
  final double longitude;

  @override
  String toString() {
    return 'CountrySubdivisionCoordinate{latitude: $latitude, longitude: $longitude}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CountrySubdivisionCoordinate &&
          runtimeType == other.runtimeType &&
          latitude == other.latitude &&
          longitude == other.longitude;

  @override
  int get hashCode => latitude.hashCode ^ longitude.hashCode;
}
