// // To parse this JSON data, do
// //
// //     final fetchallEmployeeEvents = fetchallEmployeeEventsFromJson(jsonString);

// import 'dart:convert';

// FetchallEmployeeEvents fetchallEmployeeEventsFromJson(String str) => FetchallEmployeeEvents.fromJson(json.decode(str));

// String fetchallEmployeeEventsToJson(FetchallEmployeeEvents data) => json.encode(data.toJson());

// class FetchallEmployeeEvents {
//     bool success;
//     int status;
//     Data data;

//     FetchallEmployeeEvents({
//         required this.success,
//         required this.status,
//         required this.data,
//     });

//     factory FetchallEmployeeEvents.fromJson(Map<String, dynamic> json) => FetchallEmployeeEvents(
//         success: json["success"],
//         status: json["status"],
//         data: Data.fromJson(json["data"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "success": success,
//         "status": status,
//         "data": data.toJson(),
//     };
// }

// class Data {
//     List<Current> current;
//     List<Current> previous;

//     Data({
//         required this.current,
//         required this.previous,
//     });

//     factory Data.fromJson(Map<String, dynamic> json) => Data(
//         current: List<Current>.from(json["current"].map((x) => Current.fromJson(x))),
//         previous: List<Current>.from(json["previous"].map((x) => Current.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "current": List<dynamic>.from(current.map((x) => x.toJson())),
//         "previous": List<dynamic>.from(previous.map((x) => x.toJson())),
//     };
// }

// class Current {
//     String id;
//     String eventName;
//     String description;
//     String eventVenue;
//     DateTime date;
//     String startTime;
//     String endTime;
//     CompanyForEmployee company;
//     List<String> attendees;
//     int v;

//     Current({
//         required this.id,
//         required this.eventName,
//         required this.description,
//         required this.eventVenue,
//         required this.date,
//         required this.startTime,
//         required this.endTime,
//         required this.company,
//         required this.attendees,
//         required this.v,
//     });

//     factory Current.fromJson(Map<String, dynamic> json) => Current(
//         id: json["_id"],
//         eventName: json["eventName"],
//         description: json["description"],
//         eventVenue: json["eventVenue"],
//         date: DateTime.parse(json["date"]),
//         startTime: json["startTime"],
//         endTime: json["endTime"],
//         company: CompanyForEmployee.fromJson(json["company"]),
//         attendees: List<String>.from(json["attendees"].map((x) => x)),
//         v: json["__v"],
//     );

//     Map<String, dynamic> toJson() => {
//         "_id": id,
//         "eventName": eventName,
//         "description": description,
//         "eventVenue": eventVenue,
//         "date": date.toIso8601String(),
//         "startTime": startTime,
//         "endTime": endTime,
//         "company": company.toJson(),
//         "attendees": List<dynamic>.from(attendees.map((x) => x)),
//         "__v": v,
//     };
// }

// class CompanyForEmployee {
//     String id;
//     String companyName;
//     String email;
//     String password;
//     List<String> employees;
//     List<Event> events;
//     int v;
//     String companyCode;

//     CompanyForEmployee({
//         required this.id,
//         required this.companyName,
//         required this.email,
//         required this.password,
//         required this.employees,
//         required this.events,
//         required this.v,
//         required this.companyCode,
//     });

//     factory CompanyForEmployee.fromJson(Map<String, dynamic> json) => CompanyForEmployee(
//         id: json["_id"],
//         companyName: json["companyName"],
//         email: json["email"],
//         password: json["password"],
//         employees: List<String>.from(json["employees"].map((x) => x)),
//         events: List<Event>.from(json["events"].map((x) => Event.fromJson(x))),
//         v: json["__v"],
//         companyCode: json["companyCode"],
//     );

//     Map<String, dynamic> toJson() => {
//         "_id": id,
//         "companyName": companyName,
//         "email": email,
//         "password": password,
//         "employees": List<dynamic>.from(employees.map((x) => x)),
//         "events": List<dynamic>.from(events.map((x) => x.toJson())),
//         "__v": v,
//         "companyCode": companyCode,
//     };
// }

// class Event {
//     String id;

//     Event({
//         required this.id,
//     });

//     factory Event.fromJson(Map<String, dynamic> json) => Event(
//         id: json["_id"],
//     );

