import 'package:aman/const.dart';
import 'package:aman/screen/insu_req/insu_req.dart';
import 'package:aman/screen/low_req/law_req_page.dart';
import 'package:aman/widgets/general_button.dart';
import 'package:flutter/material.dart';

class LowService extends StatelessWidget {
  const LowService({super.key});

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
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: kPrimarycolor,
            title: const Text(
              "الخدمة القانونية",
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
                    '* الخدمة القانونية',
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
                    """ توفير فرق متمكنة لتقديم الاستشارات القانونية العامة مجانا وتنفيذ الطلبات بخصومات تصل حتى ٣٠٪


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
                          return const LawReqPage();
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
    );
  }
}
