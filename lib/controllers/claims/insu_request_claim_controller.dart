import 'dart:convert';
import 'dart:io';
import 'package:aman/api/api.dart';
import 'package:aman/api/api_links.dart';
import 'package:aman/models/cus.dart';
import 'package:aman/models/small_cus.dart';
import 'package:aman/provider/app.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InsuReqClaimController extends GetxController {
  late BuildContext context;
  bool isLoading = true;

  TextEditingController claimDescController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  // // المنتسب
  // TextEditingController muntasibController = TextEditingController();

  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  bool isValid() {
    if (!globalKey.currentState!.validate()) {
      return false;
    }

    if (pickedDate == null) {
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

  // الكفلاء
  List<SmallCus> customers = [];
  SmallCus? selectedCus;

  Future<Map<String, String>> getPostData() async {
    String desc = claimDescController.text;
    String price = priceController.text;
    // الكفيل
    String selectCustomer = selectedCus!.id.toString();
    String date = pickedDate.toString();

    // for current user id

    var sharePref = await SharedPreferences.getInstance();

    var userdata = cusFromJson(sharePref.getString('cuslogin')!);
    print("current user ${userdata.cus.id}");
    print("Kafeel $selectCustomer");

    return {
      'cus_id': userdata.cus.id.toString(),
      'price': price,
      'details': desc,
      'union_id': selectCustomer
    };
  }

  Future<void> getAllCustomers() async {
    Api api = Api();
    dynamic response = await api.getData("app_cus");
    List responseData = json.decode(response.body);
    customers = responseData.map((e) => SmallCus.fromJson(e)).toList();
  }

  void initData() async {
    await getAllCustomers();
    isLoading = false;

    update();
  }

  List<File>? files;
  DateTime? pickedDate;

  void disposeAllControllers() {
    claimDescController.dispose();
    priceController.dispose();
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

  void setSelectedCus(SmallCus? cus) {
    selectedCus = cus;
    print(selectedCus!.id);
    print(selectedCus!.name);
    update();
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

  void submit() async {
    if (!isValid()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("يرجى ملئ جميع الحقول"),
        ),
      );
    }

    isLoading = true;
    update();

    dynamic response = await postWithFiles(
      await getPostData(),
      files!,
      ApiLinks.medicalRequestForm,
    );

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

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  @override
  void onClose() {
    disposeAllControllers();
    super.onClose();
  }
}
