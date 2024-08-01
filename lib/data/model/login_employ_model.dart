// To parse this JSON data, do
//
//     final loginEmploy = loginEmployFromJson(jsonString);

import 'dart:convert';

LoginEmploy loginEmployFromJson(String str) => LoginEmploy.fromJson(json.decode(str));

String loginEmployToJson(LoginEmploy data) => json.encode(data.toJson());

class LoginEmploy {
    bool? success;
    int? status;
    String? msg;
    String? token;

    LoginEmploy({
        this.success,
        this.status,
        this.msg,
        this.token,
    });

    factory LoginEmploy.fromJson(Map<String, dynamic> json) => LoginEmploy(
        success: json["success"],
        status: json["status"],
        msg: json["msg"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "status": status,
        "msg": msg,
        "token": token,
    };
}
