import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:possodexo/models/category.dart';
import 'package:possodexo/models/product.dart';
import 'package:possodexo/models/productAttribute.dart';
import 'package:possodexo/models/productAttributeValue.dart';

part 'listProduct.g.dart';

@JsonSerializable()
class ListProduct {
  final Product product;
  final ProductAttributeValue attributeValues;
  final ProductAttributeValue p0;
  int? p1;
  List<ProductAttributeValue>? p2;

  ListProduct(this.product, this.attributeValues, this.p0, this.p1, this.p2);

  factory ListProduct.fromJson(Map<String, dynamic> json) => _$ListProductFromJson(json);

  Map<String, dynamic> toJson() => _$ListProductToJson(this);
}
