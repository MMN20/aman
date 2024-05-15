import 'package:aman/controllers/claims/bank_request_controller.dart';
import 'package:aman/functions/validator.dart';
import 'package:aman/models/small_cus.dart';
import 'package:aman/screen/bank_req/widgets/custom_text.dart';
import 'package:aman/screen/bank_req/widgets/kafeel_bottom_sheet.dart';
import 'package:aman/screen/bank_req/widgets/kafeel_picker.dart';
import 'package:aman/widgets/custom_drop_down_type.dart';
import 'package:aman/widgets/dropdown.dart';
import 'package:aman/widgets/general_button.dart';
import 'package:aman/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BankReq2 extends StatelessWidget {
  const BankReq2({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BankReqController());
    controller.context = context;
    return Scaffold(
      appBar: AppBar(
        title: const Text("المطالبات المصرفية"),
      ),
      body: WillPopScope(
        onWillPop: () {
          // Get.deleteAll();
          return Future.value(true);
        },
        child: GetBuilder(
            init: controller,
            builder: (controller) {
              return controller.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : SingleChildScrollView(
                      child: Form(
                        key: controller.globalKey,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //! نوع المطالبة
                              const CustomText(
                                text: "نوع المطالبة",
                              ),
                              const SizedBox(height: 5),
                              CustomDropdown(
                                items: controller.claimTypes,
                                hintText: "اختر نوع المطالبة",
                                onChanged: controller.setSelectedClaimType,
                                selectedValue: controller.selectedClaimType,
                              ),

                              //! تفاصيل المطالبة
                              const SizedBox(height: 15),
                              const CustomText(
                                text: "تفاصيل المطالبة",
                              ),
                              const SizedBox(height: 5),
                              CustomTextField(
                                controller: controller.claimDescController,
                                hintText: "ادخل تفاصيل المطالبة",
                                maxLines: 3,
                                validator: (s) {
                                  return validator(
                                    s!,
                                    1,
                                    s.length,
                                    "يرجى ملئ الحقل",
                                    "",
                                  );
                                },
                              ),

                              //! المبلغ المطلوب
                              const SizedBox(height: 15),
                              const CustomText(
                                text: "المبلغ المطلوب",
                              ),
                              const SizedBox(height: 5),
                              CustomTextField(
                                hintText: "ادخل المبلغ المطلوب",
                                controller: controller.priceController,
                                keyboardType: TextInputType.phone,
                                validator: (s) {
                                  if (int.tryParse(s!) == null) {
                                    return "يجب ان يكون المبلغ بدون فواصل";
                                  }
                                  return validator(
                                    s!,
                                    1,
                                    s.length,
                                    "يرجى ملئ الحقل",
                                    "",
                                  );
                                },
                              ),

                              //! اسم الكفيل
                              const SizedBox(height: 15),
                              const CustomText(
                                text: "اسم الكفيل",
                              ),
                              const SizedBox(height: 5),
                              Builder(
                                builder: (context) {
                                  return KafeelPicker(
                                    selectedKafeel:
                                        controller.selectedCus?.name,
                                    onTap: () {
                                      showBottomSheet(
                                        context: context,
                                        builder: (context) {
                                          controller.resetBottomSheetSearch();
                                          return GetBuilder(
                                              id: "search",
                                              init: controller,
                                              builder: (controller) {
                                                return KafeelBottomSheet(
                                                  customers: controller
                                                      .searchedCustomers,
                                                  onChanged: controller
                                                      .searchForKafeel,
                                                  onKafeelTAp: (kafeel) {
                                                    controller
                                                        .setSelectedCus(kafeel);
                                                    Navigator.pop(context);
                                                  },
                                                );
                                              });
                                        },
                                      );
                                    },
                                  );
                                },
                              ),

                              // const SizedBox(height: 10),
                              // CustomDropdownType<SmallCus>(
                              //   items: controller.customers,
                              //   hintText: "اختر اسم الكفيل",
                              //   onChanged: controller.setSelectedCus,
                              //   selectedValue: controller.selectedCus,
                              // ),

                              //! الملفات
                              const SizedBox(height: 15),
                              const CustomText(
                                text: "الملفات:",
                              ),
                              const SizedBox(height: 5),

                              //! الاستمارة
                              Center(
                                child: GeneralButton(
                                    onPressed: () {
                                      controller.pickFile();
                                    },
                                    child: const Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text("الاستمارة"),
                                        SizedBox(width: 5),
                                        Icon(Icons.upload)
                                      ],
                                    )),
                              ),
                              if (controller.formFile != null) ...[
                                const SizedBox(height: 5),
                                Center(
                                  child: Image.file(
                                    controller.formFile!,
                                    height: 300,
                                  ),
                                ),
                              ],
                              const SizedBox(height: 10),

                              //! المرفقات
                              Center(
                                child: GeneralButton(
                                  onPressed: () {
                                    controller.pickFiles();
                                  },
                                  child: const Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("المرفقات"),
                                      SizedBox(width: 5),
                                      Icon(Icons.upload)
                                    ],
                                  ),
                                ),
                              ),
                              if (controller.files != null) ...[
                                const SizedBox(height: 5),
                                Center(
                                  child: Column(
                                    children: List.generate(
                                      controller.files!.length,
                                      (index) => Column(
                                        children: [
                                          Image.file(
                                            controller.files![index],
                                            height: 300,
                                          ),
                                          const SizedBox(height: 5)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                              const SizedBox(height: 15),
                              GeneralButton(
                                onPressed: () {
                                  controller.submit();
                                },
                                child: const SizedBox(
                                  width: double.infinity,
                                  child: Center(child: Text("حفظ")),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
            }),
      ),
    );
  }
}
