import 'package:aman/functions/validator.dart';
import 'package:aman/models/cus.dart';
import 'package:aman/models/packages.dart';
import 'package:aman/widgets/custom_drop_down_type.dart';
import 'package:aman/widgets/dropdown.dart';
import 'package:aman/widgets/file_picker.dart';
import 'package:aman/widgets/general_button.dart';
import 'package:aman/widgets/package_drop.dart';
import 'package:aman/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SingUpPage1 extends StatelessWidget {
  const SingUpPage1({
    super.key,
    required this.govenorates,
    this.selectedGovernorate,
    required this.onGovernorateChanged,
    required this.package,
    required this.onNextTap,
    required this.formKey,
    required this.nameController,
    required this.phoneNumberController,
    required this.nearestPointController,
  });
  final List<Govs> govenorates;
  final Govs? selectedGovernorate;
  final void Function(Govs?) onGovernorateChanged;

  final Package package;
  final void Function() onNextTap;
  final GlobalKey<FormState> formKey;

  final TextEditingController nameController;
  final TextEditingController phoneNumberController;
  final TextEditingController nearestPointController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            CustomTextField(
              controller: nameController,
              labelText: 'الاسم الرباعي',
              validator: (s) {
                return validator(s!, 1, s.length, "الرجاء ادخال الاسم الرباعي",
                    "", false, "الرجاء ادخال الاسم الرباعي");
              },
            ),
            const SizedBox(height: 10),
            CustomTextField(
              controller: phoneNumberController,
              labelText: 'رقم الهاتف',
              validator: (s) {
                if (int.tryParse(s!) == null) {
                  return "الرجاء ادخال الرقم بصيغة صحيحة";
                }

                if (!s.startsWith("07")) {
                  return "يجب ان يبدأ الرقم ب 07";
                }

                return validator(
                    s!,
                    1,
                    11,
                    "الرجاء ادخال رقم الهاتف",
                    "الرجاء ادخال 11 رقماً فقط",
                    false,
                    "الرجاء ادخال رقم الهاتف");
              },
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 10),
            CustomDropdownType<Govs>(
              items: govenorates,
              hintText: 'اختر المحافظة',
              selectedValue:
                  selectedGovernorate, // Pass your selected value here
              onChanged: onGovernorateChanged,
            ),
            const SizedBox(height: 10),
            CustomTextField(
              controller: nearestPointController,
              labelText: 'اقرب نقطة دالة',
              validator: (s) {
                return validator(s!, 1, s.length, "الرجاء ادخال اقرب نقطة دالة",
                    "", false, "الرجاء ادخال اقرب نقطة دالة");
              },
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
