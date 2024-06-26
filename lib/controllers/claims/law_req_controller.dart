import 'dart:io';
import 'package:aman/api/api.dart';
import 'package:aman/api/api_links.dart';
import 'package:aman/functions/is_file_a_image.dart';
import 'package:aman/models/cus.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

// this is for the main page of Law Requests

class LawRequController extends GetxController {
  late BuildContext context;
  bool isLoading = false;

  // نوع الطلب
  List<String> reqTypes = ['استشارة قانونية', "دعوى قانونية"];
  late String selectedReqType;

  TextEditingController reqDescController = TextEditingController();
  // مستندات
  List<File>? files;

  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  List<String> claimTypes = ["بداءة", "تحقيق", "شرعية", "شركات", "اخرى"];
  String? selectedClaimType;

  void intiData() {
    selectedReqType = reqTypes[0];
  }

  void setSelectedReqType(String? reqType) {
    selectedReqType = reqType!;
    update();
  }

  void setSelectedClaim(String? claim) {
    selectedClaimType = claim!;
    update();
  }

  bool? canShowImages;

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
      canShowImages = true;
      for (File f in files!) {
        if (!isFileAImage(f.path)) {
          canShowImages = false;
          break;
        }
      }
      update();
    }
  }

  bool isValid() {
    if (!globalKey.currentState!.validate() ||
        files == null ||
        (selectedReqType == "دعوى قانونية" && selectedClaimType == null)) {
      return false;
    }
    return true;
  }

  Future<Map<String, String>> getFormData() async {
    var sharePref = await SharedPreferences.getInstance();

    var userdata = cusFromJson(sharePref.getString('cuslogin')!);
    return {
      "cus_id": userdata.cus.id.toString(),
      "req_desc": reqDescController.text,
      "req_type": selectedReqType,
      "claim_type": selectedClaimType ?? ""
    };
  }

  void submit() async {
    if (!isValid()) {
      showSnackBar("الرجاء ملئ جميع الحقول");
      return;
    }
    isLoading = true;
    update();

    dynamic response = await postWithFiles(
        await getFormData(), files!, ApiLinks.lawRequestForm);

    if (response == "success") {
      showSnackBar("تم حفظ الطلب بنجاح");
      Navigator.pop(context);
    } else {
      isLoading = false;
      update();
      showSnackBar("حدث خطأ اثناء عملية الاضافة، يرجى المحاولة لاحقاً");
    }
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
        ),
      ),
    );
  }

  void disposeAllControllers() {
    reqDescController.dispose();
  }

  @override
  void onInit() {
    intiData();
    super.onInit();
  }
}
