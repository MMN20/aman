import 'package:aman/functions/validator.dart';
import 'package:aman/widgets/dropdown.dart';
import 'package:aman/widgets/text_field.dart';
import 'package:flutter/material.dart';

class SingUpPage2 extends StatelessWidget {
  const SingUpPage2(
      {super.key,
      required this.sectors,
      this.selectedSector,
      required this.onSectorChanged,
      required this.onPrevTap,
      required this.onNextTap,
      required this.page2Key,
      required this.jobController,
      required this.jobYearsController,
      required this.jobLocationController,
      required this.jobProviderNameController});

  final List<String> sectors;
  final String? selectedSector;
  final void Function(String?) onSectorChanged;

  final void Function() onPrevTap;
  final void Function() onNextTap;
  final GlobalKey<FormState> page2Key;

  final TextEditingController jobController;
  final TextEditingController jobYearsController;
  final TextEditingController jobLocationController;
  final TextEditingController jobProviderNameController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: page2Key,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 10),
            CustomTextField(
              controller: jobController,
              labelText: 'المهنة',
              validator: (s) {
                return validator(
                    s!, 1, s.length, "", "", false, "الرجاء ادخال المهنة");
              },
            ),
            const SizedBox(height: 10),
            CustomTextField(
              controller: jobYearsController,
              labelText: 'عدد سنوات العمل في المهنة',
              maxLength: 2,
              keyboardType: TextInputType.number,
              validator: (s) {
                if (int.tryParse(s!) == null) {
                  return "الرجاء ادخال الرقم بصيغة صحيحة";
                }
                return validator(s!, 1, s.length, "", "", false,
                    "الرجاء ادخال عدد سنوات العمل في المهنة");
              },
            ),
            const SizedBox(height: 10),
            CustomTextField(
              controller: jobLocationController,
              labelText: 'عنوان العمل',
              validator: (s) {
                return validator(
                    s!, 1, s.length, "", "", false, "الرجاء ادخال عنوان العمل");
              },
            ),
            const SizedBox(height: 10),
            CustomTextField(
              controller: jobProviderNameController,
              labelText: 'اسم جهة العمل',
              validator: (s) {
                return validator(s!, 1, s.length, "", "", false,
                    "الرجاء ادخال اسم جهة العمل");
              },
            ),
            const SizedBox(height: 10),
            CustomDropdown(
                items: sectors,
                hintText: 'قطاع العمل',
                selectedValue: selectedSector, // Pass your selected value here
                onChanged: onSectorChanged),
          ],
        ),
      ),
    );
  }
}
