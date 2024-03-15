// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'createorderdto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateOrderDto _$CreateOrderDtoFromJson(Map<String, dynamic> json) =>
    CreateOrderDto(
      json['shiftId'] as int,
      (json['total'] as num).toDouble(),
      (json['orderItems'] as List<dynamic>)
          .map((e) => OrderItemsDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CreateOrderDtoToJson(CreateOrderDto instance) =>
    <String, dynamic>{
      'shiftId': instance.shiftId,
      'total': instance.total,
      'orderItems': instance.orderItems,
    };
