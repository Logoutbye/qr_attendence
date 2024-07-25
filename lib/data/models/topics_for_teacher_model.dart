// To parse this JSON data, do
//
//     final topicsForTeacherModel = topicsForTeacherModelFromJson(jsonString);

import 'dart:convert';

TopicsModel topicsForTeacherModelFromJson(String str) => TopicsModel.fromJson(json.decode(str));

String topicsForTeacherModelToJson(TopicsModel data) => json.encode(data.toJson());

class TopicsModel {
    bool? success;
    List<Topic>? topics;

    TopicsModel({
        this.success,
        this.topics,
    });

    factory TopicsModel.fromJson(Map<String, dynamic> json) => TopicsModel(
        success: json["success"],
        topics: json["topics"] == null ? [] : List<Topic>.from(json["topics"]!.map((x) => Topic.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "topics": topics == null ? [] : List<dynamic>.from(topics!.map((x) => x.toJson())),
    };
}

class Topic {
    String? id;
    String? chapter;
    String? title;
    String? discription;
    String? video;
    List<String>? tests;
    int? v;

    Topic({
        this.id,
        this.chapter,
        this.title,
        this.discription,
        this.video,
        this.tests,
        this.v,
    });

    factory Topic.fromJson(Map<String, dynamic> json) => Topic(
        id: json["_id"],
        chapter: json["chapter"],
        title: json["title"],
        discription: json["discription"],
        video: json["video"],
        tests: json["tests"] == null ? [] : List<String>.from(json["tests"]!.map((x) => x)),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "chapter": chapter,
        "title": title,
        "discription": discription,
        "video": video,
        "tests": tests == null ? [] : List<dynamic>.from(tests!.map((x) => x)),
        "__v": v,
    };
}
