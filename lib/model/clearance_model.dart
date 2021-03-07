// To parse this JSON data, do
//
//     final clearances = clearancesFromJson(jsonString);

import 'dart:convert';

Clearances clearancesFromJson(String str) =>
    Clearances.fromJson(json.decode(str));

String clearancesToJson(Clearances data) => json.encode(data.toJson());

class Clearances {
  Clearances({
    this.success,
    this.statusCode,
    this.message,
    this.data,
  });

  bool success;
  int statusCode;
  String message;
  List<StudentClearance> data;

  factory Clearances.fromJson(Map<String, dynamic> json) => Clearances(
        success: json["success"],
        statusCode: json["statusCode"],
        message: json["message"],
        data: List<StudentClearance>.from(
            json["data"].map((x) => StudentClearance.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "statusCode": statusCode,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class StudentClearance {
  StudentClearance({
    this.id,
    this.violationDesc,
    this.violationDate,
    this.status,
    this.studentId,
    this.departmentId,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String violationDesc;
  DateTime violationDate;
  String status;
  int studentId;
  int departmentId;
  DateTime createdAt;
  DateTime updatedAt;

  factory StudentClearance.fromJson(Map<String, dynamic> json) =>
      StudentClearance(
        id: json["id"],
        violationDesc: json["violation_desc"],
        violationDate: DateTime.parse(json["violation_date"]),
        status: json["status"],
        studentId: json["student_id"],
        departmentId: json["department_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "violation_desc": violationDesc,
        "violation_date": violationDate.toIso8601String(),
        "status": status,
        "student_id": studentId,
        "department_id": departmentId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
