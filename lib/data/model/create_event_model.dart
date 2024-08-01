// To parse this JSON data, do
//
//     final createevent = createeventFromJson(jsonString);

import 'dart:convert';

Createevent createeventFromJson(String str) => Createevent.fromJson(json.decode(str));

String createeventToJson(Createevent data) => json.encode(data.toJson());

class Createevent {
    bool? success;
    String? msg;
    CreateeventEvent? event;
    UpdatedCompany? updatedCompany;

    Createevent({
        this.success,
        this.msg,
        this.event,
        this.updatedCompany,
    });

    factory Createevent.fromJson(Map<String, dynamic> json) => Createevent(
        success: json["success"],
        msg: json["msg"],
        event: json["event"] == null ? null : CreateeventEvent.fromJson(json["event"]),
        updatedCompany: json["updatedCompany"] == null ? null : UpdatedCompany.fromJson(json["updatedCompany"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "msg": msg,
        "event": event?.toJson(),
        "updatedCompany": updatedCompany?.toJson(),
    };
}

class CreateeventEvent {
    String? eventName;
    String? description;
    String? eventVenue;
    DateTime? date;
    DateTime? startTime;
    DateTime? endTime;
    String? company;
    String? id;
    int? v;

    CreateeventEvent({
        this.eventName,
        this.description,
        this.eventVenue,
        this.date,
        this.startTime,
        this.endTime,
        this.company,
        this.id,
        this.v,
    });

    factory CreateeventEvent.fromJson(Map<String, dynamic> json) => CreateeventEvent(
        eventName: json["eventName"],
        description: json["description"],
        eventVenue: json["eventVenue"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        startTime: json["startTime"] == null ? null : DateTime.parse(json["startTime"]),
        endTime: json["endTime"] == null ? null : DateTime.parse(json["endTime"]),
        company: json["company"],
        id: json["_id"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "eventName": eventName,
        "description": description,
        "eventVenue": eventVenue,
        "date": date?.toIso8601String(),
        "startTime": startTime?.toIso8601String(),
        "endTime": endTime?.toIso8601String(),
        "company": company,
        "_id": id,
        "__v": v,
    };
}

class UpdatedCompany {
    String? id;
    String? companyName;
    String? email;
    String? password;
    List<String>? employees;
    List<EventElement>? events;
    int? v;

    UpdatedCompany({
        this.id,
        this.companyName,
        this.email,
        this.password,
        this.employees,
        this.events,
        this.v,
    });

    factory UpdatedCompany.fromJson(Map<String, dynamic> json) => UpdatedCompany(
        id: json["_id"],
        companyName: json["companyName"],
        email: json["email"],
        password: json["password"],
        employees: json["employees"] == null ? [] : List<String>.from(json["employees"]!.map((x) => x)),
        events: json["events"] == null ? [] : List<EventElement>.from(json["events"]!.map((x) => EventElement.fromJson(x))),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "companyName": companyName,
        "email": email,
        "password": password,
        "employees": employees == null ? [] : List<dynamic>.from(employees!.map((x) => x)),
        "events": events == null ? [] : List<dynamic>.from(events!.map((x) => x.toJson())),
        "__v": v,
    };
}

class EventElement {
    String? id;

    EventElement({
        this.id,
    });

    factory EventElement.fromJson(Map<String, dynamic> json) => EventElement(
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
    };
}
