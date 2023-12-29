import 'dart:ui';

import 'package:flutter_country_utility/flutter_country_utility.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('short name by locale', () {
    expect(
        Countries.hkg.getIsoShortNameByLocale(const Locale('zh', 'HK')), '香港');
    expect(Countries.hkg.getIsoShortNameByLocale(const Locale('en', 'US')),
        'Hong Kong');
    expect(
        Countries.gbr.getIsoShortNameByLocale(const Locale.fromSubtags(
            languageCode: 'zh', scriptCode: 'Hant', countryCode: 'HK')),
        '英國');

    expect(
      Countries.gbr.getIsoShortNameByLocale(),
      Countries.gbr.getIsoShortNameByLocale(PlatformDispatcher.instance.locale),
    );

    expect(
        () => Countries.hkg.getIsoShortNameByLocale(const Locale('ZH', 'hk')),
        throwsArgumentError);
    expect(
        () => Countries.hkg.getIsoShortNameByLocale(const Locale('En', 'US')),
        throwsArgumentError);
  });
}
