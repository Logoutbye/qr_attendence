// To parse this JSON data, do
//
//     final companysigninModel = companysigninModelFromJson(jsonString);

import 'dart:convert';

CompanysigninModel companysigninModelFromJson(String str) => CompanysigninModel.fromJson(json.decode(str));

String companysigninModelToJson(CompanysigninModel data) => json.encode(data.toJson());

class CompanysigninModel {
    bool? success;
    int? status;
    String? msg;
    String? token;

    CompanysigninModel({
        this.success,
        this.status,
        this.msg,
        this.token,
    });

    factory CompanysigninModel.fromJson(Map<String, dynamic> json) => CompanysigninModel(
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
