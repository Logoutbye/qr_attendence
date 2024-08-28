// // To parse this JSON data, do
// //
// //     final fetchAllEmployAttendeceByDate = fetchAllEmployAttendeceByDateFromJson(jsonString);

// import 'dart:convert';

// FetchAllEmployAttendeceByDate fetchAllEmployAttendeceByDateFromJson(String str) => FetchAllEmployAttendeceByDate.fromJson(json.decode(str));

// String fetchAllEmployAttendeceByDateToJson(FetchAllEmployAttendeceByDate data) => json.encode(data.toJson());

// class FetchAllEmployAttendeceByDate {
//     bool success;
//     int status;
//     List<AttendanceRecord> attendanceRecords;

//     FetchAllEmployAttendeceByDate({
//         required this.success,
//         required this.status,
//         required this.attendanceRecords,
//     });

//     factory FetchAllEmployAttendeceByDate.fromJson(Map<String, dynamic> json) => FetchAllEmployAttendeceByDate(
//         success: json["success"],
//         status: json["status"],
//         attendanceRecords: List<AttendanceRecord>.from(json["attendanceRecords"].map((x) => AttendanceRecord.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "success": success,
//         "status": status,
//         "attendanceRecords": List<dynamic>.from(attendanceRecords.map((x) => x.toJson())),
//     };
// }

// class AttendanceRecord {
//     String id;
//     String employee;
//     CompanyAttendece company;
//     DateTime checkInTime;
//     String status;
//     int v;
//     DateTime? checkOutTime;

//     AttendanceRecord({
//         required this.id,
//         required this.employee,
//         required this.company,
//         required this.checkInTime,
//         required this.status,
//         required this.v,
//         this.checkOutTime,
//     });

//     factory AttendanceRecord.fromJson(Map<String, dynamic> json) => AttendanceRecord(
//         id: json["_id"],
//         employee: json["employee"],
//         company: CompanyAttendece.fromJson(json["company"]),
//         checkInTime: DateTime.parse(json["checkInTime"]),
//         status: json["status"],
//         v: json["__v"],
//         checkOutTime: json["checkOutTime"] == null ? null : DateTime.parse(json["checkOutTime"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "_id": id,
//         "employee": employee,
//         "company": company.toJson(),
//         "checkInTime": checkInTime.toIso8601String(),
//         "status": status,
//         "__v": v,
//         "checkOutTime": checkOutTime?.toIso8601String(),
//     };
// }

// class CompanyAttendece {
//     String id;
//     String companyName;
//     String email;
//     String password;
//     List<String> employees;
//     List<Event> events;
//     int v;
//     String companyCode;

//     CompanyAttendece({
//         required this.id,
//         required this.companyName,
//         required this.email,
//         required this.password,
//         required this.employees,
//         required this.events,
//         required this.v,
//         required this.companyCode,
//     });

//     factory CompanyAttendece.fromJson(Map<String, dynamic> json) => CompanyAttendece(
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
//     final fetchAllEmployAttendeceByDate = fetchAllEmployAttendeceByDateFromJson(jsonString);

import 'dart:convert';

FetchAllEmployAttendeceByDate fetchAllEmployAttendeceByDateFromJson(String str) => FetchAllEmployAttendeceByDate.fromJson(json.decode(str));

String fetchAllEmployAttendeceByDateToJson(FetchAllEmployAttendeceByDate data) => json.encode(data.toJson());

class FetchAllEmployAttendeceByDate {
    bool success;
    int status;
    List<AttendanceRecord> attendanceRecords;

    FetchAllEmployAttendeceByDate({
        required this.success,
        required this.status,
        required this.attendanceRecords,
    });

    factory FetchAllEmployAttendeceByDate.fromJson(Map<String, dynamic> json) => FetchAllEmployAttendeceByDate(
        success: json["success"],
        status: json["status"],
        attendanceRecords: List<AttendanceRecord>.from(json["attendanceRecords"].map((x) => AttendanceRecord.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "status": status,
        "attendanceRecords": List<dynamic>.from(attendanceRecords.map((x) => x.toJson())),
    };
}

class AttendanceRecord {
    String id;
    Employee employee;
    CompanyAttendece company;
    DateTime checkInTime;
    String status;
    int v;
    DateTime checkOutTime;

    AttendanceRecord({
        required this.id,
        required this.employee,
        required this.company,
        required this.checkInTime,
        required this.status,
        required this.v,
        required this.checkOutTime,
    });

    factory AttendanceRecord.fromJson(Map<String, dynamic> json) => AttendanceRecord(
        id: json["_id"],
        employee: Employee.fromJson(json["employee"]),
        company: CompanyAttendece.fromJson(json["company"]),
        checkInTime: DateTime.parse(json["checkInTime"]),
        status: json["status"],
        v: json["__v"],
        checkOutTime: DateTime.parse(json["checkOutTime"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "employee": employee.toJson(),
        "company": company.toJson(),
        "checkInTime": checkInTime.toIso8601String(),
        "status": status,
        "__v": v,
        "checkOutTime": checkOutTime.toIso8601String(),
    };
}

class CompanyAttendece {
    String id;
    String companyName;
    String email;
    String password;
    List<Employee> employees;
    List<Event> events;
    int v;
    String companyCode;

    CompanyAttendece({
        required this.id,
        required this.companyName,
        required this.email,
        required this.password,
        required this.employees,
        required this.events,
        required this.v,
        required this.companyCode,
    });

    factory CompanyAttendece.fromJson(Map<String, dynamic> json) => CompanyAttendece(
        id: json["_id"],
        companyName: json["companyName"],
        email: json["email"],
        password: json["password"],
        employees: List<Employee>.from(json["employees"].map((x) => Employee.fromJson(x))),
        events: List<Event>.from(json["events"].map((x) => Event.fromJson(x))),
        v: json["__v"],
        companyCode: json["companyCode"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "companyName": companyName,
        "email": email,
        "password": password,
        "employees": List<dynamic>.from(employees.map((x) => x.toJson())),
        "events": List<dynamic>.from(events.map((x) => x.toJson())),
        "__v": v,
        "companyCode": companyCode,
    };
}

class Employee {
    String id;
    String username;
    String email;
    String password;
    String company;

    Employee({
        required this.id,
        required this.username,
        required this.email,
        required this.password,
        required this.company,
    });

    factory Employee.fromJson(Map<String, dynamic> json) => Employee(
        id: json["_id"],
        username: json["username"],
        email: json["email"],
        password: json["password"],
        company: json["company"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "username": username,
        "email": email,
        "password": password,
        "company": company,
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
