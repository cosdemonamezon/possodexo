import 'package:flutter/material.dart';
import 'package:possodexo/home/service/productApi.dart';
import 'package:possodexo/models/product.dart';

class ProductController extends ChangeNotifier {
  ProductController({this.api = const ProductApi()});
  ProductApi api;

  List<Product> products = [];

  getProduct() async {
    products.clear();
    products = await ProductApi.getProduct();
  }
}
