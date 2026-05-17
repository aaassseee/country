import 'package:country_subdivision/country_subdivision.dart';
import 'package:test/test.dart';

void main() {
  test('creates subdivision from json', () {
    final subdivision = CountrySubdivision.fromJson(
      {
        'name': 'Alaska',
        'code': 'AK',
        'unofficial_names': ['Alaska'],
        'geo': {
          'latitude': 64.2008413,
          'longitude': -149.4936733,
          'min_latitude': 51.214766,
          'min_longitude': 172.4445167,
          'max_latitude': 71.3868712,
          'max_longitude': -129.9945562,
        },
        'translations': {'en': 'Alaska'},
        'type': 'state',
      },
      countryCode: 'US',
      code: 'AK',
    );

    expect(subdivision.countryCode, 'US');
    expect(subdivision.code, 'AK');
    expect(subdivision.fullCode, 'US-AK');
    expect(subdivision.name, 'Alaska');
    expect(subdivision.geo?.coordinate.latitude, 64.2008413);
    expect(subdivision.translations['en'], 'Alaska');
    expect(subdivision.type, 'state');

    final sameSubdivision = CountrySubdivision.fromJson(
      {
        'name': 'Alaska',
        'code': 'AK',
        'unofficial_names': ['Alaska'],
        'geo': {
          'latitude': 64.2008413,
          'longitude': -149.4936733,
          'min_latitude': 51.214766,
          'min_longitude': 172.4445167,
          'max_latitude': 71.3868712,
          'max_longitude': -129.9945562,
        },
        'translations': {'en': 'Alaska'},
        'type': 'state',
      },
      countryCode: 'US',
      code: 'AK',
    );
    expect(subdivision, sameSubdivision);
  });

  test('finds generated subdivision by country and code', () {
    final alaska = CountrySubdivisions.byCode('us', 'ak');

    expect(alaska.fullCode, 'US-AK');
    expect(CountrySubdivisions.byCountry('US'), contains(alaska));
    expect(CountrySubdivisions.maybeByCode('US', 'UNKNOWN'), isNull);
  });

  test('generated subdivisions have consistent lookup data', () {
    final fullCodes = <String>{};

    for (final entry in CountrySubdivisions.byCountryCode.entries) {
      for (final subdivision in entry.value) {
        expect(subdivision.countryCode, entry.key);
        expect(CountrySubdivisions.byCountry(subdivision.countryCode),
            contains(subdivision));
        expect(
          CountrySubdivisions.maybeByCode(
            subdivision.countryCode,
            subdivision.code,
          ),
          subdivision,
        );
        expect(fullCodes.add(subdivision.fullCode), isTrue,
            reason: 'Duplicate subdivision code: ${subdivision.fullCode}');
      }
    }

    expect(CountrySubdivisions.values, hasLength(fullCodes.length));
  });
}
