import 'dart:convert';
import 'dart:io';

import 'package:aman/api/api.dart';
import 'package:aman/models/small_cus.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BankReqController extends GetxController {
  late BuildContext context;
  bool isLoading = true;

  //! this will be fetched from an api
  List<String> claimTypes = ["فتح حساب بنكي", "الحصول على قرض", "اخرى"];

  String? selectedClaimType;
  // الكفلاء
  List<SmallCus> customers = [];
  SmallCus? selectedCus;

  Future<void> getAllCustomers() async {
    Api api = Api();
    dynamic response = await api.getData("app_cus");
    List responseData = json.decode(response.body);
    customers = responseData.map((e) => SmallCus.fromJson(e)).toList();
  }

  // for form validation
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  bool isValid() {
    if (!globalKey.currentState!.validate()) {
      return false;
    }

    if (selectedClaimType == null) {
      return false;
    }

    if (selectedCus == null) {
      return false;
    }

    if (files == null) {
      return false;
    }

    return true;
  }

  void initData() async {
    await getAllCustomers();
    isLoading = false;

    update();
  }

  void setSelectedCus(SmallCus? cus) {
    selectedCus = cus;
    print(selectedCus!.id);
    print(selectedCus!.name);
    update();
  }

  TextEditingController claimDescController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  // الكفيل
  TextEditingController sponsorController = TextEditingController();

  List<File>? files;

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

  void submit() {
    if (!isValid()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "الرجاء ملئ جميع الحقول",
          ),
        ),
      );
    }
  }

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  @override
  void onClose() {
    print("================================ deleted");
    super.onClose();
  }
}
