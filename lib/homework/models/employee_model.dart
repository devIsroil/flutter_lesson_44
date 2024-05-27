import 'package:json_annotation/json_annotation.dart';
part "employee_model.g.dart";

@JsonSerializable()
class Employees {
  final String name;
  final int age;
  final String position;
  final List skill;

  Employees({
    required this.name,
    required this.age,
    required this.position,
    required this.skill,
  });

  factory Employees.fromJson(Map<String, dynamic> json) {
    return _$EmployeesFromJson(json);
  }
}