import 'package:aman/controllers/claims/insu_request_claim_controller.dart';
import 'package:aman/functions/validator.dart';
import 'package:aman/models/small_cus.dart';
import 'package:aman/screen/bank_req/widgets/custom_text.dart';
import 'package:aman/screen/insu_req/widgets/date_picker.dart';
import 'package:aman/widgets/custom_drop_down_type.dart';
import 'package:aman/widgets/dropdown.dart';
import 'package:aman/widgets/general_button.dart';
import 'package:aman/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InsuReqPage extends StatelessWidget {
  const InsuReqPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(InsuReqClaimController());
    controller.context = context;
    return Scaffold(
      appBar: AppBar(
        title: const Text("مطالبات التأمين"),
      ),
      body: WillPopScope(
        onWillPop: () {
          Get.deleteAll();
          return Future.value(true);
        },
        child: GetBuilder(
            init: controller,
            builder: (context) {
              return controller.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Form(
                      key: controller.globalKey,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // //! نوع المطالبة
                              // const CustomText(
                              //   text: "نوع المطالبة",
                              // ),
                              // const SizedBox(height: 5),
                              // CustomDropdown(
                              //   items: controller.claimTypes,
                              //   hintText: "اختر نوع المطالبة",
                              //   onChanged: controller.setSelectedClaimType,
                              //   selectedValue: controller.selectedClaimType,
                              // ),

                              //! تفاصيل المطالبة
                              // const SizedBox(height: 15),
                              const CustomText(
                                text: "تفاصيل المطالبة",
                              ),
                              const SizedBox(height: 5),
                              CustomTextField(
                                controller: controller.claimDescController,
                                hintText: "ادخل تفاصيل المطالبة",
                                maxLines: 3,
                                validator: (s) {
                                  return validator(s!, 1, s.length, "", "");
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
                                  return validator(s!, 1, s.length, "", "",
                                      false, "الرجاء ادخال المبلغ المطلوب");
                                },
                              ),

                              //! التاريخ
                              // const SizedBox(height: 15),
                              // const CustomText(
                              //   text: "التاريخ",
                              // ),
                              // const SizedBox(height: 5),
                              // CustomDatePicker(
                              //   dateTime: controller.pickedDate,
                              //   onTap: controller.pickDate,
                              // ),

                              //! اسم الكفيل
                              // const SizedBox(height: 15),
                              // const CustomText(
                              //   text: "اسم الكفيل",
                              // ),
                              // const SizedBox(height: 5),
                              // CustomDropdownType<SmallCus>(
                              //   items: controller.customers,
                              //   hintText: "الكفيل",
                              //   onChanged: controller.setSelectedCus,
                              //   selectedValue: controller.selectedCus,
                              // ),

                              //! الملفات
                              const SizedBox(height: 15),
                              const CustomText(
                                text: "المرفقات:",
                              ),
                              const SizedBox(height: 5),

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
                              if (controller.canShowImages == true &&
                                  controller.files != null) ...[
                                const SizedBox(height: 5),
                                Center(
                                  child: Column(
                                    children: List.generate(
                                      controller.files!.length,
                                      (index) => Image.file(
                                        controller.files![index],
                                        height: 300,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                              if (controller.canShowImages == false)
                                const Text(
                                  "تم تحديد الملفات",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              const SizedBox(
                                height: 10,
                              ),
                              const SizedBox(height: 15),
                              GeneralButton(
                                onPressed: controller.submit,
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
