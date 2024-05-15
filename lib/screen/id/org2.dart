import 'package:aman/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class IdCard2 extends StatelessWidget {
  final String userImg;
  final String qrCode;
  final String cardNo;
  final String name;
  final String job;
  final String categorize;
  final String dob;
  final String insurance;
  final String gov;
  final String expire;

  const IdCard2({
    Key? key,
    required this.userImg,
    required this.qrCode,
    required this.cardNo,
    required this.name,
    required this.job,
    required this.categorize,
    required this.dob,
    required this.insurance,
    required this.gov,
    required this.expire,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double fontSize = 18;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('هوية مؤسسة امان'),
          backgroundColor: kPrimarycolor,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: SizedBox(
              height: 570,
              width: 360,
              child: LayoutBuilder(builder: (context, constraints) {
                double height = constraints.maxHeight;
                double width = constraints.maxWidth;
                print("width $width");
                print("height $height");
                return Stack(
                  children: [
                    //! ID Image
                    Image.asset(
                      'assets/ID/org-front.png',
                      width: width,
                      height: height,
                      fit: BoxFit.fill,
                    ),

                    //! Photo
                    Positioned(
                      right: width * 0.23,
                      top: height * 0.19,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(
                          userImg,
                          width: 130,
                          height: 152,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),

                    //! name
                    Positioned(
                      right: width * 0.20,
                      top: height * 0.548,
                      child: Text(
                        name,
                        style: const TextStyle(
                          fontSize: fontSize,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    //! Categorize
                    Positioned(
                      right: width * 0.260,
                      top: height * 0.6,
                      child: Text(
                        categorize,
                        style: const TextStyle(
                          fontSize: fontSize,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    //! Job
                    Positioned(
                      right: width * 0.268,
                      top: height * 0.658,
                      child: Text(
                        job,
                        style: const TextStyle(
                          fontSize: fontSize,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    //! birth date
                    Positioned(
                      right: width * 0.242,
                      top: height * 0.723,
                      child: Text(
                        dob.substring(0, 10),
                        style: const TextStyle(
                          fontSize: fontSize,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    //! insurance number
                    Positioned(
                      right: width * 0.41,
                      top: height * 0.782,
                      child: Text(
                        insurance,
                        style: const TextStyle(
                          fontSize: fontSize,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    //! Governorate
                    Positioned(
                      right: width * 0.352,
                      top: height * 0.835,
                      child: Text(
                        gov,
                        style: const TextStyle(
                          fontSize: fontSize,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    //! Expire date
                    Positioned(
                      right: width * 0.375,
                      top: height * 0.894,
                      child: Text(
                        expire.substring(0, 10),
                        style: const TextStyle(
                          fontSize: fontSize,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
