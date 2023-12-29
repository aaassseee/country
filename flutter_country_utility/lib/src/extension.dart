import 'dart:ui';

import 'package:collection/collection.dart';
import 'package:country/country.dart';

extension CountryExtension on Country {
  @Deprecated('function name deprecated, use isoLocalizedShortName instead')
  String getIsoShortNameByLocale([Locale? locale]) =>
      isoLocalizedShortName(locale);

  @Deprecated(
      'function name deprecated, use isoLocalizedShortNameOrNull instead')
  String? tryGetIsoShortNameByLocale([Locale? locale]) =>
      isoLocalizedShortNameOrNull(locale);

  /// Quick way to get country short name by dart:ui locale
  /// throws [ArgumentError] when could not find any country short name
  ///
  /// The default locale is [PlatformDispatcher.instance.locale]
  String isoLocalizedShortName([Locale? locale]) {
    final shortName = isoLocalizedShortNameOrNull(locale);
    if (shortName == null) {
      throw ArgumentError('Invalid locale');
    }

    return shortName;
  }

  /// Quick way to get country short name by dart:ui locale
  ///
  /// The default locale is [PlatformDispatcher.instance.locale]
  String? isoLocalizedShortNameOrNull([Locale? locale]) {
    locale ??= PlatformDispatcher.instance.locale;

    final languageCode = locale.languageCode;
    final scriptCode = locale.scriptCode;
    final countryCode = locale.countryCode;

    return isoShortNameByLocale[[
          languageCode,
          if (scriptCode != null) scriptCode,
          if (countryCode != null) countryCode,
        ].join('_')] ??
        isoShortNameByLocale[[
          languageCode,
          if (countryCode != null) countryCode,
        ].join('_')] ??
        isoShortNameByLocale[languageCode];
  }
}

extension LocaleExtension on Locale {
  /// Quick way to convert locale to country
  Country? get toCountry => Countries.values
      .firstWhereOrNull((country) => country.alpha2 == countryCode);
}
