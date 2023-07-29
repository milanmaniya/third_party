import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';

class CountryPickerDemo extends StatefulWidget {
  const CountryPickerDemo({super.key});

  @override
  State<CountryPickerDemo> createState() => _CountryPickerDemoState();
}

class _CountryPickerDemoState extends State<CountryPickerDemo> {
  Country selectedCountry = Country(
    phoneCode: "+91",
    countryCode: "IN",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: "INDIA",
    example: "INDIA",
    displayName: "INDIA",
    displayNameNoCountryCode: "IN",
    e164Key: "e164Key",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                showCountryPicker(
                  context: context,
                  onSelect: (value) {
                    selectedCountry = value;
                  },
                );
                setState(() {});
              },
              child: const Text('select country'),
            ),
          ],
        ),
      ),
    );
  }
}
