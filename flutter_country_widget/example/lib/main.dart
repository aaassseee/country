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
            CountryDropdownButton.predefined(
              type: CountryDropDownButtonType.name,
              onChanged: (value) {},
              hint: const Text('Please select a country'),
            ),
            CountryDropdownButton.predefined(
              type: CountryDropDownButtonType.callingCode,
              onChanged: (value) {},
              hint: const Text('Phone code'),
            ),
            CountryDropdownButton.predefined(
              type: CountryDropDownButtonType.currency,
              onChanged: (value) {},
              hint: const Text('Currency'),
            ),
          ],
        ),
      ),
    );
  }
}
