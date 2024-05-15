import 'package:aman/controllers/req_status/medical_req_status_controller.dart';
import 'package:aman/models/medical_service.dart';
import 'package:aman/screen/claim_status/status_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MedicalServiceStatusPage extends StatelessWidget {
  const MedicalServiceStatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MedicalServiceController());
    controller.context = context;
    return WillPopScope(
      onWillPop: () {
        Get.delete<MedicalServiceController>();
        return Future.value(true);
      },
      child: GetBuilder(
          init: controller,
          builder: (context) {
            return Scaffold(
              appBar: AppBar(
                title: const Text("حالة الطلبات الصحية"),
              ),
              body: controller.isFirstLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ListView.builder(
                        controller: controller.scrollController,
                        itemCount: controller.bankStatus.length,
                        itemBuilder: (context, index) {
                          MedicalServiceStatus medicalServiceStatus =
                              controller.bankStatus[index];
                          return Column(
                            children: [
                              ReqStatusCard(
                                  onTap: () {
                                    controller
                                        .goToDetailsPage(medicalServiceStatus);
                                  },
                                  details: medicalServiceStatus.details,
                                  reqID: medicalServiceStatus.id,
                                  status: "status: ${medicalServiceStatus.id}"),
                              if (index + 1 == controller.bankStatus.length &&
                                  controller.isLoading) ...[
                                const CircularProgressIndicator(),
                                const SizedBox(height: 15),
                              ]
                            ],
                          );
                        },
                      ),
                    ),
            );
          }),
    );
  }
}
