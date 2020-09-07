import 'package:agro71/AppHelper/Dimension.dart';
import 'package:agro71/AppHelper/GlobalData.dart';
import 'package:flutter/cupertino.dart';

class AppPadding {
  static var speach_height_5 = SizedBox(
    height: 5,
  );

  static var speach_height_10 = SizedBox(
    height: 10,
  );

  static var speach_height_15 = SizedBox(
    height: 15,
  );

  static var speach_height_20 = SizedBox(
    height: 20,
  );

  static var speach_height_25 = SizedBox(
    height: 25,
  );

  static var speach_width_5 = SizedBox(
    width: 5,
  );
  static var speach_width_10 = SizedBox(
    width: 10,
  );
  static var speach_width_15 = SizedBox(
    width: 15,
  );
  static var speach_width_20 = SizedBox(
    width: 20,
  );
  static var speach_width_25 = SizedBox(
    width: 25,
  );

  static double globalPadding = 20;

  static double editTextPadding = 20;

  //MediaQuery.of(context).size.width / 2.5

  static var button_left_and_right_padding = Dimension.globalWidth / 2.5;
}
