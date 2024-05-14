import 'package:aman/const.dart';
import 'package:flutter/material.dart';

class IdCard extends StatelessWidget {
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

  const IdCard({
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
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('هوية مؤسسة امان'),
          backgroundColor: kPrimarycolor,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 545,
                  height: 893,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Image.asset(
                          'assets/ID/org-front.png',
                          width: MediaQuery.of(context).size.width * 0.94,
                        ),
                      ),
                      Positioned(
                        right: 129,
                        top: 129,
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
                      Positioned(
                        right: 127,
                        top: 350,
                        child: Text(
                          name,
                          style: const TextStyle(
                            fontSize: 19,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 127,
                        top: 385,
                        child: Text(
                          categorize,
                          style: const TextStyle(
                            fontSize: 19,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 130,
                        top: 422,
                        child: Text(
                          job,
                          style: const TextStyle(
                            fontSize: 19,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 127,
                        top: 463,
                        child: Text(
                          dob.substring(0,10),
                          style: const TextStyle(
                            fontSize: 19,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 183,
                        top: 500,
                        child: Text(
                          insurance,
                          style: const TextStyle(
                            fontSize: 19,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 165,
                        top: 536,
                        child: Text(
                          gov,
                          style: const TextStyle(
                            fontSize: 19,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 175,
                        top: 574,
                        child: Text(
                          expire.substring(0,10),
                          style: const TextStyle(
                            fontSize: 19,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
