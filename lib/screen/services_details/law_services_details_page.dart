import 'package:aman/screen/services_details/widget/body_text.dart';
import 'package:aman/screen/services_details/widget/title_text.dart';
import 'package:flutter/material.dart';

class LawServicesDetailsPage extends StatelessWidget {
  const LawServicesDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("الخدمات القانونية"),
      ),
      body: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/images/law.jpg",
                  width: double.infinity,
                  height: 400,
                ),
                const TitleText(
                    text: """الخدمات القانونية التي تقدمها منصة أمان:
              """),
                const SizedBox(),
                const BodyText(
                  text:
                      """تقدم منصة أمان الخدمات والاستشارات القانونية الى المنتسبين من خلال شركة قانونية مختصة وكفؤة توفر الخدمة القانونية""",
                ),
                const SizedBox(height: 10),
                const BodyText(
                  text:
                      """ا- استشارات قانونية مجانية التي تخص قانون العمل والضمان الاجتماعي وقانون الاستثمار
""",
                ),
                const SizedBox(height: 10),
                const BodyText(
                  text:
                      """ب- تمثيل القانوني من الفئات المستفيدة في الدوائر المعنية""",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
