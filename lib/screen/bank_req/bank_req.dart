// ignore_for_file: library_private_types_in_public_api, avoid_print

//////////////////! deprecated (use BankReq2 instead)

import 'package:aman/const.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class BankReqForm extends StatefulWidget {
  const BankReqForm({super.key});

  @override
  _BankReqFormState createState() => _BankReqFormState();
}

class _BankReqFormState extends State<BankReqForm> {
  String selectedClaimType = 'فتح حساب بنكي'; // Default selected claim type
  String sponsorId = ''; // Variable to store sponsor ID
  List<PlatformFile>? _files; // List to store selected files
  // Function to fetch sponsor ID based on name
  void fetchSponsorId(String name) {
    // Call your API here to fetch the ID based on the name
    // Simulating fetching data
    // Replace this with your actual API call
    if (name == 'John Doe') {
      setState(() {
        sponsorId = '123'; // Sample ID for John Doe
      });
    } else {
      setState(() {
        sponsorId = ''; // Reset sponsor ID if name doesn't exist
      });
    }
  }

  // Function to pick files from the device
  void pickFiles() async {
    try {
      FilePickerResult? pickedFiles = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: FileType.custom, // You can specify the file types here if needed
        allowedExtensions: ['jpg', 'pdf', 'doc', 'png'],
      );
      if (pickedFiles != null && pickedFiles.files.isNotEmpty) {
        setState(() {
          _files = pickedFiles.files;
        });
      }
    } catch (e) {
      print('Error picking files: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimarycolor,
          title: const Text('المطالبة المصرفية'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'نوع المطالبة',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              DropdownButtonFormField<String>(
                value: selectedClaimType,
                items: [
                  'فتح حساب بنكي',
                  'الحصول على قرض',
                  'اخرى',
                ].map((String type) {
                  return DropdownMenuItem<String>(
                    value: type,
                    child: Text(type),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    selectedClaimType = newValue!;
                  });
                },
              ),
              const SizedBox(height: 20),
              const Text(
                'تفاصيل المطالبة',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                maxLines: 3,
                decoration: const InputDecoration(
                  hintText: 'Enter details',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'المبلغ المطلوب',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Enter amount',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'اسم الكفيل',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Enter sponsor name',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  // Fetch sponsor ID when the name is typed
                  fetchSponsorId(value);
                },
              ),
              const SizedBox(height: 20),
              Text(
                'ID الكفيل: $sponsorId', // Display fetched ID
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              const Text(
                'المرفقات',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                onPressed: () {
                  pickFiles(); // Call function when the button is pressed
                },
                child: const Text('اختر ملفات'),
              ),
              if (_files != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    const Text(
                      'الملفات المختارة:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: _files!
                          .map(
                            (file) => Text(
                              file.name,
                              style: const TextStyle(fontSize: 16),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
