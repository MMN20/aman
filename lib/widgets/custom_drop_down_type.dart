// ignore_for_file: library_private_types_in_public_api

import 'package:aman/const.dart';
import 'package:flutter/material.dart';

class CustomDropdownType<T> extends StatefulWidget {
  final List<T> items;
  final String hintText;
  final T? selectedValue;
  final void Function(T?) onChanged;

  const CustomDropdownType({
    Key? key,
    required this.items,
    required this.hintText,
    required this.onChanged,
    this.selectedValue,
  }) : super(key: key);

  @override
  _CustomDropdownTypeState<T> createState() => _CustomDropdownTypeState<T>();
}

class _CustomDropdownTypeState<T> extends State<CustomDropdownType<T>> {
  T? _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.selectedValue;
  }

  @override
  Widget build(BuildContext context) {
    print(_selectedValue.runtimeType);
    return DropdownButtonFormField<T>(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: kPrimarycolor)),
      ),
      style: Theme.of(context).dropdownMenuTheme.textStyle,
      menuMaxHeight: 400,
      value: _selectedValue,
      hint: Text(widget.hintText),
      items: widget.items.map((item) {
        dynamic s = item;
        String name = s.name;
        return DropdownMenuItem<T>(
          value: item,
          child: Text(name),
        );
      }).toList(),
      onChanged: (newValue) {
        widget.onChanged(newValue);
      },
    );
  }
}
