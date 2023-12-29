# flutter_country_utility

Flutter extension function by using [country](https://github.com/aaassseee/country/tree/master/country), generated country class by using [countries](https://github.com/countries/countries).

## Getting Started

### Install

Add the following lines in your pubspec.yaml file

```yaml
dependencies:
  country: ^latest_version
```

[![pub package](https://img.shields.io/pub/v/flutter_country_utility.svg)](https://pub.dartlang.org/packages/flutter_country_utility)

### API

##### Short name by locale

```dart
String shortName = Countries.hkg.getIsoShortNameByLocale(const Locale('zh', 'HK'));

String getShortNameByLocale(Country country) {
  return country.getIsoShortNameByLocale(const Locale('zh', 'HK'));
}
```

## Maintainer

[Jack Liu](https://github.com/aaassseee)