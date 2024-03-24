// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'productAttribute.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductAttribute _$ProductAttributeFromJson(Map<String, dynamic> json) =>
    ProductAttribute(
      json['id'] as int,
      json['name'] as String,
      json['type'] as String?,
      (json['productAttributeValues'] as List<dynamic>)
          .map((e) => ProductAttributeValue.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductAttributeToJson(ProductAttribute instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'productAttributeValues': instance.productAttributeValues,
    };
