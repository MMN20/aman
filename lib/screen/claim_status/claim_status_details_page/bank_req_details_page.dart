import 'package:aman/models/bank_service.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

class BankReqDetailsPage extends StatelessWidget {
  const BankReqDetailsPage({super.key, required this.bankServiceStatus});
  final BankServiceStatus bankServiceStatus;
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = const TextStyle(fontSize: 20);
    return Scaffold(
      appBar: AppBar(
        title: const Text("تفاصيل المطالبة المصرفية"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("الرقم: ${bankServiceStatus.id}", style: textStyle),
                const Divider(),
                Text("الحالة: ${bankServiceStatus.status}", style: textStyle),
                const Divider(),
                Text("التفاصيل: ${bankServiceStatus.details}",
                    style: textStyle),
                const Divider(),
                Text("السعر: ${bankServiceStatus.cost}", style: textStyle),
                const Divider(),
                Text(
                  "تاريخ الارسال: ${Jiffy.parseFromDateTime(bankServiceStatus.createdAt).format(pattern: "dd/MM/yyyy")}",
                  style: textStyle,
                ),
                Text("العقد:", style: textStyle),
                const SizedBox(height: 5),
                Center(
                  child: Image.network(
                    bankServiceStatus.contract,
                    height: 300,
                  ),
                ),
                Text("الكفيل: ${bankServiceStatus.kafeel}", style: textStyle),
                const Divider(),
              ],
            ),
          )),
    );
  }
}
