import 'package:aman/screen/services_details/widget/body_text.dart';
import 'package:aman/screen/services_details/widget/title_text.dart';
import 'package:flutter/material.dart';

class InsuServicesDetailsPage extends StatelessWidget {
  const InsuServicesDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("خدمات التأمين"),
      ),
      body: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/images/insu.jpg",
                  width: double.infinity,
                  height: 400,
                ),
                const TitleText(text: """الخدمات الصحية التي تقدمها منصة أمان:
              """),
                const SizedBox(),
                const BodyText(
                  text:
                      """1.	امكانية التعميم على شبكة المستشفيات المتعاقدة مع الشركة في جميع محافظات العراق وخارج العراق بانضمام شركة التأمين الى نطاق التغطية وبالتالي قبول بطاقة (أمان) لدى المستشفيات المعتمدة والمؤسسات الطبية الاخرى بدون حاجة المريض للتسديد ضمن جدول وشكل موضح يعرض للمنتسب.""",
                ),
                const SizedBox(height: 10),
                const BodyText(
                  text:
                      """2.	امكانيه حصولهم على (بطاقة أمان ثانوية) تصدر من الحساب الرئيسي لعوائلهم لتسهيل وتقليل الضغط على العامل ولتنظيم الية مراجعاتهم للمستشفيات والمراكز الصحية وضمن الية الكترونية وأرشفة جميع المعلومات لهم.""",
                ),
                const SizedBox(height: 10),
                const BodyText(
                  text:
                      """3.	تدقيق لكافة موظفي المؤسسة الصحية عند اعطائهم اجازات مرضية من المؤسسات الصحية عن طريق المنظومة الالكترونية.""",
                ),
                const SizedBox(height: 10),
                const BodyText(
                  text:
                      """4.	تقديم احصائية دقيقة بكمية ونوعية الادوية المصروفة والمطلوبة وانواع العلاجات المقدمة للمستفيدين ولموظفي المؤسسة ومراقبة مدى جودتها""",
                ),
                const SizedBox(height: 10),
                const BodyText(
                  text:
                      """5.	القضاء على حالات صفة الانتماء للمؤسسة من قبل ضعفاء النفوس لاستخدام العلاج المجاني من خلال تزوير الاوراق الثبوتية.""",
                ),
                const SizedBox(height: 10),
                const BodyText(
                  text:
                      """6.	استفادة المواطنين من خدمات البطاقة الصحية التي تسهل عليهم تلقي العلاج من المؤسسات الصحية لاحتواها على سجلاتهم الطبية ومعلوماتهم العلاجية وبذلك يحقق سرعة في تشخيص وتلقي العلاج وخصوصا حالات الحوادث لا سامح الله.""",
                ),
                const SizedBox(height: 10),
                const BodyText(
                  text:
                      """7.	تامين خدمة للزبائن المنتسبين على مدار الساعة (24/24) وطيلة ايام الاسبوع (7 أيام) وذلك من خلال مركز مساعدة الزبائن call center.""",
                ),
                const SizedBox(height: 10),
                const Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "8. تأمين الحوادث الشخصية:",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text:
                            """ يعني أن تقوم المنصة بدفع تعويض عن الإصابات الناتجة عن الحادث العرضي الذي قد يصيب المؤمن له ولو احد منتسبيه والذي يؤدي إلى الوفاة أو العجز الكلي أو الجزئي""",
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const BodyText(
                  text: """أ‌-	الوفاة 
ب‌-	 العجـز الكلي : يعني الاصابات التي تمنع المنتسب من مزاولة حياته الطبيعية بشكل دائمي 
ت‌-	. العجز الجزئي: يعني الاصابات التي تمنع المنتسب من مزاولة حياته الطبيعية بشكل دائمي أو موقت طاقات جدول المنافع .""",
                ),
                const SizedBox(height: 10),
                const Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "9. التأمين الصحي :",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text:
                            """ يعني أن تقوم المنصة بدفع تعويض عن الإصابات الناتجة عن الحادث العرضي الذي قد يصيب المؤمن له ولو احد منتسبيه والذي يؤدي إلى الوفاة أو العجز الكلي أو الجزئي""",
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "11.	الخدمات والاستشارات القانونية:",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text:
                            """ توفر المنصة من خلال الهوية النقابية خدمات واستشارات قانونية مجانية على مدار السنة من خلال قنوات الدعم .""",
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "12.	الخدمات المهنية :",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text:
                            """ تنظيم دورات تدريبية بكافة المجالات المهنية والتخصصات والاخرى بشهادات معتمدة على الصعيد المحلي والدولي.""",
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "13.	الخدمات المصرفية :",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text:
                            """ فتح حساب مصرفي جاري لكل منتسب واصدار بطاقة الماستر كارد العالمية عن طريق مصارف معتمدة ورصينة بدون أجور والحصول على الخدمات المصرفية التي تقدمها المصارف حسب الضوابط .""",
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const BodyText(
                  text:
                      """7-	خصومات لحاملين الهوية النقابية الالكترونية أمان في أماكن عديدة في كافة انحاء العراق منها( مراكز التجميل, عيادات الاسنان، شركات السيارات ، مراكز التسوق، المطاعم وغرها""",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
