# country_subdivision

Generated ISO 3166-2 country subdivision classes using data from
[countries](https://github.com/countries/countries).

This package contains subdivision data that was split out of the core
[`country`](https://pub.dev/packages/country) package so applications can depend
on it only when administrative division data is required.

## Install

```yaml
dependencies:
  country_subdivision: ^latest_version
```

[![pub package](https://img.shields.io/pub/v/country_subdivision.svg)](https://pub.dartlang.org/packages/country_subdivision)

## Usage

```dart
import 'package:country_subdivision/country_subdivision.dart';

void main() {
  final alaska = CountrySubdivisions.byCode('US', 'AK');
  print(alaska.name); // Alaska

  final usSubdivisions = CountrySubdivisions.byCountry('US');
  print(usSubdivisions.length);
}
```

## Generate data locally

This package is generated from the `countries` submodule used by the monorepo.

```shell
dart run build_runner build --delete-conflicting-outputs
```

## Classes

### CountrySubdivision

| Parameter       | Nullable | Description                                      |
|-----------------|:--------:|--------------------------------------------------|
| countryCode     | &cross;  | ISO 3166-1 alpha-2 country code                  |
| code            | &cross;  | ISO 3166-2 subdivision code without country code |
| fullCode        | &cross;  | ISO 3166-2 subdivision code with country code    |
| name            | &cross;  | Subdivision name                                 |
| unofficialNames | &cross;  | Unofficial, slang names or aliases               |
| geo             | &check;  | Geographic center and bounds                     |
| translations    | &cross;  | Subdivision name by locale                       |
| type            | &check;  | Subdivision type, such as state or province      |

## Maintainer

[Jack Liu](https://github.com/aaassseee)
