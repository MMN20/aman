import 'dart:ui';

import 'package:aman/provider/app.dart';
import 'package:aman/screen/id/org2.dart';
import 'package:aman/screen/main/calim_card/claim_and_service.dart';
import 'package:aman/screen/services_details/banking_services_details_page.dart';
import 'package:aman/screen/services_details/electronic_wallet_details.dart';
import 'package:aman/screen/services_details/insu_services_details_page.dart';
import 'package:aman/screen/services_details/law_services_details_page.dart';
import 'package:aman/widgets/location_and_id_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../const.dart';
import '../../widgets/location.dart';
import '../id/org.dart';
import '../service/component/bank.dart';
import '../service/component/insu.dart';
import '../service/component/low.dart';

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var app = Provider.of<AppProvider>(context);
    return SizedBox.expand(
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 48,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 5, right: 8),
                    width: MediaQuery.of(context).size.width * 0.85,
                    height: 50,
                    margin: const EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      color: kPrimarycolor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: search,
                      textDirection: TextDirection.rtl,
                      decoration: const InputDecoration(
                        hintTextDirection: TextDirection.rtl,
                        hintText: '   ابحث عن خدمة',
                        suffixIcon: Icon(Icons.search),
                        fillColor: kPrimarycolor,
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 90,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    const SizedBox(width: 15),
                    // InkWell(
                    //     borderRadius: BorderRadius.circular(15),
                    //     onTap: () {
                    //       Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //           builder: (context) => IdCard2(
                    //             userImg: app.userdata.cus.img,
                    //             qrCode: '',
                    //             cardNo: app.userdata.cus.cardNo,
                    //             name: app.userdata.cus.name,
                    //             job: app.userdata.cus.job,
                    //             categorize: app.userdata.cus.categorize,
                    //             dob: app.userdata.cus.dob,
                    //             insurance: app.userdata.cus.insurance,
                    //             gov: app.userdata.cus.govs.name,
                    //             expire: app.userdata.cus.endDate,
                    //           ),
                    //         ),
                    //       );
                    //     },
                    //     child: Card(
                    //       child: ClipRRect(
                    //         child: BackdropFilter(
                    //           filter: ImageFilter.blur(sigmaX: 0),
                    //           child: Container(
                    //             // height: 100,
                    //             width: 80,
                    //             decoration: BoxDecoration(
                    //               borderRadius: BorderRadius.circular(15),
                    //               color: Colors.white,
                    //               border: Border.all(color: kPrimarycolor),
                    //               gradient: LinearGradient(
                    //                 colors: [
                    //                   Colors.indigo.withOpacity(0.8),
                    //                   Colors.black.withOpacity(0.4),
                    //                 ],
                    //               ),
                    //             ),
                    //             child: const Center(
                    //               child: Icon(
                    //                 Icons.card_membership_rounded,
                    //                 size: 35,
                    //                 color: Colors.white,
                    //               ),
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     )

                    //     //! old ID Card widget
                    //     //  Padding(
                    //     //   padding: const EdgeInsets.only(right: 25),
                    //     //   child: Container(
                    //     //     height: 140,
                    //     //     width: 120,
                    //     //     decoration: const BoxDecoration(
                    //     //       image: DecorationImage(
                    //     //         image: AssetImage(
                    //     //           'assets/images/id-card.png',
                    //     //         ),
                    //     //         fit: BoxFit.cover,
                    //     //       ),
                    //     //     ),
                    //     //   ),
                    //     // ),
                    //     ),

                    //! ID Card
                    LocationAndIDCard(
                      iconData: Icons.card_membership_rounded,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => IdCard2(
                              userImg: app.userdata.cus.img,
                              qrCode: '',
                              cardNo: app.userdata.cus.cardNo,
                              name: app.userdata.cus.name,
                              job: app.userdata.cus.job,
                              categorize: app.userdata.cus.categorize,
                              dob: app.userdata.cus.dob,
                              insurance: app.userdata.cus.insurance,
                              gov: app.userdata.cus.govs.name,
                              expire: app.userdata.cus.endDate,
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(width: 10),
                    //! Location
                    LocationAndIDCard(
                      iconData: Icons.location_on_outlined,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const LocationScreen();
                            },
                          ),
                        );
                      },
                    ),

                    //! old location
                    // InkWell(
                    //   onTap: () {
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //         builder: (context) {
                    //           return const LocationScreen();
                    //         },
                    //       ),
                    //     );
                    //   },
                    //   child: Image.asset(
                    //     'assets/images/location-card.png',
                    //     height: 140,
                    //     width: 120,
                    //     fit: BoxFit.cover,
                    //   ),
                    // ),
                  ],
                ),
              ),
              const Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "المطالبات",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    //! المطالبة القانونية
                    ClaimAndServiceCard(
                      asset: 'assets/icon/law.png',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LowService(),
                          ),
                        );
                      },
                      text: 'القانونية',
                    ),
                    //! المطالبة المصرفية
                    ClaimAndServiceCard(
                      asset: 'assets/icon/bank.png',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const BankService(),
                          ),
                        );
                      },
                      text: 'المصرفية',
                    ),
                    //! مطالبة التأمين
                    ClaimAndServiceCard(
                      asset: 'assets/icon/law.png',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const InsuranceService(),
                          ),
                        );
                      },
                      text: 'التأمين',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "الخدمات",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    ClaimAndServiceCard(
                      asset: 'assets/icon/insurance.png',
                      text: 'خدمات التأمين',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return const InsuServicesDetailsPage();
                          }),
                        );
                      },
                    ),
                    ClaimAndServiceCard(
                      asset: 'assets/icon/law.png',
                      text: 'خدمات قانونية',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return const LawServicesDetailsPage();
                          }),
                        );
                      },
                    ),
                    ClaimAndServiceCard(
                      asset: 'assets/icon/bank.png',
                      text: 'خدمات مصرفية',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return const BankingServicesDetailsPage();
                          }),
                        );
                      },
                    ),
                    ClaimAndServiceCard(
                      asset: 'assets/icon/wallet.png',
                      text: 'المحفظة الالكترونية',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return const ElectronicServicesDetailsPage();
                          }),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
