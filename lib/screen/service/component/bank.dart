import 'package:aman/const.dart';
import 'package:aman/screen/bank_req/bank_req2.dart';
import 'package:aman/widgets/general_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../bank_req/bank_req.dart';

class BankService extends StatelessWidget {
  const BankService({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('assets/images/main.jpg'),
          filterQuality: FilterQuality.high,
        ),
      ),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: WillPopScope(
          onWillPop: () {
            Get.deleteAll();
            return Future.value(true);
          },
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: kPrimarycolor,
              title: const Text(
                "الخدمات المصرفية",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            backgroundColor: Colors.white.withOpacity(0.2),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 180,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: const Text(
                      '* الخدمات المصرفية',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: const Text(
                      """ السعي الدائم بالتعاون مع المؤسسات المالية على المستوى الدولي والمحلي لتوفير القروض وانشاء الصناديق المالية لانجاح حاضنات الاعمال
                           """,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  GeneralButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const BankReq2();
                            // return const BankReqForm();
                          },
                        ),
                      );
                    },
                    child: const Text(
                      "لطلب الخدمة يرجى ملئ الاستمارة بالضغط هنا",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
