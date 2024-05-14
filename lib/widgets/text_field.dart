import 'package:aman/const.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? labelText;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final int? maxLength;
  final String? Function(String?)? validator;
  final int? maxLines;
  final String? hintText;

  const CustomTextField({
    Key? key,
    this.labelText,
    this.keyboardType,
    this.controller,
    this.maxLength,
    this.validator,
    this.maxLines,
    this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      maxLength: maxLength,
      maxLines: maxLines ?? 1,
      cursorColor: kPrimarycolor,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        labelStyle: Theme.of(context).dropdownMenuTheme.textStyle,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: kPrimarycolor),
        ),
      ),
      keyboardType: keyboardType,
      controller: controller,
      style: Theme.of(context).dropdownMenuTheme.textStyle,
    );
  }
}
