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
      required this.onPickFiles,
      required this.onSubmit,
      required this.canShowImages,
      required this.isPage3Loading});

  final Package package;
  final void Function(PackageElement?) onPackageSelected;
  final PackageElement? selectedPackage;
  final List<File>? pickedFiles;
  final void Function() onPickFiles;
  final void Function() onSubmit;
  final bool? canShowImages;
  final bool isPage3Loading;

  @override
  Widget build(BuildContext context) {
    return isPage3Loading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : SingleChildScrollView(
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
                // showing the picked files
                if (canShowImages == true && pickedFiles != null)
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

                SizedBox(height: 5),
                if (canShowImages == false)
                  const Text(
                    "تم تحديد الملفات",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: double.infinity,
                  child: GeneralButton(
                    onPressed: onSubmit,
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
