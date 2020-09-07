import 'package:agro71/AppHelper/AppPadding.dart';
import 'package:agro71/AppHelper/AppTextStyle.dart';
import 'package:agro71/DataProvider/TabProvider.dart';
import 'package:agro71/main.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyDesktopDrawer extends StatefulWidget {
  @override
  _MyDesktopDrawerState createState() => _MyDesktopDrawerState();
}

class _MyDesktopDrawerState extends State<MyDesktopDrawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AppPadding.speach_height_20,
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                language.agro_71,
                style: AppTextStyle.title,
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Consumer<TabProvider>(
                    builder: (context, tabProvider, child) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          AppPadding.speach_height_20,
                          InkWell(
                            onTap: () {
                              tabProvider.changeTab(language.dash_bord);
                            },
                            child: Text(
                              "${language.dash_bord}",
                              style: tabProvider.tab == language.dash_bord
                                  ? AppTextStyle.buttonPressStyle
                                  : AppTextStyle.buttonStyle,
                            ),
                          ),
                          AppPadding.speach_height_10,
                          InkWell(
                            onTap: () {
                              tabProvider.changeTab(language.all_admins);
                            },
                            child: Text(
                              "${language.all_admins}",
                              style: tabProvider.tab == language.all_admins
                                  ? AppTextStyle.buttonPressStyle
                                  : AppTextStyle.buttonStyle,
                            ),
                          ),
                          AppPadding.speach_height_10,
                          InkWell(
                            onTap: () {
                              tabProvider.changeTab(language.task);
                            },
                            child: Text(
                              "${language.task}",
                              style: tabProvider.tab == language.task
                                  ? AppTextStyle.buttonPressStyle
                                  : AppTextStyle.buttonStyle,
                            ),
                          ),
                          AppPadding.speach_height_10,
                          InkWell(
                            onTap: () {
                              tabProvider.changeTab(language.product);
                            },
                            child: Text(
                              "${language.product}",
                              style: tabProvider.tab == language.product
                                  ? AppTextStyle.buttonPressStyle
                                  : AppTextStyle.buttonStyle,
                            ),
                          ),
                          AppPadding.speach_height_10,
                          InkWell(
                            onTap: () {
                              tabProvider.changeTab(language.problem);
                            },
                            child: Text(
                              "${language.problem}",
                              style: tabProvider.tab == language.problem
                                  ? AppTextStyle.buttonPressStyle
                                  : AppTextStyle.buttonStyle,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  Text(
                    "${language.super_admin}",
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
