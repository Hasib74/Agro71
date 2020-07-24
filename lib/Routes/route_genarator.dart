import 'package:agro71/Routes/route_name.dart';
import 'package:agro71/Screen/Admin/AdminHomePage.dart';
import 'package:agro71/Screen/LogInPage.dart';
import 'package:agro71/Screen/SuperAdmin/SuperAdminHomePage.dart';
import 'package:agro71/Screen/splash_screen.dart';
import 'package:agro71/main.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    RouteNames routeNames = new RouteNames();

    final args = settings.arguments;

    print("Route name  is   ${settings.name}");
    print("Route is   ${settings.arguments}");

    if (settings.name == routeNames.initial_page) {
      return MaterialPageRoute(builder: (_) => SplashScreen());
    } else if (settings.name == routeNames.logInPage) {
      return MaterialPageRoute(builder: (_) => LogInPage());
    } else if (settings.name == routeNames.home_page) {
      print("${globalData.adminType}");

      if (globalData.adminType == globalData.admin) {
        return MaterialPageRoute(builder: (_) => AdminHomePage());
      } else if (globalData.adminType == globalData.super_admin) {
        return MaterialPageRoute(builder: (_) => SuperAdminHomePage());
      }
    }
  }
}
