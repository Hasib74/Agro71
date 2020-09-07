import 'package:agro71/AppHelper/GlobalData.dart';
import 'package:agro71/Widgets/CustomScreenFrame.dart';
import 'package:agro71/GlobalWidgets/HomeScreen.dart';
import 'package:agro71/Routes/RouteArg.dart';
import 'package:agro71/Routes/route_name.dart';
import 'package:agro71/Screen/Admin/AdminHomePage.dart';
import 'package:agro71/Screen/LogInPage.dart';
import 'package:agro71/Screen/SuperAdmin/AddAdmin.dart';
import 'package:agro71/Screen/SuperAdmin/super_admin_home_page.dart';
import 'package:agro71/Screen/splash_screen.dart';
import 'package:agro71/main.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    RouteNames routeNames = new RouteNames();

    RouteArg args = settings.arguments;

    print("Route name  is   ${settings.name}");
    print("Route is   ${settings.arguments}");

    if (settings.name == routeNames.initial_page) {
      return MaterialPageRoute(
          settings: settings, builder: (_) => SplashScreen());
    } else if (settings.name == routeNames.logInPage) {
      return MaterialPageRoute(settings: settings, builder: (_) => LogInPage());
    } else if (settings.name == routeNames.home_page) {
      print("Admin Type  ${GlobalData.adminType}");

      if (GlobalData.adminType == GlobalData.admin) {
        return MaterialPageRoute(
            settings: settings, builder: (_) => AdminHomePage());
      } else if (GlobalData.adminType == GlobalData.super_admin) {
        return MaterialPageRoute(
            settings: settings, builder: (_) => SuperAdminHomePage());
      }
    } else if (settings.name == routeNames.add_page) {
     // print("The aregument is ${args.arg_list[0]}");

      return PageTransition(
          duration: Duration(milliseconds: 300),
          settings: settings,
          type: PageTransitionType.downToUp,
          child: AddAdmin());
    }
  }
}
