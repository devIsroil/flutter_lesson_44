import 'package:flutter_lesson_44/homework/models/product_model.dart';
import 'package:json_annotation/json_annotation.dart';

import 'employee_model.dart';
part "company_model.g.dart";

@JsonSerializable()
class Company {
  final String company;
  final String location;
  final List<Employees> employees;
  final List<Products> products;

  Company({
    required this.company,
    required this.location,
    required this.employees,
    required this.products,
  });

  factory Company.fromJson(Map<String, dynamic> json) {
    return _$CompanyFromJson(json);
  }
}