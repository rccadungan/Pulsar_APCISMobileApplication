import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:pulsar/model/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedService {
  static Future<bool> isLoggedIn() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString("login_details") != null ? true : false;
  }

  static Future<LoginResponseModel> loginDetails() async {
    final preferences = await SharedPreferences.getInstance();

    return preferences.getString("login_details") != null
        ? LoginResponseModel.fromJson(
            jsonDecode(
              preferences.getString("login_details"),
            ),
          )
        : null;
  }

  static Future<void> setLoginDetails(LoginResponseModel responseModel) async {
    final preferences = await SharedPreferences.getInstance();
    preferences.setString(
        "login_details",
        responseModel != null
            ? jsonEncode(
                responseModel.toJson(),
              )
            : null);
  }

  static Future<void> logout(BuildContext context) async {
    await setLoginDetails(null);
    Navigator.of(context).pushReplacementNamed('/login');
  }
}
