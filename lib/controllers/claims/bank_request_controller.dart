import 'dart:convert';
import 'dart:io';
import 'package:aman/api/api.dart';
import 'package:aman/api/api_links.dart';
import 'package:aman/functions/is_file_a_image.dart';
import 'package:aman/models/cus.dart';
import 'package:aman/models/small_cus.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

// this is for the main page of Bank Requests

class BankReqController extends GetxController {
  late BuildContext context;
  bool isLoading = true;

  //! نوع المطالبة
  List<String> claimTypes = ["فتح حساب بنكي", "الحصول على قرض", "اخرى"];
  int selectedClaimTypeIndex = 1;

  String? selectedClaimType;
  void setSelectedClaimType(String? newVal) {
    selectedClaimType = newVal;
    if (selectedClaimType != null) {
      selectedClaimTypeIndex = claimTypes.indexOf(selectedClaimType!) + 1;
    }
  }

  // الكفلاء
  List<SmallCus> customers = [];
  SmallCus? selectedCus;

  // This is for searched kafeel in the bottom sheet
  late List<SmallCus> searchedCustomers;

  void searchForKafeel(String text) {
    searchedCustomers =
        customers.where((element) => element.name.contains(text)).toList();
    update(['search']);
  }

  void resetBottomSheetSearch() {
    searchedCustomers = customers;
  }

  TextEditingController claimDescController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  List<File>? files;
  File? formFile;

  Future<void> getAllCustomers() async {
    Api api = Api();
    dynamic response = await api.getData("app_cus");
    List responseData = json.decode(response.body);
    customers = responseData.map((e) => SmallCus.fromJson(e)).toList();
    searchedCustomers = customers;
  }

  // for form validation
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  bool isValid() {
    if (!globalKey.currentState!.validate()) {
      return false;
    }

    if (selectedClaimType == null ||
        selectedCus == null ||
        files == null ||
        formFile == null) {
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

  bool? canShowFormImage;

  // الاستمارة
  void pickFile() async {
    FilePickerResult? pickedFiles = await FilePicker.platform.pickFiles(
      type: FileType.custom, // You can specify the file types here if needed
      allowedExtensions: ['jpg', 'pdf', 'doc', 'png'],
    );

    if (pickedFiles != null && pickedFiles.files.isNotEmpty) {
      formFile = File(pickedFiles.files[0].path!);
      canShowFormImage = true;
      if (!isFileAImage(formFile!.path)) {
        canShowFormImage = false;
      }

      update();
    }
  }

  Future<Map<String, String>> getPostData() async {
    String desc = claimDescController.text;
    String price = priceController.text;
    // الكفيل
    String selectCustomerId = selectedCus!.id.toString();

    // for current user id

    var sharePref = await SharedPreferences.getInstance();

    var userdata = cusFromJson(sharePref.getString('cuslogin')!);

    print("current user ${userdata.cus.id}");
    print("Kafeel $selectCustomerId");

    return {
      'cus_id': userdata.cus.id.toString(),
      'cost': price,
      'details': desc,
      'kafeel': selectCustomerId,
      "union_id": userdata.cus.unionId,
      "req_type": selectedClaimTypeIndex.toString()
    };
  }

  Future postWithFiles() async {
    http.MultipartRequest multipartRequest =
        http.MultipartRequest("POST", Uri.parse(ApiLinks.bankRequestForm));

    if (files!.isNotEmpty) {
      for (File file in files!) {
        http.MultipartFile multipartFile =
            await http.MultipartFile.fromPath('imgs[]', file.path);
        multipartRequest.files.add(multipartFile);
      }
    }

    multipartRequest.files
        .add(await http.MultipartFile.fromPath('contract', formFile!.path));

    multipartRequest.fields.addAll(await getPostData());

    try {
      http.StreamedResponse streamedResponse = await multipartRequest.send();
      http.Response response = await http.Response.fromStream(streamedResponse);
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 302) {
        return "success";
      } else {
        return "error";
      }
    } catch (e) {
      return "error";
    }
  }

  void submit() async {
    if (!isValid()) {
      showSnackBar("الرجاء ملئ جميع الحقول");

      return;
    }

    isLoading = true;
    update();

    dynamic response = await postWithFiles();

    if (response == "success") {
      showSnackBar("تم حفظ الطلب بنجاح");
      Navigator.pop(context);
      isLoading = false;
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

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  void disposeAllControllers() {
    claimDescController.dispose();
    priceController.dispose();
  }

  @override
  void onClose() {
    disposeAllControllers();
    super.onClose();
  }
}
