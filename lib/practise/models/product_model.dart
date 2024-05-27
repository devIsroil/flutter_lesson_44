import 'package:json_annotation/json_annotation.dart';

part "product_model.g.dart";

@JsonSerializable()
class Product {
  final int id;
  final String title;
  final num price;
  final String description;
  final String category;
  final String image;
  final Map rating;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  // factory Product.fromJson(Map<String, dynamic> json) {
  //   return Product(
  //     productId: json['id'],
  //     productTitle: json['title'],
  //     productPrice: json['price'],
  //     productDescription: json['description'],
  //     productCategory: json['category'],
  //     imageUrl: json['image'],
  //     rating: json['rating'],
  //   );
  // }
  factory Product.fromJson(Map<String, dynamic> json) {
    return _$ProductFromJson(json);
  }
 Map<String, dynamic> toJson() {
   return _$ProductToJson(this);
  }
}

