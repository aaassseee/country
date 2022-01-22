# country

Generated country class with country_generator using countries.
This plugin is using [countries](https://github.com/countries/countries) to
generate dart class.

## Getting Started

### Install

Add the following lines in your pubspec.yaml file

```yaml
dependencies:
  country: ^latest_version
```

[![pub package](https://img.shields.io/pub/v/country.svg)](https://pub.dartlang.org/packages/country)

### API

#### All country

```dart
void printAllCountry() {
  for (final country in Countries.values) {
    print(country);
  }
}
```

##### Short name by locale

```dart
String getCountryNameByLocale(Country country, Locale locale) =>
    country.isoShortNameByLanguage[const Locale('en', 'US').languageCode]!;
```

