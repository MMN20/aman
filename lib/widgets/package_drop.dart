// ignore_for_file: library_private_types_in_public_api, prefer_typing_uninitialized_variables

import 'package:aman/const.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/packages.dart';

// class PackageDropdown extends StatefulWidget {
//   const PackageDropdown({super.key});

//   @override
//   _PackageDropdownState createState() => _PackageDropdownState();
// }

// class _PackageDropdownState extends State<PackageDropdown> {
//   late Package packagedata;
//   bool init = false;
//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     fetchPackages().then((data) {
//       setState(() {
//         if (!init) {
//           packagedata = data;
//           init = true;
//         }
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (init) {
//       return Column(
//         children: [
//           SizedBox(
//             width: MediaQuery.of(context).size.width * 0.9,
//             height: 100,
//             child: PackageSelection(package: packagedata),
//           ),
//         ],
//       );
//     } else {
//       return const Text('');
//     }
//   }

//   Future<Package> fetchPackages() async {
//     final response = await http
//         .get(Uri.parse('https://system.aman-iraq.com/api/api-package'));

//     if (response.statusCode == 200) {
//       final data = packageFromJson(response.body);

//       return data;
//     } else {
//       throw Exception('Failed to load delivery prices');
//     }
//   }
// }

class PackageSelection extends StatelessWidget {
  final Package package;
  final void Function(PackageElement?) onPackageSelected;
  final PackageElement? selectedPackage;

  const PackageSelection(
      {super.key,
      required this.package,
      required this.onPackageSelected,
      this.selectedPackage});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownButtonFormField<PackageElement>(
          decoration: InputDecoration(
            labelStyle: Theme.of(context).dropdownMenuTheme.textStyle,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: kPrimarycolor),
            ),
          ),
          style: Theme.of(context).dropdownMenuTheme.textStyle,
          alignment: Alignment.centerRight,
          hint: const Text('اختر الباقة'),
          value: selectedPackage,
          onChanged: onPackageSelected,
          items: package.package.map((package) {
            return DropdownMenuItem<PackageElement>(
              value: package,
              child: Text(package.name),
            );
          }).toList(),
        ),
        if (selectedPackage != null) ...[
          const SizedBox(height: 20),
          Text(
            'السعر: ${selectedPackage!.cost.toString()}',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text('التفاصيل: ${selectedPackage!.details}'),
        ],
      ],
    );
  }
}
