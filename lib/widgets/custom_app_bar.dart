import 'dart:ui';

import 'package:aman/const.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key,
      required this.i,
      required this.onHomeTap,
      required this.onProfileTap});
  final int i;
  final void Function() onHomeTap;
  final void Function() onProfileTap;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
        child: Container(
          height: 50,
          decoration: BoxDecoration(
              color: kPrimarycolor,
              borderRadius: BorderRadius.circular(15),
              gradient: LinearGradient(
                colors: [
                  Colors.indigo.withOpacity(0.8),
                  Colors.teal.withOpacity(0.4),
                ],
              )),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                splashFactory: NoSplash.splashFactory,
                onTap: onHomeTap,
                child: AnimatedScale(
                  duration: const Duration(milliseconds: 300),
                  scale: i == 0 ? 1.2 : 1,
                  child: const Icon(
                    Icons.home_outlined,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
              InkWell(
                splashFactory: NoSplash.splashFactory,
                onTap: onProfileTap,
                child: AnimatedScale(
                  duration: const Duration(milliseconds: 300),
                  scale: i == 1 ? 1.2 : 1,
                  child: const Icon(
                    Icons.person_outline_rounded,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
