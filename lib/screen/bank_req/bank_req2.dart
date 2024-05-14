import 'package:aman/controllers/claims/bank_request_claim_controller.dart';
import 'package:aman/screen/bank_req/widgets/custom_text.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text("المطالبات المصرفية"),
      ),
      body: WillPopScope(
        onWillPop: () {
          Get.deleteAll();
          return Future.value(true);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: GetBuilder(
                init: controller,
                builder: (controller) {
                  return Column(
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
                        onChanged: (s) {},
                        selectedValue: null,
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
                      ),

                      //! اسم الكفيل
                      const SizedBox(height: 15),
                      const CustomText(
                        text: "اسم الكفيل",
                      ),
                      const SizedBox(height: 5),
                      CustomTextField(
                        hintText: "ادخل اسم الكفيل",
                        controller: controller.sponsorController,
                      ),

                      //! المنتسب
                      const SizedBox(height: 15),
                      const CustomText(
                        text: "المنتسب",
                      ),
                      const SizedBox(height: 5),
                      CustomTextField(
                        hintText: "ادخل اسم المنتسب",
                        controller: controller.muntasibController,
                      ),

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
                              mainAxisAlignment: MainAxisAlignment.center,
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
                              (index) => Image.file(
                                controller.files![index],
                                height: 300,
                              ),
                            ),
                          ),
                        ),
                      ],
                      const SizedBox(height: 15),
                      GeneralButton(
                        onPressed: () {},
                        child: const SizedBox(
                          width: double.infinity,
                          child: Center(child: Text("حفظ")),
                        ),
                      ),
                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }
}
