// To parse this JSON data, do
//
//     final listOfCreatedTeacher = listOfCreatedTeacherFromJson(jsonString);

import 'dart:convert';

ListOfCreatedTeacher listOfCreatedTeacherFromJson(String str) => ListOfCreatedTeacher.fromJson(json.decode(str));

String listOfCreatedTeacherToJson(ListOfCreatedTeacher data) => json.encode(data.toJson());

class ListOfCreatedTeacher {
    bool? success;
    List<Teacher>? teachers;

    ListOfCreatedTeacher({
        this.success,
        this.teachers,
    });

    factory ListOfCreatedTeacher.fromJson(Map<String, dynamic> json) => ListOfCreatedTeacher(
        success: json["success"],
        teachers: json["teachers"] == null ? [] : List<Teacher>.from(json["teachers"]!.map((x) => Teacher.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "teachers": teachers == null ? [] : List<dynamic>.from(teachers!.map((x) => x.toJson())),
    };
}

class Teacher {
    String? id;
    String? email;
    String? password;
    String? role;
    String? name;
    int? phone;
    List<String>? subjects;
    String? gender;
    String? profilePic;
    int? v;

    Teacher({
        this.id,
        this.email,
        this.password,
        this.role,
        this.name,
        this.phone,
        this.subjects,
        this.gender,
        this.profilePic,
        this.v,
    });

    factory Teacher.fromJson(Map<String, dynamic> json) => Teacher(
        id: json["_id"],
        email: json["email"],
        password: json["password"],
        role: json["role"],
        name: json["name"],
        phone: json["phone"],
        subjects: json["subjects"] == null ? [] : List<String>.from(json["subjects"]!.map((x) => x)),
        gender: json["gender"],
        profilePic: json["profilePic"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "email": email,
        "password": password,
        "role": role,
        "name": name,
        "phone": phone,
        "subjects": subjects == null ? [] : List<dynamic>.from(subjects!.map((x) => x)),
        "gender": gender,
        "profilePic": profilePic,
        "__v": v,
    };
}
