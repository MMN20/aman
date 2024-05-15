// ignore_for_file: library_private_types_in_public_api, must_be_immutable

import 'package:aman/const.dart';
import 'package:aman/controllers/sign_up_page_controller.dart';
import 'package:aman/screen/signup/pages/page1.dart';
import 'package:aman/screen/signup/pages/page2.dart';
import 'package:aman/screen/signup/pages/page3.dart';
import 'package:aman/widgets/general_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/dropdown.dart';
import '../../widgets/file_picker.dart';
import '../../widgets/package_drop.dart';
import '../../widgets/text_field.dart';

class SignUp extends StatefulWidget {
  String? selectedValue;
  SignUp(this.selectedValue, {super.key});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpPageController());
    controller.context = context;
    // controller.currentPage = 0;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: WillPopScope(
        onWillPop: () {
          Get.deleteAll();
          return Future.value(true);
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: kPrimarycolor,
            title: const Text('طلب انتساب'),
          ),
          body: GetBuilder(
              init: controller,
              builder: (controller) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (controller.currentPage == 0) Container(),
                          if (controller.currentPage > 0)
                            NextPrevButton(
                              isNext: false,
                              onTap: controller.goToPrevPage,
                              text: "السابق",
                            ),
                          if (controller.currentPage < 2)
                            NextPrevButton(
                              isNext: true,
                              onTap: controller.goToNextPage,
                              text: "التالي",
                            ),
                        ],
                      ),
                      Expanded(
                        child: controller.isInit
                            ? PageView(
                                physics: const NeverScrollableScrollPhysics(),
                                onPageChanged: (value) {
                                  controller.changeCurrentPage(value);
                                },
                                controller: controller.pageController,
                                children: [
                                  SingUpPage1(
                                    formKey: controller.page1Key,
                                    govenorates: controller.govenorates,
                                    selectedGovernorate:
                                        controller.selectedGovernorate,
                                    onGovernorateChanged:
                                        controller.onGovernorateChanged,
                                    package: controller.package!,
                                    onNextTap: controller.goToNextPage,
                                    nameController: controller.nameController,
                                    nearestPointController:
                                        controller.nearestPointController,
                                    phoneNumberController:
                                        controller.phoneNumberController,
                                  ),
                                  SingUpPage2(
                                    page2Key: controller.page2Key,
                                    onSectorChanged: controller.onSectorChanged,
                                    selectedSector: controller.selectedSector,
                                    sectors: controller.sectors,
                                    onNextTap: controller.goToNextPage,
                                    onPrevTap: controller.goToPrevPage,
                                    jobController: controller.jobController,
                                    jobLocationController:
                                        controller.jobLocationController,
                                    jobProviderNameController:
                                        controller.jobProviderNameController,
                                    jobYearsController:
                                        controller.jobYearsController,
                                  ),
                                  SignUpPage3(
                                    onPackageSelected:
                                        controller.onPackageSelected,
                                    package: controller.package!,
                                    onSubmit: controller.submitForm,
                                    selectedPackage: controller.selectedPackage,
                                    pickedFiles: controller.pickedFiles,
                                    onPickFiles: controller.onPickFiles,
                                    canShowImages: controller.canShowImages,
                                    isPage3Loading: controller.isPage3Loading,
                                  )
                                ],
                              )
                            : const Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircularProgressIndicator(),
                                    SizedBox(height: 10),
                                    Text("يرجى الانتظار...")
                                  ],
                                ),
                              ),
                      ),
                      // const CustomTextField(
                      //   labelText: 'الاسم الرباعي',
                      // ),
                      // const SizedBox(height: 10),
                      // const CustomTextField(
                      //   labelText: 'رقم الهاتف',
                      //   keyboardType: TextInputType.phone,
                      // ),
                      // const SizedBox(height: 10),
                      // CustomDropdown(
                      //   items: govenorates,
                      //   hintText: 'اختر المحافظة',
                      //   selectedValue:
                      //       selectedGovernorate, // Pass your selected value here
                      //   onChanged: (newValue) {
                      //     setState(() {
                      //       selectedGovernorate = newValue;
                      //     });
                      //   },
                      // ),
                      // const SizedBox(height: 10),
                      // const CustomTextField(
                      //   labelText: 'اقرب نقطة دالة',
                      //   keyboardType: TextInputType.phone,
                      // ),
                      // const SizedBox(height: 10),
                      // CustomDropdown(
                      //   items: sectors,
                      //   hintText: 'المهنة',
                      //   selectedValue: selectedSector, // Pass your selected value here
                      //   onChanged: (newValue) {
                      //     setState(() {
                      //       selectedSector = newValue;
                      //     });
                      //   },
                      // ),
                      // const SizedBox(height: 10),
                      // const PackageDropdown(),
                      // const CustomFilePicker(
                      //   labelText: 'المرفقات',
                      // ),
                      // const SizedBox(height: 20),
                      // ElevatedButton(
                      //   onPressed: () {
                      //     // Implement functionality to submit the form
                      //     print("submit");
                      //   },
                      //   child: const Text('ارسال البيانات'),
                      // ),
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
