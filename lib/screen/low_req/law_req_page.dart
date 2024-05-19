import 'package:aman/controllers/claims/law_req_controller.dart';
import 'package:aman/functions/validator.dart';
import 'package:aman/screen/bank_req/widgets/custom_text.dart';
import 'package:aman/widgets/dropdown.dart';
import 'package:aman/widgets/general_button.dart';
import 'package:aman/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LawReqPage extends StatelessWidget {
  const LawReqPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LawRequController());
    controller.context = context;
    return Scaffold(
      appBar: AppBar(
        title: const Text("المطالبات القانونية"),
      ),
      body: WillPopScope(
        onWillPop: () {
          Get.deleteAll();
          return Future.value(true);
        },
        child: GetBuilder(
            init: controller,
            builder: (controller) {
              return controller.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Form(
                      key: controller.globalKey,
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //! نوع الطلب
                              const CustomText(
                                text: "نوع الطلب",
                              ),
                              const SizedBox(height: 5),
                              CustomDropdown(
                                items: controller.reqTypes,
                                hintText: "اختر نوع الطلب",
                                onChanged: controller.setSelectedReqType,
                                selectedValue: controller.selectedReqType,
                              ),

                              //! وصف الطلب
                              const SizedBox(height: 15),
                              const CustomText(
                                text: "وصف الطلب",
                              ),
                              const SizedBox(height: 5),
                              CustomTextField(
                                controller: controller.reqDescController,
                                hintText: "ادخل وصف الطلب",
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

                              //! نوع الدعوى
                              if (controller.selectedReqType ==
                                  "دعوى قانونية") ...[
                                const SizedBox(height: 15),
                                const CustomText(
                                  text: "نوع الدعوى",
                                ),
                                const SizedBox(height: 5),
                                CustomDropdown(
                                  items: controller.claimTypes,
                                  hintText: "اختر نوع الدعوى",
                                  onChanged: controller.setSelectedClaim,
                                  selectedValue: controller.selectedClaimType,
                                ),
                              ],

                              //! المستندات
                              const SizedBox(height: 15),
                              const CustomText(
                                text: "المستندات:",
                              ),
                              const SizedBox(height: 10),

                              //! المستندات
                              Center(
                                child: GeneralButton(
                                  onPressed: () {
                                    controller.pickFiles();
                                  },
                                  child: const Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("المستندات"),
                                      SizedBox(width: 5),
                                      Icon(Icons.upload)
                                    ],
                                  ),
                                ),
                              ),

                              //! view docs when available
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

                              SizedBox(height: 5),
                              if (controller.canShowImages == false)
                                const Text(
                                  "تم تحديد الملفات",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),

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
