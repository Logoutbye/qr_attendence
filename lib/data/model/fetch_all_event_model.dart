// To parse this JSON data, do
//
//     final fetchAllEventModel = fetchAllEventModelFromJson(jsonString);

import 'dart:convert';

FetchAllEventModel fetchAllEventModelFromJson(String str) => FetchAllEventModel.fromJson(json.decode(str));

String fetchAllEventModelToJson(FetchAllEventModel data) => json.encode(data.toJson());

class FetchAllEventModel {
    bool? success;
    int? status;
    List<Event>? events;

    FetchAllEventModel({
        this.success,
        this.status,
        this.events,
    });

    factory FetchAllEventModel.fromJson(Map<String, dynamic> json) => FetchAllEventModel(
        success: json["success"],
        status: json["status"],
        events: json["events"] == null ? [] : List<Event>.from(json["events"]!.map((x) => Event.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "status": status,
        "events": events == null ? [] : List<dynamic>.from(events!.map((x) => x.toJson())),
    };
}

class Event {
    String? id;
    String? title;
    String? description;
    String? company;
    int? v;
    String? eventName;
    String? eventVenue;
    DateTime? date;
    String? startTime;
    String? endTime;

    Event({
        this.id,
        this.title,
        this.description,
        this.company,
        this.v,
        this.eventName,
        this.eventVenue,
        this.date,
        this.startTime,
        this.endTime,
    });

    factory Event.fromJson(Map<String, dynamic> json) => Event(
        id: json["_id"],
        title: json["title"],
        description: json["description"],
        company: json["company"],
        v: json["__v"],
        eventName: json["eventName"],
        eventVenue: json["eventVenue"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        startTime: json["startTime"],
        endTime: json["endTime"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "description": description,
        "company": company,
        "__v": v,
        "eventName": eventName,
        "eventVenue": eventVenue,
        "date": date?.toIso8601String(),
        "startTime": startTime,
        "endTime": endTime,
    };
}
