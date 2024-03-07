// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'productAttribute.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductAttribute _$ProductAttributeFromJson(Map<String, dynamic> json) =>
    ProductAttribute(
      json['id'] as int,
      json['name'] as String?,
      json['price'] as int?,
      (json['attributeValues'] as List<dynamic>)
          .map((e) => AttributeValues.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductAttributeToJson(ProductAttribute instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'attributeValues': instance.attributeValues,
    };
