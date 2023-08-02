import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class IntlPhoneFieldDemo extends StatefulWidget {
  const IntlPhoneFieldDemo({super.key});

  @override
  State<IntlPhoneFieldDemo> createState() => _IntlPhoneFieldDemoState();
}

class _IntlPhoneFieldDemoState extends State<IntlPhoneFieldDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: IntlPhoneField(
          decoration: const InputDecoration(
            labelText: 'Phone Number',
            border: OutlineInputBorder(
              borderSide: BorderSide(),
            ),
          ),
          initialCountryCode: 'IN',
          onChanged: (phone) {
            log(phone.completeNumber);
          },
        ),
      ),
    );
  }
}
