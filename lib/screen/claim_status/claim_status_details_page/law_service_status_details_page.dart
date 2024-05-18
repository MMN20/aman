import 'package:aman/models/law_claim.dart';
import 'package:flutter/material.dart';

class LawReqDetailsPage extends StatelessWidget {
  const LawReqDetailsPage({super.key, required this.lawClaim});
  final LawClaim lawClaim;
  @override
  Widget build(BuildContext context) {
    List<String> statusResponse = [
      "قيد المراجعة",
      "تمت الموافقة على المطالبة",
      "فشلت المطالبة "
    ];
    TextStyle textStyle = const TextStyle(fontSize: 18);
    return Scaffold(
      appBar: AppBar(
        title: const Text("تفاصيل المطالبة القانونية"),
      ),
      body: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("الرقم: ${lawClaim.id}", style: textStyle),
              const Divider(),
              Text("الحالة: ${statusResponse[lawClaim.status]}",
                  style: textStyle),
              if (lawClaim.status == 2) ...[
                const Divider(),
                Text("سبب الفشل: ${lawClaim.fail}", style: textStyle),
              ],
              const Divider(),
              Text("التفاصيل: ${lawClaim.reqDesc}", style: textStyle),
              const Divider(),
              Text("نوع الطلب: ${lawClaim.reqType}", style: textStyle),
              if (lawClaim.claimType != "") ...[
                const Divider(),
                Text("نوع الدعوى: ${lawClaim.claimType}", style: textStyle)
              ]
            ],
          ),
        ),
      ),
    );
  }
}
