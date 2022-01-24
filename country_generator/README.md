# country_generator

A generator for generating country in dart with [countries](https://github.com/countries/countries).

## Getting Started
### Install
Add the following lines in your pubspec.yaml file

```yaml
dev_dependencies:
  build_runner: ^latest_version
  country_generator: ^latest_version
```

[![pub package](https://img.shields.io/pub/v/country_generator.svg)](https://pub.dartlang.org/packages/country_generator)

### Configure
Add configuration at the bottom or add nothing to use default path
- default:
```yaml
country_generator:
  sourceFolder: countries
  outputFolder: lib/gen
```
- customize
```yaml
country_generator:
  sourceFolder: your/submodule/path
  outputFolder: your/output/path
```

### Run
```shell
flutter packages pub run build_runner build
```

## Maintainer

[Jack Liu](https://github.com/aaassseee)