// To parse this JSON data, do
//
//     final chapternotesforteacher = chapternotesforteacherFromJson(jsonString);

import 'dart:convert';

ListOfChapterNotesModels chapternotesforteacherFromJson(String str) => ListOfChapterNotesModels.fromJson(json.decode(str));

String chapternotesforteacherToJson(ListOfChapterNotesModels data) => json.encode(data.toJson());

class ListOfChapterNotesModels {
    bool? success;
    List<Note>? notes;

    ListOfChapterNotesModels({
        this.success,
        this.notes,
    });

    factory ListOfChapterNotesModels.fromJson(Map<String, dynamic> json) => ListOfChapterNotesModels(
        success: json["success"],
        notes: json["notes"] == null ? [] : List<Note>.from(json["notes"]!.map((x) => Note.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "notes": notes == null ? [] : List<dynamic>.from(notes!.map((x) => x.toJson())),
    };
}

class Note {
    String? id;
    String? chapter;
    String? title;
    String? description;
    String? file;
    int? v;

    Note({
        this.id,
        this.chapter,
        this.title,
        this.description,
        this.file,
        this.v,
    });

    factory Note.fromJson(Map<String, dynamic> json) => Note(
        id: json["_id"],
        chapter: json["chapter"],
        title: json["title"],
        description: json["description"],
        file: json["file"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "chapter": chapter,
        "title": title,
        "description": description,
        "file": file,
        "__v": v,
    };
}
