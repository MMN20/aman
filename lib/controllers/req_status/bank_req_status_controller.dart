import 'dart:convert';
import 'package:aman/api/api.dart';
import 'package:aman/api/api_links.dart';
import 'package:aman/models/bank_service.dart';
import 'package:aman/models/cus.dart';
import 'package:aman/models/law_claim.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

// for the Bank status page

class BankServiceController extends GetxController {
  bool isLoading = true;
  bool isFirstLoading = true;
  late BuildContext context;
  Api api = Api();
  int totalCount = 100;
  //! this change
  List<BankServiceStatus> bankStatus = [];
  String? nextUrl;

  ScrollController scrollController = ScrollController();

  Future<void> getClaims() async {
    late Cus userdata;
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    userdata = cusFromJson(localStorage.getString('cuslogin')!);

    //! this change
    String url;
    if (nextUrl == null) {
      url = "${ApiLinks.getBankServiceStatus}/${userdata.cus.id}";
    } else {
      url = nextUrl!;
    }

    if (bankStatus.length < totalCount) {
      try {
        isLoading = true;
        update();
        http.Response response = await api.newMethod(url);
        print(response.statusCode);
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map result = jsonDecode(response.body);
          //! this change
          bankStatus.addAll(List.generate(result['data'].length,
              (index) => BankServiceStatus.fromJson(result['data'][index])));
          totalCount = result['total'];
          nextUrl = result['next_page_url'];
        } else {
          showSnackBar("حدث خطأ في الاتصال");
        }
      } catch (e) {
        showSnackBar("حدث خطأ في الاتصال");
        print(e.toString());
      }
      isLoading = false;
      isFirstLoading = false;
      update();
    }
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
        ),
      ),
    );
  }

  void onReachesEnd() {
    if (totalCount == 0 || totalCount == bankStatus.length || isLoading) {
      return;
    }
    if (scrollController.position.maxScrollExtent ==
        scrollController.position.pixels) {
      getClaims();

      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        scrollController.position
            .moveTo(scrollController.position.maxScrollExtent);
      });
    }
  }

  void initData() {
    isFirstLoading = true;
    getClaims();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      scrollController.addListener(onReachesEnd);
    });
  }

  @override
  void onInit() {
    initData();
    super.onInit();
  }
}
