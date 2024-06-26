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

// this is for the main page of Rnsurance Requests

class InsuReqClaimController extends GetxController {
  late BuildContext context;
  bool isLoading = false;

  TextEditingController claimDescController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  bool? canShowImages;

  // // المنتسب
  // TextEditingController muntasibController = TextEditingController();

  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  bool isValid() {
    if (!globalKey.currentState!.validate()) {
      return false;
    }

    //! for the date picker in the UI (commented because I disabled the date picking)
    // if (pickedDate == null) {
    //   return false;
    // }

    // if (selectedCus == null) {
    //   return false;
    // }

    if (files == null) {
      return false;
    }

    return true;
  }

  // //! this will be fetched from an api
  // List<String> claimTypes = ["فتح حساب بنكي", "الحصول على قرض", "اخرى"];

  // String? selectedClaimType;
  // void setSelectedClaimType(String? newVal) {
  //   selectedClaimType = newVal;
  // }

  //  الكفلاء
  // List<SmallCus> customers = [];
  // SmallCus? selectedCus;

  bool isFileAImage(String filePath) {
    List<String> name = filePath.split(".");
    String ext = name.last;
    if (ext != 'jpg' && ext != 'png' && ext != 'jpeg') {
      return false;
    }
    return true;
  }

  Future<Map<String, String>> getPostData() async {
    String desc = claimDescController.text;
    String price = priceController.text;
    // الكفيل
    // String selectCustomer = selectedCus!.id.toString();
    // String date = pickedDate.toString();

    // for current user id

    var sharePref = await SharedPreferences.getInstance();

    var userdata = cusFromJson(sharePref.getString('cuslogin')!);
    print("current user ${userdata.cus.id}");
    // print("Kafeel $selectCustomer");

    return {
      'cus_id': userdata.cus.id.toString(),
      'price': price,
      'details': desc,
      'union_id': userdata.cus.unionId,
    };
  }

  // Future<void> getAllCustomers() async {
  //   Api api = Api();
  //   dynamic response = await api.getData("app_cus");
  //   List responseData = json.decode(response.body);
  //   customers = responseData.map((e) => SmallCus.fromJson(e)).toList();
  // }

  // void initData() async {
  //   await getAllCustomers();
  //   isLoading = false;

  //   update();
  // }

  List<File>? files;

  //! for the date picker in the UI
  // DateTime? pickedDate;
  // void pickDate() async {
  //   DateTime? date = await showDatePicker(
  //       context: context,
  //       firstDate: DateTime.now(),
  //       lastDate: DateTime(2030),
  //       textDirection: TextDirection.rtl);

  //   if (date != null) {
  //     pickedDate = date;
  //     update();
  //   }
  // }

  // void setSelectedCus(SmallCus? cus) {
  //   selectedCus = cus;
  //   print(selectedCus!.id);
  //   print(selectedCus!.name);
  //   update();
  // }

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

  void submit() async {
    if (!isValid()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("يرجى ملئ جميع الحقول"),
        ),
      );
      return;
    }

    isLoading = true;
    update();

    dynamic response = await postWithFiles(
      await getPostData(),
      files!,
      ApiLinks.medicalRequestForm,
    );

    isLoading = false;
    if (response == "success") {
      showSnackBar("تم حفظ الطلب بنجاح");
      Navigator.pop(context);
    } else {
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
    // initData();
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
