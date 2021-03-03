import 'dart:convert';

//Created a function that passes JSON data
LoginResponseModel loginResponseFromJson(String str) =>
    LoginResponseModel.fromJson(json.decode(str));

//Created a class that maps the variables with the API
class LoginResponseModel {
  bool success;
  int statusCode;
  String message;
  Data data;

  LoginResponseModel({this.success, this.statusCode, this.message, this.data});

  //Mapping the JSON with the variables
  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['statusCode'];
    message = json['message'];
    data = json['data'].length > 0 ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['statusCode'] = this.statusCode;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

//Created a class for the data from API
class Data {
  int id;
  String studentNo;
  String fname;
  String lname;
  String email;
  String username;
  String password;

  Data({
    this.id,
    this.studentNo,
    this.fname,
    this.lname,
    this.email,
    this.username,
    this.password,
  });

  //Mapping the JSON with the variables
  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    studentNo = json['student_no'];
    fname = json['fname'];
    lname = json['lname'];
    email = json['email'];
    username = json['username'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['student_no'] = this.studentNo;
    data['fname'] = this.fname;
    data['lname'] = this.lname;
    data['email'] = this.email;
    data['username'] = this.username;
    data['password'] = this.password;
    return data;
  }
}
