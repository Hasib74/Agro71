import 'dart:convert';
import 'dart:typed_data';
import 'package:agro71/Model/Admin.dart';
import 'package:agro71/appUrlRepo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:universal_html/html.dart';
//So that this does not conflict with the Image widget

/*import 'package:http/http.dart' as http;
import 'package:http/http.dart';*/

class AdminProvider extends ChangeNotifier {
  Future<AdminList> getAllAdminInfo() async {
    AdminList adminList;

    print("Header  ${APIHeader.header}");
    await http.get(APIUrl.getAdmin, headers: APIHeader.header).then((value) {
      if (value.statusCode == 200) {
        adminList = AdminList.fromJson(json.decode(value.body));
      }
    }).catchError((err) => print(err));

    return adminList;
  }

/*  static add_new_admin(name, email, phone, nid, joingdate, File profile) async {
    print("Profile  ${profile}");
    print("OKKK");

    Map<String, String> body = {
      APIFiled.Name: name,
      APIFiled.Email: email,
      APIFiled.Phone: phone,
      APIFiled.Nid: nid,
      APIFiled.JoiningDate: joingdate,
      APIFiled.profile: profile.readAsBytesSync()
    };

    print("OKKK2");

    await http
        .post(
      APIUrl.add_admin,
      headers: APIHeader.header,
      body: json.encode(body),
    )
        .then((value) {
      print("Value  ${value.body}");
    }).catchError((err) {
      print("Error  ${err}");
    });
  }*/

  static add_new_admin(
      name, email, phone, nid, joingdate, Uint8List profile) async {
    print("Name ${name}");
    print("email ${email}");
    print("phone ${phone}");
    print("nid ${nid}");
    print("joingdate ${joingdate}");

    final request =
        new http.MultipartRequest("POST", Uri.parse(APIUrl.add_admin));

    MultipartFile multipartFile = MultipartFile.fromBytes(
      '${APIFiled.profile}',
      profile,
      filename: "Name",
    );

    request.headers.addAll(APIHeader.header);
    request.files.add(multipartFile);
    /* request.fields[APIFiled.Name] = name;
    request.fields[APIFiled.Email] = email;
    request.fields[APIFiled.Phone] = phone;
    request.fields[APIFiled.Nid] = nid;
    request.fields[APIFiled.JoiningDate] = joingdate;*/
    request.fields.addAll({
      APIFiled.Name: name.toString() ?? "",
      APIFiled.Email: email.toString() ?? "",
      APIFiled.Phone: phone.toString() ?? "",
      APIFiled.Nid: nid.toString() ?? "",
      APIFiled.JoiningDate: joingdate.toString() ?? "",
    });
    await http.Response.fromStream(await request.send()).catchError((err) {
      print("The error ${err}");
    }).then((value) {
      print("The success result ${value.body}");

      

    });
  }
}
