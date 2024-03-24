import 'package:flutter/material.dart';
import 'package:possodexo/home/service/productApi.dart';
import 'package:possodexo/models/branch.dart';
import 'package:possodexo/models/category.dart';
import 'package:possodexo/models/payment.dart';
import 'package:possodexo/models/product.dart';

import 'package:possodexo/models/shift.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductController extends ChangeNotifier {
  ProductController({this.api = const ProductApi()});
  ProductApi api;

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  List<Product> products = [];
  Product? product;

  List<Category> categorized = [];
  Category? category;

  List<Branch> branchs = [];
  Branch? branch;

  List<Payment> payments = [];
  Payment? payment;

  Shift? shift;

  getProduct({required int categoryid}) async {
    products.clear();
    products = await ProductApi.getProduct(id: categoryid);
    notifyListeners();
  }

  getproductById({required int productId}) async {
    product = await ProductApi.getproductById(id: productId);
    notifyListeners();
  }

  getListCategory() async {
    categorized.clear();
    categorized = await ProductApi.getCategory();
    categorized.insert(0, Category(0, DateTime.now(), DateTime.now(), DateTime.now(), '00', 'ทั้งหมด'));
    notifyListeners();
    getProduct(categoryid: categorized[0].id!);
  }

  getListBranch() async {
    branchs.clear();
    branchs = await ProductApi.getBranch();
    notifyListeners();
  }

  getListPayment() async {
    payments.clear();
    payments = await ProductApi.getPayment();
    notifyListeners();
  }

  openShift({required int change, required int cash, required String remark}) async {
    shift = null;
    shift = await ProductApi.openShift(change: change, cash: cash, remark: remark);
    final SharedPreferences prefs = await _prefs;

    await prefs.setString('shiftId', shift!.id.toString()); 
    notifyListeners();
  }
}
