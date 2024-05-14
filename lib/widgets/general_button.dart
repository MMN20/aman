import 'package:aman/const.dart';
import 'package:flutter/material.dart';

class GeneralButton extends StatelessWidget {
  const GeneralButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.minSize,
    this.backgroundColor,
    this.elevation,
  });
  final void Function() onPressed;
  final Widget child;
  final Size? minSize;
  final Color? backgroundColor;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          elevation: elevation,
          padding: const EdgeInsets.all(10),
          minimumSize: minSize,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: const BorderSide(color: kPrimarycolor),
          ),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          textStyle: const TextStyle(fontSize: 15)),
      child: child,
    );
  }
}

class NextPrevButton extends StatelessWidget {
  const NextPrevButton({
    super.key,
    required this.onTap,
    required this.text,
    required this.isNext,
  });

  final void Function() onTap;
  final String text;
  final bool isNext;

  @override
  Widget build(BuildContext context) {
    return GeneralButton(
      onPressed: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: isNext
            ? [
                Text(text),
                const Icon(Icons.arrow_forward_rounded),
              ]
            : [
                const Icon(Icons.arrow_back_rounded),
                Text(text),
              ],
      ),
    );
  }
}
