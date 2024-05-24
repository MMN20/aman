import 'package:aman/controllers/req_status/law_claims_status_controller.dart';
import 'package:aman/models/law_claim.dart';
import 'package:aman/screen/claim_status/status_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LawClaimsStatusPage extends StatelessWidget {
  const LawClaimsStatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LawClaimsStatusController());
    controller.context = context;
    return WillPopScope(
      onWillPop: () {
        Get.delete<LawClaimsStatusController>();
        return Future.value(true);
      },
      child: GetBuilder(
          init: controller,
          builder: (context) {
            return Scaffold(
              appBar: AppBar(
                title: const Text("حالة الطلبات القانونية"),
              ),
              body: controller.isFirstLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ListView.builder(
                        controller: controller.scrollController,
                        itemCount: controller.lawClaims.length,
                        itemBuilder: (context, index) {
                          LawClaim lawClaim = controller.lawClaims[index];
                          return Column(
                            children: [
                              ReqStatusCard(
                                onTap: () {
                                  controller.goToDetailsPage(lawClaim);
                                },
                                reqID: lawClaim.id,
                                details: lawClaim.reqDesc,
                                status: controller.statusResponse[
                                    int.parse(lawClaim.status.toString())],
                              ),
                              if (index + 1 == controller.lawClaims.length &&
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
