import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:image_picker/image_picker.dart';

typedef ImageCallBack = Function(dynamic);

class ImagePickWidget extends StatefulWidget {
  ImageCallBack imageCallBack;

  ImagePickWidget({this.imageCallBack});

  @override
  _ImagePickWidgetState createState() => _ImagePickWidgetState();
}

class _ImagePickWidgetState extends State<ImagePickWidget> {
  dynamic _image;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    widget.imageCallBack(_image);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 55,
        height: 55,
        child: InkWell(
            borderRadius: BorderRadius.circular(300),
            onTap: () {
              cameraImage();
            },
            child: Center(
              child:
                  _image == null ? Icon(FontAwesome.user) : FileImage(_image),
            )));
  }

  Future cameraImage() async {
    var image = await ImagePicker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 240.0,
      maxWidth: 240.0,
    );

    setState(() {
      _image = image;
    });

    widget.imageCallBack(_image);

    // provider.submitForm(image);
  }
}
