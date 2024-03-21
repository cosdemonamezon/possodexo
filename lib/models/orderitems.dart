import 'package:json_annotation/json_annotation.dart';
import 'package:possodexo/models/attributesdto.dart';

part 'orderitems.g.dart';

@JsonSerializable()
class Orderitems {
  final int id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;
  final int quantity;
  final double price;  
  final double total;
  final List<AttributesDto> attributes;

  Orderitems(this.price, this.total, this.quantity, this.attributes, this.createdAt, this.deletedAt, this.id, this.updatedAt);

  factory Orderitems.fromJson(Map<String, dynamic> json) => _$OrderitemsFromJson(json);

  Map<String, dynamic> toJson() => _$OrderitemsToJson(this);
}
