// To parse this JSON data, do
//
//     final companysignModel = companysignModelFromJson(jsonString);

import 'dart:convert';

CompanysignModel companysignModelFromJson(String str) => CompanysignModel.fromJson(json.decode(str));

String companysignModelToJson(CompanysignModel data) => json.encode(data.toJson());

class CompanysignModel {
    bool? success;
    int? status;
    String? msg;

    CompanysignModel({
        this.success,
        this.status,
        this.msg,
    });

    factory CompanysignModel.fromJson(Map<String, dynamic> json) => CompanysignModel(
        success: json["success"],
        status: json["status"],
        msg: json["msg"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "status": status,
        "msg": msg,
    };
}
