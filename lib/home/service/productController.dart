import 'package:flutter/material.dart';
import 'package:possodexo/home/service/productApi.dart';
import 'package:possodexo/models/branch.dart';
import 'package:possodexo/models/category.dart';
import 'package:possodexo/models/payment.dart';
import 'package:possodexo/models/product.dart';
import 'package:possodexo/models/productMain.dart';
import 'package:possodexo/models/shift.dart';

class ProductController extends ChangeNotifier {
  ProductController({this.api = const ProductApi()});
  ProductApi api;

  List<Product> products = [];

  List<Category> categorized = [];
  Category? category;

  List<Branch> branchs = [];
  Branch? branch;

  List<Payment> payments = [];
  Payment? payment;

  Shift? shift;

  ProductMain? productMain;

  getProduct() async {
    products.clear();
    products = await ProductApi.getProduct();
    notifyListeners();
  }

  getListCategory() async {
    categorized.clear();
    categorized = await ProductApi.getCategory();
    notifyListeners();
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

  getListShift() async {
    shift = null;
    shift = await ProductApi.getShift();
    notifyListeners();
  }

  getproductMain({required int id}) async {
    productMain = null;
    productMain = await ProductApi.getproductMain(id: id);
    notifyListeners();
  }
}
