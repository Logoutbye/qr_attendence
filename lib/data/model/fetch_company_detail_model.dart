// To parse this JSON data, do
//
//     final fetchCompanyDetail = fetchCompanyDetailFromJson(jsonString);

import 'dart:convert';

FetchCompanyDetail fetchCompanyDetailFromJson(String str) => FetchCompanyDetail.fromJson(json.decode(str));

String fetchCompanyDetailToJson(FetchCompanyDetail data) => json.encode(data.toJson());

class FetchCompanyDetail {
    bool success;
    int status;
    Data data;

    FetchCompanyDetail({
        required this.success,
        required this.status,
        required this.data,
    });

    factory FetchCompanyDetail.fromJson(Map<String, dynamic> json) => FetchCompanyDetail(
        success: json["success"],
        status: json["status"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "status": status,
        "data": data.toJson(),
    };
}

class Data {
    String id;
    String companyName;
    String email;
    String password;
    List<Employee> employees;
    List<Event> events;
    int v;
    String companyCode;

    Data({
        required this.id,
        required this.companyName,
        required this.email,
        required this.password,
        required this.employees,
        required this.events,
        required this.v,
        required this.companyCode,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["_id"],
        companyName: json["companyName"],
        email: json["email"],
        password: json["password"],
        employees: List<Employee>.from(json["employees"].map((x) => Employee.fromJson(x))),
        events: List<Event>.from(json["events"].map((x) => Event.fromJson(x))),
        v: json["__v"],
        companyCode: json["companyCode"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "companyName": companyName,
        "email": email,
        "password": password,
        "employees": List<dynamic>.from(employees.map((x) => x.toJson())),
        "events": List<dynamic>.from(events.map((x) => x.toJson())),
        "__v": v,
        "companyCode": companyCode,
    };
}

class Employee {
    String id;
    String username;
    String email;
    String company;
    int v;

    Employee({
        required this.id,
        required this.username,
        required this.email,
        required this.company,
        required this.v,
    });

    factory Employee.fromJson(Map<String, dynamic> json) => Employee(
        id: json["_id"],
        username: json["username"],
        email: json["email"],
        company: json["company"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "username": username,
        "email": email,
        "company": company,
        "__v": v,
    };
}

class Event {
    String id;

    Event({
        required this.id,
    });

    factory Event.fromJson(Map<String, dynamic> json) => Event(
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
    };
}
