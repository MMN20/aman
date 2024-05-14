import 'dart:io';

import 'package:aman/models/packages.dart';
import 'package:aman/widgets/general_button.dart';
import 'package:aman/widgets/package_drop.dart';
import 'package:flutter/material.dart';

class SignUpPage3 extends StatelessWidget {
  const SignUpPage3(
      {super.key,
      required this.package,
      required this.onPackageSelected,
      this.selectedPackage,
      this.pickedFiles,
      required this.onPickFiles});

  final Package package;
  final void Function(PackageElement?) onPackageSelected;
  final PackageElement? selectedPackage;
  final List<File>? pickedFiles;
  final void Function() onPickFiles;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 10),
          PackageSelection(
            package: package,
            onPackageSelected: onPackageSelected,
            selectedPackage: selectedPackage,
          ),
          const SizedBox(height: 10),
          GeneralButton(
              onPressed: onPickFiles,
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("المرفقات"),
                  SizedBox(width: 5),
                  Icon(Icons.arrow_upward_rounded)
                ],
              )),
          if (pickedFiles != null)
            Column(
              children: [
                ...List.generate(
                  pickedFiles!.length,
                  (index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 300,
                      child: Image.file(pickedFiles![index]),
                    ),
                  ),
                ),
              ],
            ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: double.infinity,
            child: GeneralButton(
              onPressed: () {},
              elevation: 5,
              child: const Text("ارسال البيانات"),
            ),
          ),
          const SizedBox(height: 50)
        ],
      ),
    );
  }
}
