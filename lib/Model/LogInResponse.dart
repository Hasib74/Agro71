class LogInResponse {
  bool status;
  String message;
  String token;
  String adminType;

  LogInResponse({this.status, this.message, this.token, this.adminType});

  LogInResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    token = json['token'];
    adminType = json['adminType'];
  }


}