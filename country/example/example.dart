import 'package:country/country.dart';

void main() {
  for (final country in Countries.values) {
    print('${country.isoLongName}: ${country.flagEmoji}');
  }
}
