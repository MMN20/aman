import 'package:aman/screen/claim_status/claims_status_pages/bank_service_status_page.dart';
import 'package:aman/screen/claim_status/claims_status_pages/law_services_status_page.dart';
import 'package:aman/screen/claim_status/claims_status_pages/medical_service_status_page.dart';
import 'package:aman/screen/main/calim_card/claim_and_service.dart';
import 'package:flutter/material.dart';

class ClaimStatusMainPage extends StatelessWidget {
  const ClaimStatusMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "اختر نوع المطالبة لرؤية الحالة",
                style: TextStyle(fontSize: 22),
              ),
              //! المطالبة القانونية
              SizedBox(
                height: 200,
                child: ClaimAndServiceCard(
                  asset: 'assets/icon/law.png',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LawClaimsStatusPage(),
                      ),
                    );
                  },
                  text: 'القانونية',
                ),
              ),
              //! المطالبة المصرفية
              SizedBox(
                height: 200,
                child: ClaimAndServiceCard(
                  asset: 'assets/icon/bank.png',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BankServiceStatusPage(),
                      ),
                    );
                  },
                  text: 'المصرفية',
                ),
              ),
              //! مطالبة التأمين
              SizedBox(
                height: 200,
                child: ClaimAndServiceCard(
                  asset: 'assets/icon/law.png',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MedicalServiceStatusPage(),
                      ),
                    );
                  },
                  text: 'التأمين',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
