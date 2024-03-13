import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:possodexo/models/category.dart';
import 'package:possodexo/models/productAttribute.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  final int id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;
  final String? code;
  final String? name;
  final String? image;
  final double? price;
  final Category? category;
  final List<ProductAttribute>? productAttributes;

  double priceQTY;
  int qty;

  Product(
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.code,
    this.name,
    this.image,
    this.price,
    this.category,
    this.productAttributes, {
    this.qty = 1,
    this.priceQTY = 0,
  });

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
