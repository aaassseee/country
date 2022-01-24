import 'package:country/country.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('flag emoji', () {
    expect(Countries.hkg.flagEmoji, '🇭🇰');
  });

  test('equal', () {
    expect(Countries.hkg == Countries.hkg, true);
    expect(Countries.hkg == Countries.twn, false);
  });
}
