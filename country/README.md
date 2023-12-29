# country

Generated country class with country_generator using countries. This plugin is
using [countries](https://github.com/countries/countries) to generate dart class.

## Getting Started

### Install

Add the following lines in your pubspec.yaml file

```yaml
dependencies:
  country: ^latest_version
```

##### latest version
[![pub package](https://img.shields.io/pub/v/country.svg)](https://pub.dartlang.org/packages/country)

### API

##### Short name by locale (flutter_country_utility depend on Flutter)

###### Install
Replace country by installing the following lines in your pubspec.yaml file

```yaml
flutter_country_utility: ^latest_version
```
##### latest version
[![pub package](https://img.shields.io/pub/v/flutter_country_utility.svg)](https://pub.dartlang.org/packages/flutter_country_utility)

e.g
```dart
String getShortNameByLocale(Country country) {
  return country.getIsoShortNameByLocale(const Locale('zh', 'HK'));
}
```

#### Flag emoji

e.g
```dart
String getCountryFlagEmoji(Country country) {
  return country.flagEmoji;
}
```

#### All country

e.g
```dart
void printAllCountry() {
  for (final country in Countries.values) {
    print(country);
  }
}
```

### Class

#### Country

| Parameter                      | Nullable | Description                                                                                      |
|--------------------------------|:--------:|--------------------------------------------------------------------------------------------------|
| alpha2                         | &cross;  | two-letter country codes                                                                         |
| alpha3                         | &cross;  | three-letter country codes                                                                       |
| continent                      | &cross;  | country belongs                                                                                  |
| countryCode                    | &cross;  | telephone number prefixes                                                                        |
| currencyCode                   | &cross;  | alpha codes and numeric codes for the representation of currencies                               |
| gec                            | &check;  | two-letter country codes that were used by the U.S. Government                                   |
| geo                            | &cross;  | GeoData. latitude, longitude and boundary information                                            |
| internationalPrefix            | &cross;  | trunk prefix used to select an international telephone circuit for placing an international call |
| ioc                            | &check;  | three-letter abbreviation country codes to refer to each group of athletes                       |
| isoLongName                    | &cross;  | full name                                                                                        |
| isoShortName                   | &cross;  | short name                                                                                       |
| languagesOfficial              | &cross;  | official languages                                                                               |
| languagesSpoken                | &cross;  | spoken languages                                                                                 |
| nationalDestinationCodeLengths | &cross;  | lengths of National Destination Code                                                             |
| nationalNumberLengths          | &cross;  | lengths of phone number                                                                          |
| nationalPrefix                 | &cross;  | phone prefix used in this country for dialing national numbers                                   |
| nationality                    | &cross;  | identification of a person in international law                                                  |
| number                         | &cross;  | numeric code of country                                                                          |
| postalCode                     | &cross;  | is this country uses postal codes in addresses                                                   |
| postalCodeFormat               | &check;  | regex for valid postal codes                                                                     |
| region                         | &cross;  | region this country is in                                                                        |
| startOfWeek                    | &cross;  | starting day of the week                                                                         |
| subregion                      | &cross;  | subegion this country is in                                                                      |
| unLocode                       | &cross;  | UN/LOCODE prefix for this country                                                                |
| unofficialNames                | &cross;  | unofficial, slang names or aliases for this country                                              |
| worldRegion                    | &cross;  | The World Region this country is in                                                              |
| addressFormat                  | &check;  | template for formatting addresses                                                                |
| vatRates                       | &check;  | value-added tax rate                                                                             |
| nanpPrefix                     | &check;  | North American Numbering Plan area codes                                                         |
| eeaMember                      | &check;  | is a member of the European Economic Area                                                        |
| euMember                       | &check;  | is a member of the European Union                                                                |
| esmMember                      | &check;  | is a member of the European Single Market                                                        |
| altCurrency                    | &check;  | complementary currency                                                                           |
| isoShortNameByLanguage         | &cross;  | Map for storing country short name by locale                                                     |

#### GeoData

| Parameter     | Nullable | Description                               |
|---------------|:--------:|-------------------------------------------|
| coordinate    | &cross;  | center point of this country              |
| maxCoordinate | &cross;  | the most northeast point of this country  |
| minCoordinate | &cross;  | the most southwest point of this country  |
| boundary      | &cross;  | BoundingBox. bounding box of this country |

#### BoundingBox

| Parameter | Nullable | Description                              |
|-----------|:--------:|------------------------------------------|
| northeast | &cross;  | the most northeast point of this country |
| southwest | &cross;  | the most southwest point of this country |

#### Coordinate

| Parameter | Nullable | Description                                                                                                   |
|-----------|:--------:|---------------------------------------------------------------------------------------------------------------|
| latitude  | &cross;  | latitude is a geographic coordinate that specifies the north–south position of a point on the Earth's surface |
| longitude | &cross;  | longitude is a geographic coordinate that specifies the east–west position of a point on the Earth's surface  |

#### VatRates

| Parameter    | Nullable | Description        |
|--------------|:--------:|--------------------|
| standard     | &cross;  | standard rate      |
| reduced      | &cross;  | reduced rates      |
| superReduced | &check;  | super-reduced rate |
| parking      | &check;  | parking rate       |

#### Continent(enum class)

| Parameter | Nullable | Description            |
|-----------|:--------:|------------------------|
| wireName  | &cross;  | Actual value from json |

#### Region(enum class)

| Parameter | Nullable | Description            |
|-----------|:--------:|------------------------|
| wireName  | &cross;  | Actual value from json |

#### Week(enum class)

| Parameter | Nullable | Description            |
|-----------|:--------:|------------------------|
| wireName  | &cross;  | Actual value from json |

#### WorldRegion(enum class)

| Parameter | Nullable | Description            |
|-----------|:--------:|------------------------|
| wireName  | &cross;  | Actual value from json |

#### SubdivisionGeoData

| Parameter    | Nullable | Description                                                        |
|--------------|:--------:|--------------------------------------------------------------------|
| latitude     | &check;  | The latitude represent as the center point of subdivision          |
| longitude    | &check;  | The longitude represent as the center point of subdivision         |
| maxLatitude  | &check;  | The maximum latitude represent as the center point of subdivision  |
| maxLongitude | &check;  | The maximum longitude represent as the center point of subdivision |
| minLatitude  | &check;  | The minimum latitude represent as the center point of subdivision  |
| minLongitude | &check;  | The minimum longitude represent as the center point of subdivision |

#### Subdivision

| Parameter   | Nullable | Description                             |
|-------------|:--------:|-----------------------------------------|
| name        | &cross;  | The name of this subdivision            |
| code        | &cross;  | The code of this subdivision            |
| geo         | &check;  | The GeoData info of this subdivision    |
| translation | &cross;  | The translation map of this subdivision |
| type        | &cross;  | The type of this subdivision            |

## Maintainer

[Jack Liu](https://github.com/aaassseee)