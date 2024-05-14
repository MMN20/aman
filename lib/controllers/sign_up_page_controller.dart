import 'dart:io';
import 'package:aman/models/packages.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SignUpPageController extends GetxController {
  // page1 validation
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  String? selectedGovernorate;
  TextEditingController nearestPointController = TextEditingController();
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

  // page2 validation
  TextEditingController jobController = TextEditingController();
  TextEditingController jobYearsController = TextEditingController();
  TextEditingController jobLocationController = TextEditingController();
  TextEditingController jobProviderNameController = TextEditingController();
  String? selectedSector;
  GlobalKey<FormState> page2Key = GlobalKey<FormState>();

  bool validatePage2() {
    if (!page2Key.currentState!.validate() || selectedSector == null) {
      return false;
    }

    return true;
  }

  BuildContext? context;

  PageController pageController = PageController();
  List<File>? pickedFiles;

  List<String> govenorates = const [
    "بغداد",
    "نينوى",
    "البصرة",
    "صلاح الدين",
    "دهوك",
    "أربيل",
    "السليمانية",
    "ديالى",
    "واسط",
    "ميسان",
    "ذي قار",
    "المثنى",
    "بابل",
    "كربلاء",
    "النجف",
    "الانبار",
    "الديوانية",
    "كركوك",
    "حلبجة"
  ];

  List<String> sectors = const ["قطاع خاص", "حكومي"];

  // the list of packages
  Package? package;
  bool isPackagesInit = false;

  // for the package selector
  PackageElement? selectedPackage;

  int currentPage = 0;

  void goToNextPage() {
    if (currentPage == 0 && !validatePage1()) {
      if (context != null) {
        ScaffoldMessenger.of(context!).showSnackBar(
            const SnackBar(content: Text("الرجاء ملئ جميع الحقول")));
      }
      return;
    }

    if (currentPage == 1 && !validatePage2()) {
      if (context != null) {
        ScaffoldMessenger.of(context!).showSnackBar(
            const SnackBar(content: Text("الرجاء ملئ جميع الحقول")));
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

  void onGovernorateChanged(String? newVal) {
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

  void initPackages() async {
    Package result = await fetchPackages();
    package = result;
    isPackagesInit = true;
    update();
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
          'html'
        ], // Example file types
      );

      if (result != null) {
        pickedFiles = List.generate(
            result.paths.length, (index) => File(result.paths[index]!));
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
    initPackages();
    super.onInit();
  }
}
