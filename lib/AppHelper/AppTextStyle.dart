import 'package:agro71/AppHelper/AppColors.dart';
import 'package:agro71/main.dart';
import 'package:flutter/cupertino.dart';

class AppTextStyle {
  static TextStyle button_text_style = TextStyle(
      color: AppColors.background_color_one, fontWeight: FontWeight.bold);

  static TextStyle title = TextStyle(
      fontSize: 20,
      color: AppColors.golobalColor_two,
      fontWeight: FontWeight.bold);

  static TextStyle text = TextStyle(
      fontSize: 25,
      color: AppColors.golobalColor_two,
      fontWeight: FontWeight.bold);

  static TextStyle buttonStyle = TextStyle(
      fontSize: 16, color: AppColors.button_color, fontWeight: FontWeight.bold);
  static TextStyle buttonPressStyle = TextStyle(
      fontSize: 16,
      color: AppColors.button_press_color,
      fontWeight: FontWeight.bold);

  static TextStyle textStyle1 = TextStyle(
      fontSize: 16, color: AppColors.textColor, fontWeight: FontWeight.w400);
  static TextStyle textStyle2 = TextStyle(
      fontSize: 16, color: AppColors.textColor, fontWeight: FontWeight.bold);
}
