import 'package:flutter/material.dart';
import 'package:flutter_country_widget/flutter_country_widget.dart';

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

class CountryExample extends StatelessWidget {
  const CountryExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            CountryDropdownButton.countryName(
              onChanged: (value) {},
            ),
            CountryDropdownButton.countryCode(
              onChanged: (value) {},
            ),
          ],
        ),
      ),
    );
  }
}
