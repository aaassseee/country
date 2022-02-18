# flutter_country

Extension function for [country](https://github.com/aaassseee/country/tree/master/country) with using Flutter

## Getting Started

### Install

Add the following lines in your pubspec.yaml file

```yaml
flutter_country:
  git:
    url: https://github.com/aaassseee/country.git
    path: flutter_country
```

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