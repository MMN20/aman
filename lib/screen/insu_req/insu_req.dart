import 'package:aman/controllers/claims/insu_request_claim_controller.dart';
import 'package:aman/screen/bank_req/widgets/custom_text.dart';
import 'package:aman/screen/insu_req/widgets/date_picker.dart';
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: GetBuilder(
                init: controller,
                builder: (controller) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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

                      //! التاريخ
                      const SizedBox(height: 15),
                      const CustomText(
                        text: "التاريخ",
                      ),
                      const SizedBox(height: 5),
                      CustomDatePicker(
                        dateTime: controller.pickedDate,
                        onTap: controller.pickDate,
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
