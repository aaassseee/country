# flutter_country_widget

Flutter pre-defined widget by using [country](https://github.com/aaassseee/country/tree/master/country), generated
country class by using [countries](https://github.com/countries/countries).

## Getting Started

### Install

Add the following lines in your pubspec.yaml file

```yaml
dependencies:
  flutter_country_widget: ^latest_version
```

[![pub package](https://img.shields.io/pub/v/flutter_country_utility.svg)](https://pub.dartlang.org/packages/flutter_country_utility)

## API

* CountryDropdownButton

```
CountryDropdownButton.predefined(
  type: CountryDropDownButtonType.name,
  onChanged: (value) {},
  hint: const Text('Please select a country'),
),

CountryDropdownButton.predefined(
  type: CountryDropDownButtonType.callingCode,
  onChanged: (value) {},
  hint: const Text('Phone code'),
),

CountryDropdownButton.predefined(
  type: CountryDropDownButtonType.currency,
  onChanged: (value) {},
  hint: const Text('Currency'),
),
```

## Maintainer

[Jack Liu](https://github.com/aaassseee)