import 'package:json_annotation/json_annotation.dart';
import 'package:possodexo/models/category.dart';

part 'product.g.dart';

@JsonSerializable()
class Product {
  final int id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;
  final String? code;
  final String? name;
  final double? stdprice;
  final double? sellprice;
  final bool enableShot;
  final String? shotPrice;
  final Category? category;
  int? priceQTY = 0;
  int? qty = 1;

  Product(
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.code,
    this.name,
    this.stdprice,
    this.sellprice,
    this.enableShot,
    this.shotPrice,
    this.category,
    this.priceQTY,
    this.qty,
  );

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
