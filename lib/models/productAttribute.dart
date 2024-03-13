import 'package:json_annotation/json_annotation.dart';
import 'package:possodexo/models/productAttributeValue.dart';

part 'productAttribute.g.dart';

@JsonSerializable()
class ProductAttribute {
  final int id;
  final String name;
  final String type;
  final List<ProductAttributeValue> productAttributeValues;

  ProductAttribute(
    this.id,
    this.name,
    this.type,
    this.productAttributeValues,
  );

  factory ProductAttribute.fromJson(Map<String, dynamic> json) => _$ProductAttributeFromJson(json);

  Map<String, dynamic> toJson() => _$ProductAttributeToJson(this);
}
