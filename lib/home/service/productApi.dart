import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:possodexo/constants.dart';
import 'package:possodexo/models/product.dart';

class ProductApi {
  const ProductApi();

  static Future<List<Product>> getProduct() async {
    final url = Uri.https(publicUrl, '/api/product');
    final response = await http.get(
      url,
    );
    if (response.statusCode == 200) {
      final data = convert.jsonDecode(response.body);
      final list = data as List;
      return list.map((e) => Product.fromJson(e)).toList();
    } else {
      final data = convert.jsonDecode(response.body);
      throw Exception(data['message']);
    }
  }
}
