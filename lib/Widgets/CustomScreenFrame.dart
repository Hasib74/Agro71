import 'package:agro71/AppHelper/AppPadding.dart';
import 'package:agro71/AppHelper/AppTextStyle.dart';
import 'package:agro71/AppHelper/GlobalData.dart';
import 'package:agro71/GlobalWidgets/CustomTextFiled.dart';
import 'package:agro71/Routes/RouteArg.dart';
import 'package:agro71/Widgets/ButtonWidget.dart';
import 'package:agro71/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_icons/flutter_icons.dart';

class CustomScreenFrame extends StatefulWidget {
  List<Widget> children;

  CustomScreenFrame({@required this.children});

  @override
  _CustomScreenFrameState createState() => _CustomScreenFrameState();
}

class _CustomScreenFrameState extends State<CustomScreenFrame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.6),
      body: Center(
        child: Column(
          children: <Widget>[
            AppPadding.speach_height_25,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  "${language.new_admin}",
                  style: AppTextStyle.text,
                ),
                InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: Icon(
                    Icons.clear,
                    size: 25,
                  ),
                ),
              ],
            ),
            AppPadding.speach_height_25,
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: widget.children,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
