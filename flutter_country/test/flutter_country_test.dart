import 'dart:ui';

import 'package:flutter_country/flutter_country.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('short name by locale', () {
    expect(
        Countries.hkg.getIsoShortNameByLocale(const Locale('zh', 'HK')), '香港');
    expect(
        Countries.hkg.getIsoShortNameByLocale(const Locale('ZH', 'hk')), '香港');
    expect(Countries.hkg.getIsoShortNameByLocale(const Locale('En', 'US')),
        'Hong Kong');

    expect(
        Countries.gbr.getIsoShortNameByLocale(const Locale.fromSubtags(
            languageCode: 'zh', countryCode: 'HK', scriptCode: 'hant')),
        '英國');
  });
}
