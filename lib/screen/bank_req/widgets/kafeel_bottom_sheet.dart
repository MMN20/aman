import 'package:aman/const.dart';
import 'package:aman/models/small_cus.dart';
import 'package:flutter/material.dart';

class KafeelBottomSheet extends StatelessWidget {
  const KafeelBottomSheet(
      {super.key,
      required this.customers,
      required this.onKafeelTAp,
      required this.onChanged});

  final List<SmallCus> customers;
  final void Function(SmallCus) onKafeelTAp;
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    return SizedBox(
      // 50% off the device screen
      height: height * 0.5,
      child: Column(
        children: [
          TextField(
            onChanged: onChanged,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: "ادخل اسم الكفيل",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(25),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(25),
                ),
              ),
            ),
          ),
          const SizedBox(height: 2),
          Expanded(
            child: ListView.builder(
              itemCount: customers.length,
              itemBuilder: (context, index) {
                SmallCus cus = customers[index];
                return InkWell(
                  onTap: () {
                    onKafeelTAp(cus);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 2.5),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.05),
                        border: Border.all(color: kPrimarycolor)),
                    alignment: Alignment.center,
                    child: Text(cus.name),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
