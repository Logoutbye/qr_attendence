// To parse this JSON data, do
//
//     final allLength = allLengthFromJson(jsonString);

import 'dart:convert';

AllLength allLengthFromJson(String str) => AllLength.fromJson(json.decode(str));

String allLengthToJson(AllLength data) => json.encode(data.toJson());

class AllLength {
    bool? success;
    int? status;
    Data? data;

    AllLength({
        this.success,
        this.status,
        this.data,
    });

    factory AllLength.fromJson(Map<String, dynamic> json) => AllLength(
        success: json["success"],
        status: json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "status": status,
        "data": data?.toJson(),
    };
}

class Data {
    int? event;
    int? employee;

    Data({
        this.event,
        this.employee,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        event: json["event"],
        employee: json["employee"],
    );

    Map<String, dynamic> toJson() => {
        "event": event,
        "employee": employee,
    };
}
