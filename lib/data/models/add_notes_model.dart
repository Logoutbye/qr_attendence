// To parse this JSON data, do
//
//     final addnotesforteacher = addnotesforteacherFromJson(jsonString);

import 'dart:convert';

Addnotesforteacher addnotesforteacherFromJson(String str) => Addnotesforteacher.fromJson(json.decode(str));

String addnotesforteacherToJson(Addnotesforteacher data) => json.encode(data.toJson());

class Addnotesforteacher {
    bool? success;
    Note? note;

    Addnotesforteacher({
        this.success,
        this.note,
    });

    factory Addnotesforteacher.fromJson(Map<String, dynamic> json) => Addnotesforteacher(
        success: json["success"],
        note: json["note"] == null ? null : Note.fromJson(json["note"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "note": note?.toJson(),
    };
}

class Note {
    String? chapter;
    String? title;
    String? description;
    String? file;
    String? id;
    int? v;

    Note({
        this.chapter,
        this.title,
        this.description,
        this.file,
        this.id,
        this.v,
    });

    factory Note.fromJson(Map<String, dynamic> json) => Note(
        chapter: json["chapter"],
        title: json["title"],
        description: json["description"],
        file: json["file"],
        id: json["_id"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "chapter": chapter,
        "title": title,
        "description": description,
        "file": file,
        "_id": id,
        "__v": v,
    };
}
