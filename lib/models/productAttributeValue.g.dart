// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'productAttributeValue.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductAttributeValue _$ProductAttributeValueFromJson(
        Map<String, dynamic> json) =>
    ProductAttributeValue(
      json['id'] as int,
      json['name'] as String,
      json['price'] as int,
    );

Map<String, dynamic> _$ProductAttributeValueToJson(
        ProductAttributeValue instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
    };
