// To parse this JSON data, do
//
//     final chaptersForSubjectTeacherModel = chaptersForSubjectTeacherModelFromJson(jsonString);

import 'dart:convert';

ChaptersForSubjectTeacherModel chaptersForSubjectTeacherModelFromJson(String str) => ChaptersForSubjectTeacherModel.fromJson(json.decode(str));

String chaptersForSubjectTeacherModelToJson(ChaptersForSubjectTeacherModel data) => json.encode(data.toJson());

class ChaptersForSubjectTeacherModel {
    bool? success;
    List<Chapter>? chapters;

    ChaptersForSubjectTeacherModel({
        this.success,
        this.chapters,
    });

    factory ChaptersForSubjectTeacherModel.fromJson(Map<String, dynamic> json) => ChaptersForSubjectTeacherModel(
        success: json["success"],
        chapters: json["chapters"] == null ? [] : List<Chapter>.from(json["chapters"]!.map((x) => Chapter.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "chapters": chapters == null ? [] : List<dynamic>.from(chapters!.map((x) => x.toJson())),
    };
}

class Chapter {
    String? id;
    String? chapterName;
    String? teacher;
    Subject? subject;
    String? status;
    List<String>? topics;
    List<String>? tests;
    int? v;

    Chapter({
        this.id,
        this.chapterName,
        this.teacher,
        this.subject,
        this.status,
        this.topics,
        this.tests,
        this.v,
    });

    factory Chapter.fromJson(Map<String, dynamic> json) => Chapter(
        id: json["_id"],
        chapterName: json["chapterName"],
        teacher: json["teacher"],
        subject: json["subject"] == null ? null : Subject.fromJson(json["subject"]),
        status: json["status"],
        topics: json["topics"] == null ? [] : List<String>.from(json["topics"]!.map((x) => x)),
        tests: json["tests"] == null ? [] : List<String>.from(json["tests"]!.map((x) => x)),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "chapterName": chapterName,
        "teacher": teacher,
        "subject": subject?.toJson(),
        "status": status,
        "topics": topics == null ? [] : List<dynamic>.from(topics!.map((x) => x)),
        "tests": tests == null ? [] : List<dynamic>.from(tests!.map((x) => x)),
        "__v": v,
    };
}

class Subject {
    String? id;
    String? subjectName;
    String? grade;

    Subject({
        this.id,
        this.subjectName,
        this.grade,
    });

    factory Subject.fromJson(Map<String, dynamic> json) => Subject(
        id: json["_id"],
        subjectName: json["subjectName"],
        grade: json["grade"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "subjectName": subjectName,
        "grade": grade,
    };
}
