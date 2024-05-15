import 'dart:ui';

import 'package:aman/const.dart';
import 'package:flutter/material.dart';

class LocationAndIDCard extends StatelessWidget {
  const LocationAndIDCard(
      {super.key, required this.onTap, required this.iconData});
  final void Function() onTap;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: onTap,
        child: Card(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10),
              child: Container(
                // height: 100,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  border: Border.all(color: kPrimarycolor),
                  gradient: LinearGradient(
                    colors: [
                      Colors.indigo.withOpacity(0.7),
                      Colors.teal.withOpacity(0.1),
                    ],
                    begin: Alignment.center,
                    end: Alignment.bottomRight,
                    // tileMode: TileMode.decal,
                  ),
                ),
                child: Center(
                  child: Icon(
                    iconData,
                    size: 35,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        )

        //! old ID Card widget
        //  Padding(
        //   padding: const EdgeInsets.only(right: 25),
        //   child: Container(
        //     height: 140,
        //     width: 120,
        //     decoration: const BoxDecoration(
        //       image: DecorationImage(
        //         image: AssetImage(
        //           'assets/images/id-card.png',
        //         ),
        //         fit: BoxFit.cover,
        //       ),
        //     ),
        //   ),
        // ),
        );
  }
}
