import 'package:agro71/AppHelper/AppColors.dart';
import 'package:agro71/AppHelper/AppPadding.dart';
import 'package:agro71/AppHelper/AppTextStyle.dart';
import 'package:agro71/Model/Admin.dart';
import 'package:agro71/appUrlRepo.dart';
import 'package:agro71/main.dart';
import 'package:flutter/material.dart';

class AdminWidgets extends StatelessWidget {
  Admin admin;

  AdminWidgets({this.admin});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.background_color_one,
      ),
      child: Column(
        children: <Widget>[
          AppPadding.speach_height_5,
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(left: 20),
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: NetworkImage(
                            APIUrl.image_base + admin.picture,
                          ),
                          fit: BoxFit.cover))),
              Spacer(),
              Expanded(
                  child: new Text(
                admin.name,
                style: AppTextStyle.textStyle1,
              )),
              Expanded(
                  child: new Text(
                admin.phone,
                style: AppTextStyle.textStyle1,
              )),
              Expanded(
                  child: Text(
                admin.address,
                style: AppTextStyle.textStyle1,
              )),
              Expanded(
                  child: Text(
                admin.type,
                style: AppTextStyle.textStyle1,
              )),
              Expanded(
                  child: Text(
                admin.nid,
                style: AppTextStyle.textStyle1,
              )),
              AppPadding.speach_height_5,
            ],
          ),
          AppPadding.speach_height_5,
          Divider(
            height: 1,
            color: AppColors.dividerColor,
          ),
        ],
      ),
    );
  }
}
