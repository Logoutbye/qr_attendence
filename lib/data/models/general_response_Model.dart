// To parse this JSON data, do
//
//     final verifyOtpModel = verifyOtpModelFromJson(jsonString);

import 'dart:convert';

GeneralResponseModel generalResponseModelFromJson(String str) => GeneralResponseModel.fromJson(json.decode(str));

String verifyOtpModelToJson(GeneralResponseModel data) => json.encode(data.toJson());

class GeneralResponseModel {
    var success;
    var message;
    // Error? error;

    GeneralResponseModel({
        this.success,
        this.message,
        // this.error,
    });

    factory GeneralResponseModel.fromJson(Map<String, dynamic> json) => GeneralResponseModel(
        success: json["success"],
        message: json["message"],
        // error: Error.fromJson(json["error"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        // "error": error!.toJson(),
    };
}
