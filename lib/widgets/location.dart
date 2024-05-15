import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Location'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50), // Top space
              Image.asset(
                'assets/images/logo.png', // Replace with your company logo
                width: 150,
                height: 150,
              ),
              const SizedBox(height: 20),
              const Text(
                'المنصة الالكترونية امان',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'العراق',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
              const Text(
                'بغداد / الكرادة خارج',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
              const Text(
                'شارع العطار',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 10),
              InkWell(
                onTap: () async {
                  var uri = Uri.parse("tel:07815551133");
                  await launchUrl(uri);
                },
                child: const Text(
                  'للاتصال على الرقم : 9647815551133+',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.blue, // Adjust color as needed
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
