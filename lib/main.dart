import 'package:agro71/AppHelper/AppPadding.dart';
import 'package:agro71/AppHelper/AppTextStyle.dart';
import 'package:agro71/AppHelper/GlobalData.dart';
import 'package:agro71/DataProvider/AdminProvider.dart';
import 'package:agro71/DataProvider/DataProvider.dart';
import 'package:agro71/DataProvider/TabProvider.dart';
import 'package:agro71/GlobalWidgets/Dialogs/Dialogs.dart';
import 'package:agro71/Language/Language.dart';
import 'package:agro71/Routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'AppHelper/AppColors.dart';
import 'AppHelper/CommonTexts.dart';
import 'Routes/route_genarator.dart';

void main() {
  runApp(MyApp());
}

RouteNames routeNames = new RouteNames();
Language language = new Language();
Dialogs global_dilogs = new Dialogs();
GlobalData globalData = new GlobalData();
AppPadding appPadding = new AppPadding();




class MyApp extends StatelessWidget {
  // This widget is the root of your application.




  @override
  Widget build(BuildContext context) {



    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => DataProvider()..initial(),
        ),
        ChangeNotifierProvider(
          create: (_) => TabProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => AdminProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Agro 71',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        onGenerateRoute: RouteGenerator.generateRoute,
        initialRoute: routeNames.initial_page,
      ),
    );
  }
}
