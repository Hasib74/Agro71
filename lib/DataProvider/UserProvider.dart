import 'dart:convert';

import 'package:agro71/Model/LogInResponse.dart';
import 'package:agro71/appUrlRepo.dart';
import 'package:http/http.dart' as http;

class UserProvider {
  Future<LogInResponse> logIn(email, password) async {
    LogInResponse logInResponse;

    print(" Provider  Email  ${email}   , Password  ${password}");

    Map<String, String> body = {"Email": email, "Password": password};
    Map<String, String> header = {
      "Accept": "application/json",
      "Content-Type": "application/json"
    };

    await http
        .post(APIUrl.logIn, body: json.encode(body), headers: header)
        .then((value) {
      print("Admin resoponse  ${value.body}");

      logInResponse = LogInResponse.fromJson(json.decode(value.body));
    }).catchError((err) {
      logInResponse = null;
    });

    return logInResponse;
  }
}
