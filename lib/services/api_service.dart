import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product.dart';

class ApiService {
  static const String _baseUrl = 'https://dummyjson.com';

  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse('$_baseUrl/products'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      List<Product> products = (jsonData['products'] as List)
          .map((item) => Product.fromJson(item))
          .toList();
      return products;
    } else {
      throw Exception('Failed to load products');
    }
  }
}
