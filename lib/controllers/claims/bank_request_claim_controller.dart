import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BankReqController extends GetxController {
  //! this will be fetched from an api
  List<String> claimTypes = ["فتح حساب بنكي", "الحصول على قرض", "اخرى"];

  TextEditingController claimDescController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  // الكفيل
  TextEditingController sponsorController = TextEditingController();
  // المنتسب
  TextEditingController muntasibController = TextEditingController();

  List<File>? files;
  File? formFile;

  // المرفقات
  void pickFiles() async {
    FilePickerResult? pickedFiles = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom, // You can specify the file types here if needed
      allowedExtensions: ['jpg', 'pdf', 'doc', 'png'],
    );

    if (pickedFiles != null && pickedFiles.files.isNotEmpty) {
      files = List.generate(
        pickedFiles.paths.length,
        (index) => File(
          pickedFiles.paths[index]!,
        ),
      );
      update();
    }
  }

  // الاستمارة
  void pickFile() async {
    FilePickerResult? pickedFiles = await FilePicker.platform.pickFiles(
      type: FileType.custom, // You can specify the file types here if needed
      allowedExtensions: ['jpg', 'pdf', 'doc', 'png'],
    );

    if (pickedFiles != null && pickedFiles.files.isNotEmpty) {
      formFile = File(pickedFiles.files[0].path!);
      update();
    }
  }

  @override
  void onClose() {
    print("================================ deleted");
    super.onClose();
  }
}
