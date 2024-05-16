import 'package:aman/screen/services_details/widget/body_text.dart';
import 'package:aman/screen/services_details/widget/title_text.dart';
import 'package:flutter/material.dart';

class BankingServicesDetailsPage extends StatelessWidget {
  const BankingServicesDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("الخدمات المصرفية"),
      ),
      body: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/images/bank.jpg",
                  width: double.infinity,
                  height: 400,
                ),
                const TitleText(
                    text: """لخدمات المالية التي تقدمها منصة أمان :"""),
                const SizedBox(),
                const BodyText(
                  text:
                      """لا يخفى على الجميع اهمية خدمة الدفع الالكتروني وحوكمة الامور المالية من حيث التطور والرقي وتخفيف تداول السيولة المالية يدويا وما الى ذلك من فوائد اقتصادية جمة استخدام مختلف التطبيقات بسهولة وفي اي مكان وزمان وبدون محددات وما يمثل ذلك من تطور ومواكبة تطور العالم الخارجي ودول الجوار.
حصولهم على تسهيلات مصرفية سلف وقروض ميسرة من صندوق التقاعد والضمان الاجتماعي والمصارف التي تقدم الخدمات المصرفية في المنصة حسب الضوابط.
""",
                ),
                const SizedBox(height: 10),
                const BodyText(
                  text:
                      """1.	فتح حساب مصرفي لكل عامل وإصدار بطاقة الماستر كارد العالمية""",
                ),
                const SizedBox(height: 10),
                const BodyText(
                  text: """2.	عملة الحساب المصرفي هي الدينار او الدولار.""",
                ),
                const SizedBox(height: 10),
                const BodyText(
                  text:
                      """3.	تطبيق خاص لكل مصرف لتسهيل الإجراءات والتعاملات المصرفية يمكن للعامل من:""",
                ),
                const SizedBox(height: 10),
                const BodyText(
                  text: """4. مراقبة العمليات والحركات في الحساب""",
                ),
                const SizedBox(height: 10),
                const BodyText(
                  text:
                      """5. تحويل الأموال من حساب الى حساب وكذلك الحوالات الداخلية والخارجية حسب الضوابط.""",
                ),
                const SizedBox(height: 10),
                const BodyText(
                  text: """6. الشراء الالكتروني.""",
                ),
                const SizedBox(height: 10),
                const BodyText(
                  text: """7. دفع الفواتير.""",
                ),
                const SizedBox(height: 10),
                const BodyText(
                  text: """8. امكانية فتح حساب فرعي من الحساب الرئيسي""",
                ),
                const SizedBox(height: 10),
                const BodyText(
                  text:
                      """9. الخصومات والتخفيضات التي يحصل عليها المنتسب عند زيارته الى الأماكن التي تعرض بموجب الإعلانات.""",
                ),
                const SizedBox(height: 10),
                const TitleText(text: """الخدمات المصرفية"""),
                const SizedBox(height: 10),
                const BodyText(
                  text:
                      """لا يخفى على الجميع اهمية خدمة الدفع الالكتروني وحوكمة الامور المالية من حيث التطور والرقي وتخفيف تداول السيولة المالية يدويا وما الى ذلك من فوائد اقتصادية جمة استخدام مختلف التطبيقات بسهولة وفي اي مكان وزمان وبدون محددات وما يمثل ذلك من تطور ومواكبة تطور العالم الخارجي ودول الجوار.""",
                ),
                const SizedBox(height: 10),
                const BodyText(
                  text:
                      """حصولهم على تسهيلات مصرفية سلف وقروض ميسرة من المصارف التي تقدم الخدمات المصرفية في المنصة حسب الضوابط.""",
                ),
                const SizedBox(height: 10),
                const BodyText(
                  text:
                      """1.  فتح حساب مصرفي لكل منتسب وإصدار بطاقة الماستر كارد العالمية""",
                ),
                const SizedBox(height: 10),
                const BodyText(
                  text: """2.  عملة الحساب المصرفي هي الدينار او الدولار.""",
                ),
                const SizedBox(height: 10),
                const BodyText(
                  text:
                      """3.  تطبيق خاص لكل مصرف لتسهيل الإجراءات والتعاملات المصرفية يمكن للمنتسب من :""",
                ),
                const SizedBox(height: 10),
                const BodyText(
                  text: """-    مراقبة العمليات والحركات في الحساب""",
                ),
                const SizedBox(height: 10),
                const BodyText(
                  text:
                      """-  تحويل الأموال من حساب الى حساب وكذلك الحوالات الداخلية والخارجية حسب الضوابط .""",
                ),
                const SizedBox(height: 10),
                const BodyText(
                  text: """-   الشراء الالكتروني.""",
                ),
                const SizedBox(height: 10),
                const BodyText(
                  text: """-   دفع الفواتير .""",
                ),
                const SizedBox(height: 10),
                const BodyText(
                  text: """-   امكانية فتح حساب فرعي من الحساب الرئيسي""",
                ),
                const SizedBox(height: 10),
                const BodyText(
                  text:
                      """-  الخصومات والتخفيضات التي يحصل عليها المنتسب عند زيارته الى الأماكن التي تعرض بموجب الإعلانات.""",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
