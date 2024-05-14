// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:aman/screen/login/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/api.dart';
import '../models/cus.dart';
import '../screen/service/service.dart';

class AppProvider extends ChangeNotifier {
  Api api = Api();
  bool login = false;
  late SnackBar snackBar;
  late Cus userdata;

  void checklogin(context) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();

    if (login == true) {
    } else {
      if (localStorage.getString('cuslogin') != null) {
        userdata = cusFromJson(localStorage.getString('cuslogin')!);
        login = true;
        snackbar(context, "مرحبا بك مجددا");
        print("user login id = ${userdata.cus.id}");
        print("user login name = ${userdata.cus.name}");
        notifyListeners();
      }
    }
  }

  userlogin(context, pass, phone) async {
    var data = {"password": pass, "phone": phone};

    final response = await api.postData(data, 'api-cus-login');

    if (response.statusCode == 200) {
      var datas = json.decode(response.body);
      print(response.body);

      if (datas["success"] == false) {
        snackbar(context, "حدث خطا ما");
        return;
      } else {
        var logindata = cusFromJson(response.body);
        userdata = logindata;
        print("user login data ${logindata.cus}");
        SharedPreferences localStorage = await SharedPreferences.getInstance();

        localStorage.setString('cuslogin', response.body);
        snackbar(context, "مرحبا بك ${userdata.cus.name}");
        login = true;
        notifyListeners();
        // for deleting the dependency from memory if the user tried to make an account before signing in
        Get.deleteAll();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ServiceScreen()),
        );
      }
    } else {
      print(response.body);
    }
  }

  logout(context) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.remove('cuslogin');
    login = false;
    snackbar(context, "تم تسجيل الخروج");
    notifyListeners();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Login()),
    );
  }

  void snackbar(context, String text) {
    snackBar = SnackBar(
      duration: const Duration(seconds: 2),
      content: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        textDirection: TextDirection.rtl,
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
