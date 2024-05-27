// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
part "product_model.g.dart";

@JsonSerializable()
class Products {
  final String name;
  final double price;
  final bool inStock;

  Products({
    required this.name,
    required this.price,
    required this.inStock,
  });

  factory Products.fromJson(Map<String, dynamic> json) {
    return _$ProductsFromJson(json);
  }
}