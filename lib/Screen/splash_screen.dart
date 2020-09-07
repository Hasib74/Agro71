import 'dart:async';
import 'dart:io';

import 'package:agro71/AppHelper/AppColors.dart';
import 'package:agro71/AppHelper/CommonTexts.dart';
import 'package:agro71/AppHelper/Dimension.dart';
import 'package:agro71/AppHelper/GlobalData.dart';
import 'package:agro71/DataProvider/SharePrefaranceProvider.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../main.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int loading_value = 0;
  var loading_data = false;

  SharePrefaranceDataProvider sp_provider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    sp_provider = new SharePrefaranceDataProvider();

    wait_for_some_time(context);
  }

  @override
  Widget build(BuildContext context) {
    getGlobalHeightAndWidth();
    getAdmin();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              CommonTexts.app_logo,
              height: 120,
              width: 120,
            ),
            LinearPercentIndicator(
              alignment: MainAxisAlignment.center,
              width: MediaQuery.of(context).size.width / 2,
              lineHeight: 8,
              percent: loading_value / 100,
              linearGradient: LinearGradient(colors: [
                AppColors.golobalColor_one,
                AppColors.golobalColor_two
              ]),
            ),
          ],
        ),
      ),
    );
  }

  void wait_for_some_time(BuildContext context) async {
    for (int i = 0; i <= 100; i++) {
      await new Future.delayed(const Duration(microseconds: 1));

      print("Loading Value ${i}");
      setState(() {
        loading_value = i;
      });
    }

    print("The admin type  ${GlobalData.adminType}");

    if (loading_value == 100 && loading_data == true) {
      if (GlobalData.adminType != null) {
        Navigator.pushReplacementNamed(context, routeNames.home_page);
      } else {
        Navigator.pushNamed(context, routeNames.logInPage);
      }
    }
  }

  Future sleep1() {
    return new Future.delayed(const Duration(seconds: 1), () => "1");
  }

  getAdmin() {
    sp_provider.readAdmin().then((value) {
      setState(() {
        loading_data = true;
      });
      GlobalData.adminType = value[0];
      GlobalData.token = value[1];
    });
  }

  void getGlobalHeightAndWidth() {
    Dimension.globalWidth = MediaQuery.of(context).size.width;
    Dimension.globalHeight = MediaQuery.of(context).size.height;
  }
}