//     Map<String, dynamic> toJson() => {
//         "_id": id,
//     };
// }




// To parse this JSON data, do
//
//     final fetchallEmployeeEvents = fetchallEmployeeEventsFromJson(jsonString);

import 'dart:convert';

FetchallEmployeeEvents fetchallEmployeeEventsFromJson(String str) => FetchallEmployeeEvents.fromJson(json.decode(str));

String fetchallEmployeeEventsToJson(FetchallEmployeeEvents data) => json.encode(data.toJson());

class FetchallEmployeeEvents {
    bool success;
    int status;
    Data data;

    FetchallEmployeeEvents({
        required this.success,
        required this.status,
        required this.data,
    });

    factory FetchallEmployeeEvents.fromJson(Map<String, dynamic> json) => FetchallEmployeeEvents(
        success: json["success"],
        status: json["status"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "status": status,
        "data": data.toJson(),
    };
}

class Data {
    List<Current> current;
    List<Current> previous;
    List<Attendance> attendances;

    Data({
        required this.current,
        required this.previous,
        required this.attendances,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        current: List<Current>.from(json["current"].map((x) => Current.fromJson(x))),
        previous: List<Current>.from(json["previous"].map((x) => Current.fromJson(x))),
        attendances: List<Attendance>.from(json["attendances"].map((x) => Attendance.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "current": List<dynamic>.from(current.map((x) => x.toJson())),
        "previous": List<dynamic>.from(previous.map((x) => x.toJson())),
        "attendances": List<dynamic>.from(attendances.map((x) => x.toJson())),
    };
}

class Attendance {
    String id;
    DateTime checkInTime;
    DateTime checkOutTime;
    String status;
    Current event;

    Attendance({
        required this.id,
        required this.checkInTime,
        required this.checkOutTime,
        required this.status,
        required this.event,
    });

    factory Attendance.fromJson(Map<String, dynamic> json) => Attendance(
        id: json["_id"],
        checkInTime: DateTime.parse(json["checkInTime"]),
        checkOutTime: DateTime.parse(json["checkOutTime"]),
        status: json["status"],
        event: Current.fromJson(json["event"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "checkInTime": checkInTime.toIso8601String(),
        "checkOutTime": checkOutTime.toIso8601String(),
        "status": status,
        "event": event.toJson(),
    };
}

class Current {
    String id;
    String eventName;
    String description;
    String eventVenue;
    DateTime date;
    String startTime;
    String endTime;
    CompanyForEmployee company;
    List<String> attendees;
    int v;

    Current({
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

    factory Current.fromJson(Map<String, dynamic> json) => Current(
        id: json["_id"],
        eventName: json["eventName"],
        description: json["description"],
        eventVenue: json["eventVenue"],
        date: DateTime.parse(json["date"]),
        startTime: json["startTime"],
        endTime: json["endTime"],
        company: CompanyForEmployee.fromJson(json["company"]),
        attendees: List<String>.from(json["attendees"].map((x) => x)),
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
        "company": company.toJson(),
        "attendees": List<dynamic>.from(attendees.map((x) => x)),
        "__v": v,
    };
}

class CompanyForEmployee {
    String id;
    String companyName;
    String email;
    String password;
    List<String> employees;
    List<Event> events;
    int v;
    String companyCode;

    CompanyForEmployee({
        required this.id,
        required this.companyName,
        required this.email,
        required this.password,
        required this.employees,
        required this.events,
        required this.v,
        required this.companyCode,
    });

    factory CompanyForEmployee.fromJson(Map<String, dynamic> json) => CompanyForEmployee(
        id: json["_id"],
        companyName: json["companyName"],
        email: json["email"],
        password: json["password"],
        employees: List<String>.from(json["employees"].map((x) => x)),
        events: List<Event>.from(json["events"].map((x) => Event.fromJson(x))),
        v: json["__v"],
        companyCode: json["companyCode"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "companyName": companyName,
        "email": email,
        "password": password,
        "employees": List<dynamic>.from(employees.map((x) => x)),
        "events": List<dynamic>.from(events.map((x) => x.toJson())),
        "__v": v,
        "companyCode": companyCode,
    };
}

class Event {
    String id;

    Event({
        required this.id,
    });

    factory Event.fromJson(Map<String, dynamic> json) => Event(
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
    };
}
