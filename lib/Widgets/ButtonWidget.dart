import 'package:agro71/AppHelper/AppColors.dart';
import 'package:agro71/AppHelper/AppPadding.dart';
import 'package:agro71/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class ButtonWidget extends StatelessWidget {
  VoidCallback onClick;
  String text;

  double width;
  double height;
  RoundedLoadingButtonController roundedLoadingButtonController;

  ButtonWidget(
      {this.text,
      this.onClick,
      this.width = 100,
      this.height = 40,
      this.roundedLoadingButtonController});

  @override
  Widget build(BuildContext context) {
    return RoundedLoadingButton(
      color: AppColors.golobalColor_one,
      valueColor:AppColors.golobalColor_one ,
      controller: roundedLoadingButtonController ?? null,
      borderRadius: 4,
      height: height,
      width: width,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: AppColors.button_press_color,
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.6),
                blurRadius: 10,
              )
            ]),
        child: InkWell(
          onTap: onClick,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              AppPadding.speach_width_5,
              Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 1.0)),
                child: new Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
              AppPadding.speach_width_10,
              Text(
                text,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              AppPadding.speach_width_10
            ],
          ),
        ),
      ),
    );
  }
}
