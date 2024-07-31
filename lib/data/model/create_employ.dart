// To parse this JSON data, do
//
//     final createEmployModel = createEmployModelFromJson(jsonString);

import 'dart:convert';

CreateEmployModel createEmployModelFromJson(String str) => CreateEmployModel.fromJson(json.decode(str));

String createEmployModelToJson(CreateEmployModel data) => json.encode(data.toJson());

class CreateEmployModel {
    bool? success;
    int? status;
    String? msg;

    CreateEmployModel({
        this.success,
        this.status,
        this.msg,
    });

    factory CreateEmployModel.fromJson(Map<String, dynamic> json) => CreateEmployModel(
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
