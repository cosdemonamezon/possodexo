import 'package:json_annotation/json_annotation.dart';
import 'package:possodexo/models/attributesdto.dart';

part 'orderitemsdto.g.dart';

@JsonSerializable()
class OrderItemsDto {
  final int productId;
  final double price;
  final int quantity;
  final double total;
  final List<AttributesDto> attributes;

  OrderItemsDto(
    this.productId,
    this.price,
    this.total,
    this.quantity,
    this.attributes
  );

  factory OrderItemsDto.fromJson(Map<String, dynamic> json) => _$OrderItemsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$OrderItemsDtoToJson(this);
}
