import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

class CustomDatePicker extends StatelessWidget {
  const CustomDatePicker({super.key, this.dateTime, required this.onTap});
  final DateTime? dateTime;
  final void Function() onTap;

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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              dateTime != null
                  ? Jiffy.parseFromDateTime(dateTime!)
                      .format(pattern: "dd/MM/yyyy")
                  : "السنة/الشهر/اليوم",
              style: Theme.of(context).dropdownMenuTheme.textStyle!.copyWith(
                  color: dateTime == null
                      ? const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5)
                      : null),
            ),
            const Icon(Icons.date_range_outlined)
          ],
        ),
      ),
    );
  }
}
