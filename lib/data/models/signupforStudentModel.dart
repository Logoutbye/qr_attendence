// To parse this JSON data, do
//
//     final signupforStudent = signupforStudentFromJson(jsonString);

import 'dart:convert';

SignupforStudent signupforStudentFromJson(String str) => SignupforStudent.fromJson(json.decode(str));

String signupforStudentToJson(SignupforStudent data) => json.encode(data.toJson());

class SignupforStudent {
    bool? success;
    String? message;

    SignupforStudent({
        this.success,
        this.message,
    });

    factory SignupforStudent.fromJson(Map<String, dynamic> json) => SignupforStudent(
        success: json["success"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
    };
}
