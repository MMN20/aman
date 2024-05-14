import 'dart:convert';
import 'dart:io';
import 'package:aman/api/api.dart';
import 'package:aman/api/api_links.dart';
import 'package:aman/models/cus.dart';
import 'package:aman/models/packages.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SignUpPageController extends GetxController {
  //! page1 validation
  TextEditingController nameController = TextEditingController(text: "ششش");
  TextEditingController phoneNumberController =
      TextEditingController(text: "07501234567");
  Govs? selectedGovernorate;
  TextEditingController nearestPointController =
      TextEditingController(text: "ششش");
  GlobalKey<FormState> page1Key = GlobalKey<FormState>();

  // give it the phone number and it will return it with the key
  String getPhoneNumberInCorrectForm(String data) {
    data = data.replaceAll(RegExp(r'[^0-9]'), '');
    data = data.replaceFirst(RegExp(r'^0+'), '');
    data = data.replaceFirst('+964', '');
    data = "+964$data";
    return data;
  }

  bool validatePage1() {
    if (!page1Key.currentState!.validate() || selectedGovernorate == null) {
      return false;
    }

    return true;
  }

  //! page2 validation
  TextEditingController jobController = TextEditingController(text: "ششش");
  TextEditingController jobYearsController = TextEditingController(text: "12");
  TextEditingController jobLocationController =
      TextEditingController(text: "ششش");
  TextEditingController jobProviderNameController =
      TextEditingController(text: "ششش");
  String? selectedSector;
  GlobalKey<FormState> page2Key = GlobalKey<FormState>();

  //! page3 validation
  List<File>? pickedFiles;
  // the list of packages
  Package? package;
  bool isInit = false;
  // for the package selector
  PackageElement? selectedPackage;
  // if false then do not show the files (they are not images)
  bool? canShowImages;
  bool isPage3Loading = false;

  static const String _validationMessage = "الرجاء ملئ جميع الحقول المطلوبة";
  bool validatePage2() {
    if (!page2Key.currentState!.validate() || selectedSector == null) {
      return false;
    }

    return true;
  }

  bool validatePage3() {
    if (selectedPackage != null && pickedFiles != null) {
      return true;
    }
    return false;
  }

  Future postWithFiles(
      Map<String, String> data, List<File> files, String url) async {
    http.MultipartRequest multipartRequest =
        http.MultipartRequest("POST", Uri.parse(url));

    if (files.isNotEmpty) {
      for (File file in files) {
        http.MultipartFile multipartFile =
            await http.MultipartFile.fromPath('imgs[]', file.path);
        multipartRequest.files.add(multipartFile);
      }
    }

    multipartRequest.fields.addAll(data);

    try {
      http.StreamedResponse streamedResponse = await multipartRequest.send();
      http.Response response = await http.Response.fromStream(streamedResponse);
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200 ||
          response.statusCode == 201 ||
          response.statusCode == 302) {
        return "success";
      } else {
        print(response.body);
        return "error";
      }
    } catch (e) {
      print(e.toString());
      return "error";
    }
  }

  Map<String, String> getSubmitData() {
    // page1
    String name = nameController.text;
    String phone = phoneNumberController.text;
    String govID = selectedGovernorate!.id.toString();
    String nearestPoint = nearestPointController.text;

    // page2
    String job = jobController.text;
    String jobYears = jobYearsController.text;
    String jobLocation = jobLocationController.text;
    // اسم جهة العمل
    String jobProviderLocation = jobProviderNameController.text;
    String selectedSector = this.selectedSector!;

    // page3
    String selectedPackagID = selectedPackage!.id.toString();

    return {
      'name': name,
      'phone': phone,
      'gov_id': govID,
      'point': nearestPoint,
      'work_section': selectedSector,
      'job': job,
      'work_years': jobYears,
      'work_place': jobLocation,
      'work_place_name': jobProviderLocation,
      'package_id': selectedPackagID
    };
  }

  void submitForm() async {
    if (validatePage3()) {
      isPage3Loading = true;
      update();

      Map<String, String> data = getSubmitData();

      dynamic res =
          await postWithFiles(data, pickedFiles!, ApiLinks.submitCusRegForm);
      if (res == "success") {
        ScaffoldMessenger.of(context!)
            .showSnackBar(const SnackBar(content: Text("تم حفظ الطلب بنجاح!")));
        Navigator.of(context!).pop();
      } else {
        print(
            "Failed======================================================123871623987126389712398172369812736");
      }
    } else {
      ScaffoldMessenger.of(context!).showSnackBar(
        const SnackBar(
          content: Text(_validationMessage),
        ),
      );
    }
    isPage3Loading = false;
    update();
  }

  BuildContext? context;

  PageController pageController = PageController();

  List<Govs> govenorates = const [];

  List<String> sectors = const ["قطاع خاص", "حكومي"];

  int currentPage = 0;

  void goToNextPage() {
    if (currentPage == 0 && !validatePage1()) {
      if (context != null) {
        ScaffoldMessenger.of(context!)
            .showSnackBar(const SnackBar(content: Text(_validationMessage)));
      }
      return;
    }

    if (currentPage == 1 && !validatePage2()) {
      if (context != null) {
        ScaffoldMessenger.of(context!)
            .showSnackBar(const SnackBar(content: Text(_validationMessage)));
      }
      return;
    }

    changeCurrentPage(currentPage + 1);
  }

  void goToPrevPage() {
    changeCurrentPage(currentPage - 1);
  }

  void changeCurrentPage(int newPage) {
    if (currentPage != newPage && newPage <= 2 && newPage >= 0) {
      currentPage = newPage;
      pageController.animateToPage(currentPage,
          duration: const Duration(milliseconds: 200), curve: Curves.bounceIn);
      update();
    }
  }

  void onGovernorateChanged(Govs? newVal) {
    print(newVal?.id);
    print(newVal?.name);
    selectedGovernorate = newVal;
  }

  void onSectorChanged(String? newVal) {
    selectedSector = newVal;
  }

  Future<Package> fetchPackages() async {
    final response = await http
        .get(Uri.parse('https://system.aman-iraq.com/api/api-package'));

    if (response.statusCode == 200) {
      final data = packageFromJson(response.body);

      return data;
    } else {
      throw Exception('Failed to load delivery prices');
    }
  }

  void onPackageSelected(PackageElement? selectedPackage) {
    this.selectedPackage = selectedPackage;
    update();
  }

  Future<void> initPackages() async {
    Package result = await fetchPackages();
    print(result.package[0].id);
    package = result;
  }

  Future<void> initGovs() async {
    Api api = Api();
    http.Response response = await api.getData(ApiLinks.allGovsApi);
    List apiGovs = [];
    if (response.statusCode == 200 || response.statusCode == 201) {
      apiGovs = jsonDecode(response.body);
      print(apiGovs);
      govenorates = List<Govs>.generate(
          apiGovs.length, (index) => Govs.fromJson(apiGovs[index]));
      isInit = true;
      update();
    } else {
      ScaffoldMessenger.of(context!).showSnackBar(
        const SnackBar(
          content: Text("هنالك مشكلة في الاتصال!"),
        ),
      );
    }
  }

  void initAllData() async {
    await initPackages();
    initGovs();
  }

  bool isFileAImage(String filePath) {
    List<String> name = filePath.split(".");
    String ext = name.last;
    if (ext != 'jpg' && ext != 'png' && ext != 'jpeg') {
      return false;
    }
    return true;
  }

  //! for picking the files
  Future<void> onPickFiles() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: FileType.custom, // Specify the file types you want to pick
        allowedExtensions: [
          'pdf',
          'doc',
          'docx',
          'jpg',
          'png',
          'html',
          'jpeg'
        ], // Example file types
      );

      if (result != null) {
        pickedFiles = List.generate(
            result.paths.length, (index) => File(result.paths[index]!));
        canShowImages = true;
        for (File f in pickedFiles!) {
          if (!isFileAImage(f.path)) {
            canShowImages = false;
            break;
          }
        }
        update();
      }
    } catch (e) {
      print('Error picking files: $e');
    }
  }

  void disposeAllControllers() {
    nameController.dispose();
    phoneNumberController.dispose();
    nearestPointController.dispose();
    jobController.dispose();
    jobYearsController.dispose();
    jobLocationController.dispose();
    jobProviderNameController.dispose();
  }

  @override
  void onClose() {
    disposeAllControllers();
    super.onClose();
  }

  @override
  void onInit() {
    initAllData();
    super.onInit();
  }
}
