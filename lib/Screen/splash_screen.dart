import 'dart:async';
import 'dart:io';

import 'package:agro71/AppHelper/AppColors.dart';
import 'package:agro71/AppHelper/CommonTexts.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../main.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int loading_value = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    wait_for_some_time();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              commonTexts.app_logo,
              height: 120,
              width: 120,
            ),
            LinearPercentIndicator(
              alignment: MainAxisAlignment.center,
              width: MediaQuery.of(context).size.width / 2,
              lineHeight: 8,
              percent: loading_value / 100,
              linearGradient: LinearGradient(colors: [
                appColors.golobalColor_one,
                appColors.golobalColor_two
              ]),
            ),
          ],
        ),
      ),
    );
  }

  void wait_for_some_time() async {
    for (int i = 0; i <= 100; i++) {
      await new Future.delayed(const Duration(microseconds: 1));

      print("Loading Value ${i}");
      setState(() {
        loading_value = i;
      });
    }

    if (loading_value == 100) {
      Navigator.pushNamed(context, routeNames.logInPage);
    }
  }

  Future sleep1() {
    return new Future.delayed(const Duration(seconds: 1), () => "1");
  }
}
