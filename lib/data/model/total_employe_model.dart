// To parse this JSON data, do
//
//     final totalEmploye = totalEmployeFromJson(jsonString);

import 'dart:convert';

TotalEmploye totalEmployeFromJson(String str) => TotalEmploye.fromJson(json.decode(str));

String totalEmployeToJson(TotalEmploye data) => json.encode(data.toJson());

class TotalEmploye {
    int? status;
    List<Employee>? employees;

    TotalEmploye({
        this.status,
        this.employees,
    });

    factory TotalEmploye.fromJson(Map<String, dynamic> json) => TotalEmploye(
        status: json["status"],
        employees: json["employees"] == null ? [] : List<Employee>.from(json["employees"]!.map((x) => Employee.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "employees": employees == null ? [] : List<dynamic>.from(employees!.map((x) => x.toJson())),
    };
}

class Employee {
    String? id;
    String? username;
    String? email;
    String? password;
    String? company;
    int? v;

    Employee({
        this.id,
        this.username,
        this.email,
        this.password,
        this.company,
        this.v,
    });

    factory Employee.fromJson(Map<String, dynamic> json) => Employee(
        id: json["_id"],
        username: json["username"],
        email: json["email"],
        password: json["password"],
        company: json["company"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "username": username,
        "email": email,
        "password": password,
        "company": company,
        "__v": v,
    };
}
