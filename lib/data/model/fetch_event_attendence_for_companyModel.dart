// To parse this JSON data, do
//
//     final fetchEventAttenceForCompany = fetchEventAttenceForCompanyFromJson(jsonString);

import 'dart:convert';

FetchEventAttenceForCompany fetchEventAttenceForCompanyFromJson(String str) => FetchEventAttenceForCompany.fromJson(json.decode(str));

String fetchEventAttenceForCompanyToJson(FetchEventAttenceForCompany data) => json.encode(data.toJson());

class FetchEventAttenceForCompany {
    bool success;
    int status;
    List<AttendanceRecordForCOmpany> attendanceRecords;

    FetchEventAttenceForCompany({
        required this.success,
        required this.status,
        required this.attendanceRecords,
    });

    factory FetchEventAttenceForCompany.fromJson(Map<String, dynamic> json) => FetchEventAttenceForCompany(
        success: json["success"],
        status: json["status"],
        attendanceRecords: List<AttendanceRecordForCOmpany>.from(json["attendanceRecords"].map((x) => AttendanceRecordForCOmpany.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "status": status,
        "attendanceRecords": List<dynamic>.from(attendanceRecords.map((x) => x.toJson())),
    };
}

class AttendanceRecordForCOmpany {
    String id;
    Employee employee;
    String company;
    Event event;
    DateTime checkInTime;
    String status;
    int v;
    DateTime checkOutTime;

    AttendanceRecordForCOmpany({
        required this.id,
        required this.employee,
        required this.company,
        required this.event,
        required this.checkInTime,
        required this.status,
        required this.v,
        required this.checkOutTime,
    });

    factory AttendanceRecordForCOmpany.fromJson(Map<String, dynamic> json) => AttendanceRecordForCOmpany(
        id: json["_id"],
        employee: Employee.fromJson(json["employee"]),
        company: json["company"],
        event: Event.fromJson(json["event"]),
        checkInTime: DateTime.parse(json["checkInTime"]),
        status: json["status"],
        v: json["__v"],
        checkOutTime: DateTime.parse(json["checkOutTime"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "employee": employee.toJson(),
        "company": company,
        "event": event.toJson(),
        "checkInTime": checkInTime.toIso8601String(),
        "status": status,
        "__v": v,
        "checkOutTime": checkOutTime.toIso8601String(),
    };
}

class Employee {
    String id;
    String username;
    String email;
    String company;

    Employee({
        required this.id,
        required this.username,
        required this.email,
        required this.company,
    });

    factory Employee.fromJson(Map<String, dynamic> json) => Employee(
        id: json["_id"],
        username: json["username"],
        email: json["email"],
        company: json["company"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "username": username,
        "email": email,
        "company": company,
    };
}

class Event {
    String id;
    String eventName;
    String description;
    String eventVenue;
    DateTime date;
    String startTime;
    String endTime;
    String company;
    List<dynamic> attendees;
    int v;

    Event({
        required this.id,
        required this.eventName,
        required this.description,
        required this.eventVenue,
        required this.date,
        required this.startTime,
        required this.endTime,
        required this.company,
        required this.attendees,
        required this.v,
    });

    factory Event.fromJson(Map<String, dynamic> json) => Event(
        id: json["_id"],
        eventName: json["eventName"],
        description: json["description"],
        eventVenue: json["eventVenue"],
        date: DateTime.parse(json["date"]),
        startTime: json["startTime"],
        endTime: json["endTime"],
        company: json["company"],
        attendees: List<dynamic>.from(json["attendees"].map((x) => x)),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "eventName": eventName,
        "description": description,
        "eventVenue": eventVenue,
        "date": date.toIso8601String(),
        "startTime": startTime,
        "endTime": endTime,
        "company": company,
        "attendees": List<dynamic>.from(attendees.map((x) => x)),
        "__v": v,
    };




 
}
