import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';

enum MyDialogType { SUCCESS, ERROR }

class Dialogs {
  awsomDialog(content, context, title, MyDialogType dialogType) {
    print("Dialoggggggggggg  ${dialogType}");
    switch (dialogType) {
      case MyDialogType.SUCCESS:
        return AwesomeDialog(
            context: content,
            dialogType: DialogType.SUCCES,
            body: content,
            title: title)
          ..show();
        break;

      case MyDialogType.ERROR:
        print("Show Dilog");
        AwesomeDialog(
          padding: EdgeInsets.all(50),
          context: context,
          dialogType: DialogType.ERROR,
          animType: AnimType.BOTTOMSLIDE,
          title: '${title}',
          desc: '${content}',
        )..show();
        break;
    }
  }
}
