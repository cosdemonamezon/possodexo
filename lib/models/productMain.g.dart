// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'productMain.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductMain _$ProductMainFromJson(Map<String, dynamic> json) => ProductMain(
      json['id'] as int,
      json['name'] as String?,
      json['price'] as int?,
      json['imageUrl'] as String?,
      (json['productAttribute'] as List<dynamic>)
          .map((e) => ProductAttribute.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductMainToJson(ProductMain instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'imageUrl': instance.imageUrl,
      'productAttribute': instance.productAttribute,
    };
