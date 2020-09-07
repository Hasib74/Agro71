import 'package:agro71/AppHelper/AppColors.dart';
import 'package:agro71/main.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  Widget child;

  Color backgroundColor;
  bool leftPadding;

  HomeScreen({this.child, this.backgroundColor, this.leftPadding = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.only(top: 40),

      margin: EdgeInsets.only(top: 20, right: 20, left: leftPadding ? 20 : 0),
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.home_screen_color,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      child: child,
    );
  }
}
