import 'package:flutter/material.dart';
import 'package:possodexo/home/service/productApi.dart';
import 'package:possodexo/models/branch.dart';
import 'package:possodexo/models/category.dart';
import 'package:possodexo/models/product.dart';

class ProductController extends ChangeNotifier {
  ProductController({this.api = const ProductApi()});
  ProductApi api;

  List<Product> products = [];

  List<Category> categorized = [];
  Category? category;

  List<Branch> branchs = [];
  Branch? branch;

  getProduct() async {
    products.clear();
    products = await ProductApi.getProduct();
    notifyListeners();
  }

  getListCategory() async{
    categorized.clear();
    categorized = await ProductApi.getCategory();
    notifyListeners();
  }

  getListBranch() async{
    branchs.clear();
    branchs = await ProductApi.getBranch();
    notifyListeners();
  }
}
