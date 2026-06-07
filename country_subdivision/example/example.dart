import 'package:country_subdivision/country_subdivision.dart';

void main() {
  final subdivisions = CountrySubdivisions.byCountry('US');
  print('US subdivisions: ${subdivisions.length}');

  final alaska = CountrySubdivisions.maybeByCode('US', 'AK');
  print('US-AK: ${alaska?.name}');
}
