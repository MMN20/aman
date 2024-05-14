import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InsuReqClaimController extends GetxController {
  late BuildContext context;

  TextEditingController claimDescController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  // المنتسب
  TextEditingController muntasibController = TextEditingController();

  List<File>? files;
  DateTime? pickedDate;

  void disposeAllControllers() {
    claimDescController.dispose();
    priceController.dispose();
    muntasibController.dispose();
  }

  void pickDate() async {
    DateTime? date = await showDatePicker(
        context: context,
        firstDate: DateTime.now(),
        lastDate: DateTime(2030),
        textDirection: TextDirection.rtl);

    if (date != null) {
      pickedDate = date;
      update();
    }
  }

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

  @override
  void onClose() {
    disposeAllControllers();
    super.onClose();
  }
}
