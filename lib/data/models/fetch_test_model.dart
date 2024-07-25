// To parse this JSON data, do
//
//     final fetchChapterTestModel = fetchChapterTestModelFromJson(jsonString);

import 'dart:convert';

FetchChapterTestModel fetchChapterTestModelFromJson(String str) => FetchChapterTestModel.fromJson(json.decode(str));

String fetchChapterTestModelToJson(FetchChapterTestModel data) => json.encode(data.toJson());

class FetchChapterTestModel {
    bool? success;
    List<Test>? tests;

    FetchChapterTestModel({
        this.success,
        this.tests,
    });

    factory FetchChapterTestModel.fromJson(Map<String, dynamic> json) => FetchChapterTestModel(
        success: json["success"],
        tests: json["tests"] == null ? [] : List<Test>.from(json["tests"]!.map((x) => Test.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "tests": tests == null ? [] : List<dynamic>.from(tests!.map((x) => x.toJson())),
    };
}

class Test {
    String? id;
    String? subjectName;
    String? chapterId;
    String? testName;
    List<Question>? questions;
    bool? published;
    List<dynamic>? attempts;
    int? v;

    Test({
        this.id,
        this.subjectName,
        this.chapterId,
        this.testName,
        this.questions,
        this.published,
        this.attempts,
        this.v,
    });

    factory Test.fromJson(Map<String, dynamic> json) => Test(
        id: json["_id"],
        subjectName: json["subjectName"],
        chapterId: json["chapterId"],
        testName: json["testName"],
        questions: json["questions"] == null ? [] : List<Question>.from(json["questions"]!.map((x) => Question.fromJson(x))),
        published: json["published"],
        attempts: json["attempts"] == null ? [] : List<dynamic>.from(json["attempts"]!.map((x) => x)),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "subjectName": subjectName,
        "chapterId": chapterId,
        "testName": testName,
        "questions": questions == null ? [] : List<dynamic>.from(questions!.map((x) => x.toJson())),
        "published": published,
        "attempts": attempts == null ? [] : List<dynamic>.from(attempts!.map((x) => x)),
        "__v": v,
    };
}

class Question {
    String? question;
    List<String>? options;
    int? correctAnswer;
    String? id;

    Question({
        this.question,
        this.options,
        this.correctAnswer,
        this.id,
    });

    factory Question.fromJson(Map<String, dynamic> json) => Question(
        question: json["question"],
        options: json["options"] == null ? [] : List<String>.from(json["options"]!.map((x) => x)),
        correctAnswer: json["correctAnswer"],
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "question": question,
        "options": options == null ? [] : List<dynamic>.from(options!.map((x) => x)),
        "correctAnswer": correctAnswer,
        "_id": id,
    };
}
