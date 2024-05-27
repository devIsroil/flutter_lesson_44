import 'dart:convert';

import '../models/product_model.dart';
import 'package:http/http.dart ' as http;

class ProductController {
  final List<Product> _list = [];

  List<Product> get list {
    return [..._list];
  }

  Future<void> getProducts() async{
    Uri url = Uri.parse("https://fakestoreapi.com/products");
    try {
      final response = await http.get(url);
      if(response.statusCode != 200){
        throw Exception("Not Found");
      }
      final  data = jsonDecode(response.body);
      for(var product in data ){
        _list.add(Product.fromJson(product));
      }
    }
    catch(e){
      print(e);
    }
  }
}
