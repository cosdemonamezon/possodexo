// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orderitemsdto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderItemsDto _$OrderItemsDtoFromJson(Map<String, dynamic> json) =>
    OrderItemsDto(
      json['productId'] as int,
      (json['price'] as num).toDouble(),
      (json['total'] as num).toDouble(),
      json['quantity'] as int,
      (json['attributes'] as List<dynamic>)
          .map((e) => AttributesDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrderItemsDtoToJson(OrderItemsDto instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'price': instance.price,
      'quantity': instance.quantity,
      'total': instance.total,
      'attributes': instance.attributes,
    };
