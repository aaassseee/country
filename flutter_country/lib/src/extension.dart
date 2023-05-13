import 'dart:ui';

import 'package:country/country.dart';

extension CountryExtension on Country {
  /// Quick way to get country short name by dart:ui locale
  ///
  /// May be separate to another package because dart:ui require Flutter as a
  /// dependency
  ///
  /// The default locale is [PlatformDispatcher.instance.locale]
  String getIsoShortNameByLocale([Locale? locale]) {
    locale ??= PlatformDispatcher.instance.locale;
    String? shortName = isoShortNameByLanguage[[
          locale.languageCode.toLowerCase(),
          if (locale.countryCode != null) locale.countryCode!.toLowerCase()
        ].join('-')] ??
        isoShortNameByLanguage[locale.languageCode.toLowerCase()];
    if (shortName == null) {
      throw ArgumentError('Invalid locale');
    }

    return shortName;
  }
}
