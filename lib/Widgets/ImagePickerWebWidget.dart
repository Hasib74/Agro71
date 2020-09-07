import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:agro71/AppHelper/AppColors.dart';
import 'package:agro71/AppHelper/CommonTexts.dart';
import 'package:agro71/AppHelper/Dimension.dart';
import 'package:agro71/AppHelper/GlobalData.dart';
import 'package:cryptoutils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:universal_html/prefer_universal/html.dart' as html;
import 'dart:io' as Io;

typedef ImagePickOnClick = Function(dynamic);

class ImagePickerLabPage extends StatefulWidget {
  ImagePickOnClick onImagePickerClick;
  double imageSize;

  ImagePickerLabPage({this.onImagePickerClick(File), this.imageSize = 100});

  @override
  _ImagePickerLabPageState createState() => _ImagePickerLabPageState();
}

class _ImagePickerLabPageState extends State<ImagePickerLabPage> {
  String name = '';
  String error;
  Uint8List data;

  pickImage() {
    final html.InputElement input = html.document.createElement('input');
    input
      ..type = 'file'
      ..accept = 'image/*';

    input.onChange.listen((e) {
      if (input.files.isEmpty) return;
      final reader = html.FileReader();
      reader.readAsDataUrl(input.files[0]);
      reader.onError.listen((err) => setState(() {
            error = err.toString();
          }));

      /*  reader.onLoad.listen((event) {

      });*/
      reader.onLoad.first.then((res) {
        final encoded = reader.result as String;
        // remove data:image/*;base64 preambule
        final stripped =
            encoded.replaceFirst(RegExp(r'data:image/[^;]+;base64,'), '');

        setState(() {
          name = input.files[0].name;
          data = base64.decode(stripped);
          error = null;
        });

        widget.onImagePickerClick(data);
      });
    });

    input.click();
  }

  /*
  * / variable to hold image to be displayed

      Uint8List uploadedImage;

//method to load image and update `uploadedImage`


    _startFilePicker() async {
    InputElement uploadInput = FileUploadInputElement();
    uploadInput.click();

    uploadInput.onChange.listen((e) {
      // read file content as dataURL
      final files = uploadInput.files;
      if (files.length == 1) {
        final file = files[0];
        FileReader reader =  FileReader();

        reader.onLoadEnd.listen((e) {
                    setState(() {
                      uploadedImage = reader.result;
                    });
        });

        reader.onError.listen((fileEvent) {
          setState(() {
            option1Text = "Some Error occured while reading the file";
          });
        });

        reader.readAsArrayBuffer(file);
      }
    });
    }
  *
  *
  * */

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          pickImage();
        },
        child: data == null
            ? Container(
                width: widget.imageSize,
                height: widget.imageSize,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.editTextColor.withOpacity(0.3)),
                child: Icon(
                  FontAwesome.user,
                  size: widget.imageSize - 20,
                ))
            : new Container(
                height: widget.imageSize,
                width: widget.imageSize,
                decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: new MemoryImage(data, scale: 1 / 1),
                    )),

                //child: Container(),
                // child: new Image.memory(data,fit: BoxFit.cover,),),
              ));
  }
}
