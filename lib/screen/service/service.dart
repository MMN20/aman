
import 'package:flutter/material.dart';
import '../../const.dart';
import '../main/main.dart';
import '../profile/profile.dart';

class ServiceScreen extends StatefulWidget {
  const ServiceScreen({super.key});

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  late int i;
  
  @override
  void initState() {
    super.initState();
    i = 0;
  }
  List screen = [const Main(),const Profile()];
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage('assets/images/main.jpg'),
        ),
      ),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: screen[i],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: i,
            onTap: (value) {
              setState(() {
                i = value;
              });
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: kPrimarycolor,
                ),
                activeIcon: Icon(
                  Icons.home,
                  color: Colors.black,
                ),
                label: "",
              ),
              // BottomNavigationBarItem(
              //   icon: Icon(
              //     Icons.list_alt_rounded,
              //     color: kPrimarycolor,
              //   ),
              //   activeIcon: Icon(
              //     Icons.list_alt_rounded,
              //     color: Colors.black,
              //   ),
              //   label: '',
              // ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  color: kPrimarycolor,
                ),
                activeIcon: Icon(
                  Icons.person,
                  color: Colors.black,
                ),
                label: '',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
