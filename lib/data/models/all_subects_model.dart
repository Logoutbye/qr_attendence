// To parse this JSON data, do
//
//     final allSubjects = allSubjectsFromJson(jsonString);

import 'dart:convert';

AllSubjects allSubjectsFromJson(String str) => AllSubjects.fromJson(json.decode(str));

String allSubjectsToJson(AllSubjects data) => json.encode(data.toJson());

class AllSubjects {
    bool? success;
    List<Subject>? subjects;

    AllSubjects({
        this.success,
        this.subjects,
    });

    factory AllSubjects.fromJson(Map<String, dynamic> json) => AllSubjects(
        success: json["success"],
        subjects: json["subjects"] == null ? [] : List<Subject>.from(json["subjects"]!.map((x) => Subject.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "subjects": subjects == null ? [] : List<dynamic>.from(subjects!.map((x) => x.toJson())),
    };
}

class Subject {
    String? id;
    String? subjectName;
    String? grade;
    String? teacherId;
    List<dynamic>? students;
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
        students: json["students"] == null ? [] : List<dynamic>.from(json["students"]!.map((x) => x)),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "subjectName": subjectName,
        "grade": grade,
        "teacherId": teacherId,
        "students": students == null ? [] : List<dynamic>.from(students!.map((x) => x)),
        "__v": v,
    };
}
