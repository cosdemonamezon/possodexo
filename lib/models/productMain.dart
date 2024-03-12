import 'package:json_annotation/json_annotation.dart';
import 'package:possodexo/models/productAttribute.dart';

part 'productMain.g.dart';

@JsonSerializable()
class ProductMain {
  final int id;
  final String? name;
  final int? price;
  final String? imageUrl;
  final List<ProductAttribute> productAttribute;
  double priceQTY;
  int qty;

  ProductMain(
    this.id,
    this.name,
    this.price,
    this.imageUrl,
    this.productAttribute, {
    this.qty = 1,
    this.priceQTY = 0,
  });

  factory ProductMain.fromJson(Map<String, dynamic> json) => _$ProductMainFromJson(json);

  Map<String, dynamic> toJson() => _$ProductMainToJson(this);
}
