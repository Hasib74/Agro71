import 'dart:convert';
import 'dart:html';

import 'dart:typed_data';

import 'package:agro71/AppHelper/AppPadding.dart';
import 'package:agro71/DataProvider/AdminProvider.dart';
import 'package:agro71/Widgets/CustomScreenFrame.dart';
import 'package:agro71/GlobalWidgets/CustomTextFiled.dart';
import 'package:agro71/Widgets/ButtonWidget.dart';
import 'package:agro71/Widgets/DatePickerWidget.dart';
import 'package:agro71/Widgets/ImagePickWidget.dart';
import 'package:agro71/Widgets/ImagePickerWebWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:image/image.dart' as I;

import '../../main.dart';

class AddAdmin extends StatefulWidget {
  @override
  _AddAdminState createState() => _AddAdminState();
}

class _AddAdminState extends State<AddAdmin> {
  var name_controller = TextEditingController();
  var email_controller = TextEditingController();
  var phone_controller = TextEditingController();
  var nid_controller = TextEditingController();

  /* var joining_date_controller = TextEditingController();*/
  var address_controller = TextEditingController();
  var roundedLoadingButtonController = new RoundedLoadingButtonController();
  var joiningdate;
  var image;

/*  Future<File> _createFileFromString(encodedStr) async {
    // final encodedStr = "put base64 encoded string here";
    Uint8List bytes = base64.decode(encodedStr);
    String dir = (await getApplicationDocumentsDirectory()).path;
    File file = File(
        "$dir/" + DateTime.now().millisecondsSinceEpoch.toString() + ".jpg");
    //  await file.writeAsBytes(bytes);
    return file;
  }*/
  @override
  Widget build(BuildContext context) {
    return CustomScreenFrame(
      children: <Widget>[
        ImagePickerLabPage(
          onImagePickerClick: (image) {
            setState(() {
              this.image = image;
            });
          },
        ),
        CustomInputField(
          label: "${language.name}",
          prefixIcon: FontAwesome.user,
          textEditingController: name_controller,
        ),
        CustomInputField(
          label: "${language.email}",
          prefixIcon: FontAwesome.envelope,
          textEditingController: email_controller,
        ),
        CustomInputField(
          label: "${language.phone}",
          prefixIcon: FontAwesome.phone,
          textEditingController: phone_controller,
        ),
        CustomInputField(
          label: "${language.nid}",
          prefixIcon: FontAwesome.id_card,
          textEditingController: nid_controller,
        ),
        DatePickerWidget(
          text: language.joining_date,
          prefixIcon: FontAwesome.calendar,
          onCallBackDate: (date) {
            setState(() {
              joiningdate = date;
            });
          },
        ),
        CustomInputField(
          label: "${language.address}",
          prefixIcon: FontAwesome.address_card,
          textEditingController: address_controller,
        ),
        AppPadding.speach_height_25,
        Padding(
          padding: EdgeInsets.only(
              left: AppPadding.button_left_and_right_padding,
              right: AppPadding.button_left_and_right_padding),
          child: ButtonWidget(
            roundedLoadingButtonController: roundedLoadingButtonController,
            text: language.save,
            onClick: () {
              print("Clicked");
              //roundedLoadingButtonController.start();
              print("Image ${image.runtimeType}");
              print("Image 1 ${image}");

              AdminProvider.add_new_admin(
                  name_controller.value.text,
                  email_controller.value.text,
                  phone_controller.value.text,
                  nid_controller.value.text,
                  joiningdate.toString(),
                  image);
            },
          ),
        )
      ],
    );
  }
}
