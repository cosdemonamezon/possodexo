import 'package:json_annotation/json_annotation.dart';
import 'package:possodexo/models/orderitemsdto.dart';

part 'createorderdto.g.dart';

@JsonSerializable()
class CreateOrderDto {
  final int shiftId;
  final double total;
  final List<OrderItemsDto> orderItems;

  CreateOrderDto(this.shiftId, this.total, this.orderItems);

  factory CreateOrderDto.fromJson(Map<String, dynamic> json) => _$CreateOrderDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CreateOrderDtoToJson(this);
}
