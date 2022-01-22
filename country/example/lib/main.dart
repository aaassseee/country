import 'package:country/country.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CountryExample(),
    );
  }
}

class CountryExample extends StatefulWidget {
  const CountryExample({Key? key}) : super(key: key);

  @override
  _CountryExampleState createState() => _CountryExampleState();
}

class _CountryExampleState extends State<CountryExample> {
  Country? country;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            if (country != null) Text(getCountryFlagEmoji(country!)),
            DropdownButtonFormField<Country>(
              items: [
                for (final country in Countries.values)
                  DropdownMenuItem(
                    child: Text(country.isoShortName),
                    value: country,
                  ),
              ],
              onChanged: (value) {
                setState(() {
                  country = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

String getCountryFlagEmoji(Country country) {
  final countryCode = country.alpha2.toLowerCase();
  return String.fromCharCodes([
    127365 + countryCode.codeUnitAt(0),
    127365 + countryCode.codeUnitAt(1),
  ]);
}

String getFlagEmojiCode(String character) {
  switch (character) {
    case 'a':
      return '🇦';

    case 'b':
      return '🇧';

    case 'c':
      return '🇨';

    case 'd':
      return '🇩';

    case 'e':
      return '🇪';

    case 'f':
      return '🇫';

    case 'g':
      return '🇬';

    case 'h':
      return '🇭';

    case 'i':
      return '🇮';

    case 'j':
      return '🇯';

    case 'k':
      return '🇰';

    case 'l':
      return '🇱';

    case 'm':
      return '🇲';

    case 'n':
      return '🇳';

    case 'o':
      return '🇴';

    case 'p':
      return '🇵';

    case 'q':
      return '🇶';

    case 'r':
      return '🇷';

    case 's':
      return '🇸';

    case 't':
      return '🇹';

    case 'u':
      return '🇺';

    case 'v':
      return '🇻';

    case 'w':
      return '🇼';

    case 'x':
      return '🇽';

    case 'y':
      return '🇾';

    case 'z':
      return '🇿';

    default:
      throw ArgumentError();
  }
}
