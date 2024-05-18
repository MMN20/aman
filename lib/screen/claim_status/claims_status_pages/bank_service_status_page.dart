import 'package:aman/controllers/req_status/bank_req_status_controller.dart';
import 'package:aman/models/bank_service.dart';
import 'package:aman/screen/claim_status/status_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BankServiceStatusPage extends StatelessWidget {
  const BankServiceStatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BankServiceController());
    controller.context = context;
    return GetBuilder(
        init: controller,
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("حالة الطلبات المصرفية"),
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
                        BankServiceStatus bankServiceStatus =
                            controller.bankStatus[index];
                        return Column(
                          children: [
                            ReqStatusCard(
                              onTap: () {
                                controller.goToDetailsPage(bankServiceStatus);
                              },
                              details: bankServiceStatus.details,
                              status: controller.statusResponse[1],
                              reqID: bankServiceStatus.id,
                            ),
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
        });
  }
}
