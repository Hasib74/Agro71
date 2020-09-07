import 'package:agro71/DataProvider/TabProvider.dart';
import 'package:agro71/GlobalWidgets/HomeScreen.dart';
import 'package:agro71/Screen/SuperAdmin/admin_page.dart';
import 'package:agro71/Screen/SuperAdmin/drawer.dart';
import 'package:agro71/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SuperAdminHomePage extends StatefulWidget {
  @override
  _SuperAdminHomePageState createState() => _SuperAdminHomePageState();
}

class _SuperAdminHomePageState extends State<SuperAdminHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Row(
          children: <Widget>[
            Expanded(flex: 1, child: MyDesktopDrawer()),
            Expanded(
                flex: 9,
                child: HomeScreen(
                  child: Consumer<TabProvider>(
                    builder: (context, tabProvider, child) {
                      print("Tabs   ${tabProvider.tab}");

                      return currentPage(tabProvider.tab);
                    },
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Widget currentPage(String tab) {
    if (tab == language.all_admins) {
      return AdminPage();
    } else {
      return Center(
        child: Text(tab),
      );
    }
  }
}
