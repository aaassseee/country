import 'package:flutter/material.dart';
import 'package:flutter_country_utility/flutter_country_utility.dart';

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
            if (country != null) Text(country!.flagEmoji),
            DropdownButtonFormField<Country>(
              items: [
                for (final country in Countries.values)
                  DropdownMenuItem(
                    child: Text(country.isoLocalizedShortName(
                        Localizations.localeOf(context))),
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
