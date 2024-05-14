import 'package:aman/provider/app.dart';
import 'package:aman/screen/intro/intro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../service/service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        anim = true;
      });
    });
  }

  bool anim = false;

  @override
  Widget build(BuildContext context) {
    var app = Provider.of<AppProvider>(context);
    app.checklogin(context);
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fitHeight,
          image: AssetImage('assets/images/splash.jpg'),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: AnimatedContainer(
            duration: const Duration(seconds: 1),
            curve: Curves.easeIn,
            height: anim == false ? 10 : 900,
            child: anim == true
                ? Image.asset('assets/images/logo-trans.png')
                : const Text(''),
            onEnd: () {
              if (app.login) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const ServiceScreen();
                    },
                  ),
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const Intro();
                    },
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
