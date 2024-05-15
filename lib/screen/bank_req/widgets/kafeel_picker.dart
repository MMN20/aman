import 'package:flutter/material.dart';

class KafeelPicker extends StatelessWidget {
  const KafeelPicker(
      {super.key, required this.onTap, required this.selectedKafeel});
  final void Function() onTap;
  final String? selectedKafeel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 65,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
          ),
        ),
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 10, left: 10),
        child: selectedKafeel != null
            ? Text(selectedKafeel!)
            : const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("اختر الكفيل"),
                  Icon(Icons.person_outline_rounded)
                ],
              ),
      ),
    );
  }
}
