// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import '../screen/signup/signup.dart';
import 'dropdown.dart';

class ServiceType extends StatefulWidget {
  const ServiceType({super.key});

  @override
  _ServiceTypeState createState() => _ServiceTypeState();
}

class _ServiceTypeState extends State<ServiceType> {
  String? selectedValue;

  final List<String> items = [
    'الاتحاد العام لنقابات العمال في العراق',
    'هوية مؤسسة امان للخدمات العامة والتنمية المستدامة',
    'الاتحاد الوطني لنقابات عمال البصرة',
    'الاتحاد الوطني العام لنقابات العمال',
    'بطاقة خدمات امان للجمهور',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dropdown Screen')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomDropdown(
                items: items,
                hintText: 'Select an item',
                selectedValue: selectedValue,
                onChanged: (newValue) {
                  setState(() {
                    selectedValue = newValue;
                  });
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Navigate to signup screen and pass the selected value
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignUp(selectedValue),
                    ),
                  );
                },
                child: const Text('Go to Signup'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
