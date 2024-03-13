import 'package:json_annotation/json_annotation.dart';

part 'productAttributeValue.g.dart';

@JsonSerializable()
class ProductAttributeValue {
  final int id;
  final String name;
  final int price;

  ProductAttributeValue(
    this.id,
    this.name,
    this.price,
  );

  factory ProductAttributeValue.fromJson(Map<String, dynamic> json) => _$ProductAttributeValueFromJson(json);

  Map<String, dynamic> toJson() => _$ProductAttributeValueToJson(this);
}
