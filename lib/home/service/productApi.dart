import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:possodexo/constants.dart';
import 'package:possodexo/models/branch.dart';
import 'package:possodexo/models/category.dart';
import 'package:possodexo/models/payment.dart';
import 'package:possodexo/models/product.dart';
import 'package:possodexo/models/shift.dart';

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

  //เรียกดูข้อมูล Category
  static Future<List<Category>> getCategory() async {
    final url = Uri.https(publicUrl, '/api/category');
    final response = await http.get(
      url,
    );
    if (response.statusCode == 200) {
      final data = convert.jsonDecode(response.body);
      final list = data as List;
      return list.map((e) => Category.fromJson(e)).toList();
    } else {
      final data = convert.jsonDecode(response.body);
      throw Exception(data['message']);
    }
  }

  //เรียกดูข้อมูล Branch
  static Future<List<Branch>> getBranch() async {
    final url = Uri.https(publicUrl, '/api/branch');
    final response = await http.get(
      url,
    );
    if (response.statusCode == 200) {
      final data = convert.jsonDecode(response.body);
      final list = data as List;
      return list.map((e) => Branch.fromJson(e)).toList();
    } else {
      final data = convert.jsonDecode(response.body);
      throw Exception(data['message']);
    }
  }

  //เรียกดูข้อมูล payment
  static Future<List<Payment>> getPayment() async {
    final url = Uri.https(publicUrl, '/api/payment-method');
    final response = await http.get(
      url,
    );
    if (response.statusCode == 200) {
      final data = convert.jsonDecode(response.body);
      final list = data as List;
      return list.map((e) => Payment.fromJson(e)).toList();
    } else {
      final data = convert.jsonDecode(response.body);
      throw Exception(data['message']);
    }
  }

  //เรียกดูข้อมูลShift

  static Future<Shift> getShift() async {
    final url = Uri.https(publicUrl, '/api/shift');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: convert.jsonEncode(
        {
          "change": 0,
          "cash": 0,
          "remark": "string",
        },
      ),
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = convert.jsonDecode(response.body);
      return Shift.fromJson(data);
    } else {
      final data = convert.jsonDecode(response.body);
      throw Exception(data['message']);
    }
  }
}
