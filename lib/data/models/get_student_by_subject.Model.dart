// To parse this JSON data, do
//
//     final getstudentbysubject = getstudentbysubjectFromJson(jsonString);

import 'dart:convert';

Getstudentbysubject getstudentbysubjectFromJson(String str) => Getstudentbysubject.fromJson(json.decode(str));

String getstudentbysubjectToJson(Getstudentbysubject data) => json.encode(data.toJson());

class Getstudentbysubject {
    bool? success;
    Subject? subject;

    Getstudentbysubject({
        this.success,
        this.subject,
    });

    factory Getstudentbysubject.fromJson(Map<String, dynamic> json) => Getstudentbysubject(
        success: json["success"],
        subject: json["subject"] == null ? null : Subject.fromJson(json["subject"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "subject": subject?.toJson(),
    };
}

class Subject {
    String? id;
    String? subjectName;
    String? grade;
    TeacherId? teacherId;
    List<Student>? students;
    int? v;

    Subject({
        this.id,
        this.subjectName,
        this.grade,
        this.teacherId,
        this.students,
        this.v,
    });

    factory Subject.fromJson(Map<String, dynamic> json) => Subject(
        id: json["_id"],
        subjectName: json["subjectName"],
        grade: json["grade"],
        teacherId: json["teacherId"] == null ? null : TeacherId.fromJson(json["teacherId"]),
        students: json["students"] == null ? [] : List<Student>.from(json["students"]!.map((x) => Student.fromJson(x))),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "subjectName": subjectName,
        "grade": grade,
        "teacherId": teacherId?.toJson(),
        "students": students == null ? [] : List<dynamic>.from(students!.map((x) => x.toJson())),
        "__v": v,
    };
}

class Student {
    String? id;
    String? name;

    Student({
        this.id,
        this.name,
    });

    factory Student.fromJson(Map<String, dynamic> json) => Student(
        id: json["_id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
    };
}

class TeacherId {
    String? id;
    String? email;

    TeacherId({
        this.id,
        this.email,
    });

    factory TeacherId.fromJson(Map<String, dynamic> json) => TeacherId(
        id: json["_id"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "email": email,
    };
}
