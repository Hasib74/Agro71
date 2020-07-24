import 'package:agro71/DataProvider/SharePrefaranceProvider.dart';
import 'package:agro71/DataProvider/UserProvider.dart';
import 'package:agro71/GlobalWidgets/Dialogs/Dialogs.dart';
import 'package:agro71/main.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class LogInPage extends StatefulWidget {
  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  bool _showPassword = false;
  bool _isLoading = false;
  bool _emailValid = false;
  bool _passwordValid = false;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final RoundedLoadingButtonController _btnController =
      new RoundedLoadingButtonController();

  UserProvider userProvider = new UserProvider();

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColors.background_color_one,
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width / 1.3,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  margin: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: appColors.background_color_one,
                      boxShadow: [
                        BoxShadow(
                            color: Theme.of(context).hintColor.withOpacity(0.2),
                            offset: Offset(0, 10),
                            blurRadius: 20)
                      ]),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 25),
                      Image.asset(
                        commonTexts.app_logo,
                        height: 120,
                        width: 120,
                      ),
                      SizedBox(height: 20),
                      new TextField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(color: appColors.golobalColor_two),
                        onChanged: (value) {
                          if (value.toString().contains("@")) {
                            setState(() {
                              _emailValid = true;
                            });
                          } else {
                            setState(() {
                              _emailValid = false;
                            });
                          }
                        },
                        decoration: new InputDecoration(
                          errorText:
                              !_emailValid ? 'Not an email address' : null,
                          hintText: 'Email Address',
                          hintStyle:
                              TextStyle(color: appColors.golobalColor_one),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: appColors.golobalColor_one)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: appColors.golobalColor_one)),
                          prefixIcon: Icon(
                            Icons.person_outline,
                            color: appColors.golobalColor_one,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      new TextField(
                        controller: _passwordController,
                        style: TextStyle(color: appColors.golobalColor_one),
                        keyboardType: TextInputType.text,
                        obscureText: !_showPassword,
                        onChanged: (value) {
                          if (value.length >= 6) {
                            setState(() {
                              _passwordValid = true;
                            });
                          } else {
                            setState(() {
                              _passwordValid = false;
                            });
                          }
                        },
                        decoration: new InputDecoration(
                          errorText:
                              !_passwordValid ? 'At least 6 character' : null,
                          hintText: 'Password',
                          hintStyle: Theme.of(context).textTheme.body1.merge(
                                TextStyle(color: appColors.golobalColor_one),
                              ),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: appColors.golobalColor_one)),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: appColors.golobalColor_one)),
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            color: appColors.golobalColor_one,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _showPassword = !_showPassword;
                              });
                            },
                            color: appColors.golobalColor_one,
                            icon: Icon(_showPassword
                                ? Icons.visibility_off
                                : Icons.visibility),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      RoundedLoadingButton(
                        elevation: 6,
                        color: appColors.golobalColor_two,
                        child: Text('${language.logIn}',
                            style: appTextStyle.button_text_style),
                        controller: _btnController,
                        onPressed: () {
                          setState(() {
                            if (_emailValid == true && _passwordValid == true) {
                              if (_emailController.value.text != null &&
                                  _passwordController.value.text != null) {
                                _isLoading = true;
                                _btnController.start();

                                print(
                                    "Email ${_emailController.value.text} , Password  ${_passwordController.value.text}");

                                _login(_emailController.value.text,
                                    _passwordController.value.text, context);
                              }
                            } else {
                              _btnController.reset();
                            }
                          });
                        },
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login(email, password, BuildContext context) {
    SharePrefaranceDataProvider sp_provider = new SharePrefaranceDataProvider();

    userProvider.logIn(email, password).then((value) {
      print("Value == ${value}");

      if (value.status) {
        sp_provider.storeAdmin(context, value.adminType, value.token);

        sp_provider.readAdmin().then((value) {
          globalData.adminType = value[0];
          globalData.token = value[1];

          print("User  ${globalData.adminType}   token ${globalData.token}");
          Navigator.pushReplacementNamed(context, routeNames.home_page);
        });
      } else if (!value.status) {

        _btnController.reset();
        global_dilogs.awsomDialog("${language.invalid_user}", context,
            "${language.error}", MyDialogType.ERROR);
      } else {
        _btnController.reset();

        global_dilogs.awsomDialog("${language.someting_wrong}", context,
            "${language.error}", MyDialogType.ERROR);
      }
    });
  }
}
