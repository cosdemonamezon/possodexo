import 'package:json_annotation/json_annotation.dart';
import 'package:possodexo/models/attributeValues.dart';

part 'productAttribute.g.dart';

@JsonSerializable()
class ProductAttribute {
  final int id;
  final String? name;
  final int? price;
  final List<AttributeValues> attributeValues;

  ProductAttribute(
    this.id,
    this.name,
    this.price,
    this.attributeValues,
  );

  factory ProductAttribute.fromJson(Map<String, dynamic> json) =>
      _$ProductAttributeFromJson(json);

  Map<String, dynamic> toJson() => _$ProductAttributeToJson(this);
}
