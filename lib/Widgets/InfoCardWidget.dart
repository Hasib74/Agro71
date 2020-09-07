import 'package:agro71/AppHelper/AppTextStyle.dart';
import 'package:agro71/main.dart';
import 'package:flutter/material.dart';

class InfocardWidget extends StatelessWidget {
  double height;

  double width;

  String title;

  String text;

  InfocardWidget({this.text, this.title, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "${title}",
              style: AppTextStyle.title,
            ),
            Text(
              "${text}",
              style: AppTextStyle.text,
            ),
          ],
        ),
      ),
    );
  }
}
