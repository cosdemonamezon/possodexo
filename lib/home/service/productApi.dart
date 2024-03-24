import 'dart:convert' as convert;
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:possodexo/constants.dart';
import 'package:possodexo/models/branch.dart';
import 'package:possodexo/models/category.dart';
import 'package:possodexo/models/payment.dart';
import 'package:possodexo/models/product.dart';
import 'package:possodexo/models/shift.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductApi {
  const ProductApi();

  static Future<List<Product>> getProduct({required int id}) async {
    final url = Uri.https(publicUrl, '/api/product', {
      "categoryId": '$id',
      "sortBy": 'createdAt:DESC',
    });
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    var headers = {'Authorization': 'Bearer $token', 'Content-Type': 'application/json'};
    final response = await http.get(
      headers: headers,
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

  static Future<Product> getproductById({required int id}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    var headers = {'Authorization': 'Bearer $token', 'Content-Type': 'application/json'};
    final url = Uri.https(
      publicUrl,
      '/api/product/$id',
    );
    final response = await http.get(
      url,
      headers: headers,
    );
    if (response.statusCode == 200) {
      final data = convert.jsonDecode(response.body);

      return Product.fromJson(data);
    } else {
      final data = convert.jsonDecode(response.body);
      throw Exception(data['message']);
    }
  }

  //เรียกดูข้อมูล Category
  static Future<List<Category>> getCategory() async {
    final url = Uri.https(publicUrl, '/api/category');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    var headers = {'Authorization': 'Bearer $token', 'Content-Type': 'application/json'};
    final response = await http.get(
      headers: headers,
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

  static Future<Shift> openShift({required int change, required int cash, required String remark}) async {
    final url = Uri.https(publicUrl, '/api/shift');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    var headers = {'Authorization': 'Bearer $token', 'Content-Type': 'application/json'};
    final response = await http.post(
      url,
      headers: headers,
      body: convert.jsonEncode(
        {
          "change": change,
          "cash": cash,
          "branchId": 1,
          "remark": remark,
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



  // static Future<ProductMain> getproductMain({required int id}) async {
  //   final url = Uri.https(publicUrl, '/api/product/$id');
  //   final response = await http.get(
  //     url,
  //   );
  //   if (response.statusCode == 200) {
  //     final data = convert.jsonDecode(response.body);

  //     return ProductMain.fromJson(data);
  //   } else {
  //     final data = convert.jsonDecode(response.body);
  //     throw Exception(data['message']);
  //   }
  // }
}
