import 'dart:ui';

import 'package:country/country.dart';

extension CountryExtension on Country {
  /// Quick way to get country short name by dart:ui locale
  ///
  /// May be separate to another package because dart:ui require Flutter as a
  /// dependency
  String? getIsoShortNameByLocale(Locale locale) =>
      isoShortNameByLanguage[[
        locale.languageCode.toLowerCase(),
        if (locale.countryCode != null) locale.countryCode!.toLowerCase()
      ].join('-')] ??
      isoShortNameByLanguage[locale.languageCode.toLowerCase()];
}
