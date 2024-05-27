// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Employees _$EmployeesFromJson(Map<String, dynamic> json) => Employees(
      name: json['name'] as String,
      age: (json['age'] as num).toInt(),
      position: json['position'] as String,
      skill: json['skill'] as List<dynamic>,
    );

Map<String, dynamic> _$EmployeesToJson(Employees instance) => <String, dynamic>{
      'name': instance.name,
      'age': instance.age,
      'position': instance.position,
      'skill': instance.skill,
    };
