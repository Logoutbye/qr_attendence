// To parse this JSON data, do
//
//     final listOfMySubjectsForStudentModel = listOfMySubjectsForStudentModelFromJson(jsonString);

import 'dart:convert';

ListOfMySubjectsForStudentModel listOfMySubjectsForStudentModelFromJson(String str) => ListOfMySubjectsForStudentModel.fromJson(json.decode(str));

String listOfMySubjectsForStudentModelToJson(ListOfMySubjectsForStudentModel data) => json.encode(data.toJson());

class ListOfMySubjectsForStudentModel {
    List<Subject>? subjects;

    ListOfMySubjectsForStudentModel({
        this.subjects,
    });

    factory ListOfMySubjectsForStudentModel.fromJson(Map<String, dynamic> json) => ListOfMySubjectsForStudentModel(
        subjects: json["subjects"] == null ? [] : List<Subject>.from(json["subjects"]!.map((x) => Subject.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "subjects": subjects == null ? [] : List<dynamic>.from(subjects!.map((x) => x.toJson())),
    };
}

class Subject {
    String? name;
    String? id;

    Subject({
        this.name,
        this.id,
    });

    factory Subject.fromJson(Map<String, dynamic> json) => Subject(
        name: json["name"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
    };
}
