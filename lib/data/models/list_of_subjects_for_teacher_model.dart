// To parse this JSON data, do
//
//     final listOfMySubjectsForTeacherModel = listOfMySubjectsForTeacherModelFromJson(jsonString);

import 'dart:convert';

ListOfMySubjectsForTeacherModel listOfMySubjectsForTeacherModelFromJson(String str) => ListOfMySubjectsForTeacherModel.fromJson(json.decode(str));

String listOfMySubjectsForTeacherModelToJson(ListOfMySubjectsForTeacherModel data) => json.encode(data.toJson());

class ListOfMySubjectsForTeacherModel {
    List<Subject>? subjects;

    ListOfMySubjectsForTeacherModel({
        this.subjects,
    });

    factory ListOfMySubjectsForTeacherModel.fromJson(Map<String, dynamic> json) => ListOfMySubjectsForTeacherModel(
        subjects: json["subjects"] == null ? [] : List<Subject>.from(json["subjects"]!.map((x) => Subject.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "subjects": subjects == null ? [] : List<dynamic>.from(subjects!.map((x) => x.toJson())),
    };
}

class Subject {
    String? id;
    String? subjectName;
    String? grade;
    String? teacherId;
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
        teacherId: json["teacherId"],
        students: json["students"] == null ? [] : List<Student>.from(json["students"]!.map((x) => Student.fromJson(x))),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "subjectName": subjectName,
        "grade": grade,
        "teacherId": teacherId,
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
