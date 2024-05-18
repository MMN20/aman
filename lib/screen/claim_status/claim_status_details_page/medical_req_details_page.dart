import 'package:aman/models/medical_service.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

class MedicalReqDetailsPage extends StatelessWidget {
  const MedicalReqDetailsPage({
    super.key,
    required this.medicalServiceStatus,
  });
  final MedicalServiceStatus medicalServiceStatus;
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
        title: const Text("تفاصيل المطالبة الصحية"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("الرقم: ${medicalServiceStatus.id}", style: textStyle),
            const Divider(),
            Text(
                "الحالة: ${statusResponse[int.parse(medicalServiceStatus.status)]}",
                style: textStyle),
            if (medicalServiceStatus.status == "2") ...[
              const Divider(),
              Text("سبب الرفض: ${medicalServiceStatus.fail}", style: textStyle),
            ],
            const Divider(),
            Text("التفاصيل: ${medicalServiceStatus.details}", style: textStyle),
            const Divider(),
            Text("السعر: ${medicalServiceStatus.price}", style: textStyle),
            const Divider(),
            Text(
              "تاريخ الارسال: ${Jiffy.parseFromDateTime(medicalServiceStatus.createdAt).format(pattern: "dd/MM/yyyy")}",
              style: textStyle,
            ),
          ],
        ),
      ),
    );
  }
}
