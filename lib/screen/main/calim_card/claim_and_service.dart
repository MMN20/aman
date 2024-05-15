import 'package:aman/const.dart';
import 'package:aman/screen/service/component/low.dart';
import 'package:flutter/material.dart';

class ClaimAndServiceCard extends StatelessWidget {
  const ClaimAndServiceCard(
      {super.key,
      required this.text,
      required this.asset,
      required this.onTap});

  final String text;
  final String asset;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: const BorderSide(color: kPrimarycolor)),
            color: Colors.white,
            clipBehavior: Clip.none,
            elevation: 10,
            // shadowColor: Colors.black.withOpacity(0.5),
            surfaceTintColor: const Color.fromARGB(255, 155, 180, 185),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                border: Border.all(color: kPrimarycolor),
                gradient: LinearGradient(
                  colors: [
                    Colors.indigo.withOpacity(0.2),
                    Colors.tealAccent.shade700.withOpacity(0.1),
                  ],
                ),
              ),
              child: SizedBox(
                width: 150,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20),
                      Image.asset(
                        asset,
                        // 'assets/icon/law.png',
                        height: 70,
                        fit: BoxFit.fill,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        text,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
