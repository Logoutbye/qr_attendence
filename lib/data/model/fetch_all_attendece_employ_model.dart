// // To parse this JSON data, do
// //
// //     final fetchAllEmployAttendece = fetchAllEmployAttendeceFromJson(jsonString);

// import 'dart:convert';

// FetchAllEmployAttendece fetchAllEmployAttendeceFromJson(String str) => FetchAllEmployAttendece.fromJson(json.decode(str));

// String fetchAllEmployAttendeceToJson(FetchAllEmployAttendece data) => json.encode(data.toJson());

// class FetchAllEmployAttendece {
//     bool success;
//     int status;
//     List<AttendanceRecord> attendanceRecords;

//     FetchAllEmployAttendece({
//         required this.success,
//         required this.status,
//         required this.attendanceRecords,
//     });

//     factory FetchAllEmployAttendece.fromJson(Map<String, dynamic> json) => FetchAllEmployAttendece(
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
//     Company company;
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
//         company: Company.fromJson(json["company"]),
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

// class Company {
//     String id;
//     String companyName;
//     String email;
//     String password;
//     List<String> employees;
//     List<Event> events;
//     int v;
//     String companyCode;

//     Company({
//         required this.id,
//         required this.companyName,
//         required this.email,
//         required this.password,
//         required this.employees,
//         required this.events,
//         required this.v,
//         required this.companyCode,
//     });

//     factory Company.fromJson(Map<String, dynamic> json) => Company(
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
