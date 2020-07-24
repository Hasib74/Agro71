import 'package:agro71/AppHelper/AppTextStyle.dart';
import 'package:agro71/AppHelper/GlobalData.dart';
import 'package:agro71/GlobalWidgets/Dialogs/Dialogs.dart';
import 'package:agro71/Language/Language.dart';
import 'package:agro71/Routes/route_name.dart';
import 'package:flutter/material.dart';

import 'AppHelper/AppColors.dart';
import 'AppHelper/CommonTexts.dart';
import 'Routes/route_genarator.dart';

void main() {
  runApp(MyApp());
}

CommonTexts commonTexts = new CommonTexts();
AppColors appColors = new AppColors();
RouteNames routeNames = new RouteNames();
Language language = new Language();
AppTextStyle appTextStyle = AppTextStyle();
Dialogs global_dilogs = new Dialogs();
GlobalData globalData =new GlobalData();

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: routeNames.initial_page,
    );
  }
}
