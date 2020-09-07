import 'package:agro71/AppHelper/AppColors.dart';
import 'package:agro71/AppHelper/AppPadding.dart';
import 'package:agro71/AppHelper/AppTextStyle.dart';
import 'package:agro71/AppHelper/GlobalData.dart';
import 'package:agro71/DataProvider/AdminProvider.dart';
import 'package:agro71/Widgets/CustomScreenFrame.dart';
import 'package:agro71/GlobalWidgets/HomeScreen.dart';
import 'package:agro71/Model/Admin.dart';
import 'package:agro71/Routes/RouteArg.dart';
import 'package:agro71/Screen/Admin/AdminHomePage.dart';
import 'package:agro71/Widgets/ButtonWidget.dart';
import 'package:agro71/Widgets/AdminWidgets.dart';
import 'package:agro71/Widgets/InfoCardWidget.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../../main.dart';

class AdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final adminProvider = Provider.of<AdminProvider>(context);

    return FutureBuilder(
        future: adminProvider.getAllAdminInfo(),
        builder: (context, AsyncSnapshot<AdminList> adminList) {
          if (adminList.hasData && !adminList.hasError) {
            if (adminList.data != null) {
              return Column(
                children: <Widget>[
                  Expanded(
                    child: new HomeScreen(
                      leftPadding: true,
                      backgroundColor: Colors.white,
                      child: Column(
                        children: <Widget>[
                          header(context),
                          indector(),
                          Expanded(
                            child: new Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: new ListView.builder(
                                itemCount: adminList.data.adminList.length,
                                itemBuilder: (context, int index) {
                                  return AdminWidgets(
                                    admin: adminList.data.adminList[index],
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }
          } else {
            return CircularProgressIndicator();
          }
        });
  }

  indector() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 15, bottom: 15),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: new Text(
              "Image",
              style: AppTextStyle.textStyle2,
            ),
          ),
          Spacer(),
          Expanded(
              child: new Text(
            "Name",
            style: AppTextStyle.textStyle2,
          )),
          Expanded(
              child: new Text(
            "Phone",
            style: AppTextStyle.textStyle2,
          )),
          Expanded(
              child: Text(
            "Address",
            style: AppTextStyle.textStyle2,
          )),
          Expanded(
              child: Text(
            "Type",
            style: AppTextStyle.textStyle2,
          )),
          Expanded(
              child: Text(
            "Nid",
            style: AppTextStyle.textStyle2,
          )),
        ],
      ),
    );
  }

  header(context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0, top: 15, bottom: 15),
      child: Row(
        children: <Widget>[
          Text(
            "${language.admin}",
            style: AppTextStyle.text,
          ),
          AppPadding.speach_width_25,
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Container(
              width: 150,
              child: new TextField(
                  decoration: new InputDecoration(
                border: new OutlineInputBorder(
                    borderSide: new BorderSide(color: AppColors.textColor)),
                focusedBorder: new OutlineInputBorder(
                    borderSide:
                        new BorderSide(color: AppColors.golobalColor_two)),

                hintText: 'Search..',

                contentPadding: EdgeInsets.only(top: 30, left: 20),

                //suffixStyle: const TextStyle(color: appColors.textColor)),
              )),
            ),
          ),
          Spacer(),
          ButtonWidget(
            width: 140,
            text: language.new_admin,
            onClick: () {
              RouteArg arg = new RouteArg(arg_list: [GlobalData.add_admin]);
              Navigator.pushNamed(context, routeNames.add_page, arguments: arg);
            },
          ),
          AppPadding.speach_width_25
        ],
      ),
    );
  }
}
