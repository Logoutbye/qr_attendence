// To parse this JSON data, do
//
//     final loginForTeacher = loginForTeacherFromJson(jsonString);

import 'dart:convert';

LoginModel loginFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
    bool? success;
    String? message;
    String? token;

    LoginModel({
        this.success,
        this.message,
        this.token,
    });

    factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        success: json["success"],
        message: json["message"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "token": token,
    };
}