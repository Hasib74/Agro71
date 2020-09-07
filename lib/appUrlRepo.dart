import 'AppHelper/GlobalData.dart';

String localhost = "http://localhost:3001/api/";

class APIUrl {
  static String basic_api = "${localhost}api/";
  static String logIn = "${localhost}admin/login";
  static String getAdmin = "${localhost}admin";
  static String image_base = "http://localhost/Agro71/WebApi/";
  static String add_admin = "${localhost}admin";
}

class APIFiled {
  static String profile = "profile";
  static String Name = "Name";
  static String Email = "Email";
  static String Phone = "Phone";
  static String Nid = "Nid";
  static String JoiningDate = "JoiningDate";
}

class APIHeader {
  static Map<String, String> header = {
    "Authorization": "Bearer ${GlobalData.token}",
    "Accept": "application/json",
    "Content-Type": "application/json"


};

  static Map<String, String> header1 = {
    "Authorization": "Bearer ${GlobalData.token}",
    "Accept": "application/json",
    'Content-type': 'multipart/form-data',


  };
}
//'Content-type': 'multipart/form-data',