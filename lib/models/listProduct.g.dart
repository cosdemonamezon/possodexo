// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listProduct.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListProduct _$ListProductFromJson(Map<String, dynamic> json) => ListProduct(
      Product.fromJson(json['product'] as Map<String, dynamic>),
      ProductAttributeValue.fromJson(
          json['attributeValues'] as Map<String, dynamic>),
      ProductAttributeValue.fromJson(json['p0'] as Map<String, dynamic>),
      json['p1'] as int,
      (json['p2'] as List<dynamic>)
          .map((e) => ProductAttributeValue.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListProductToJson(ListProduct instance) =>
    <String, dynamic>{
      'product': instance.product,
      'attributeValues': instance.attributeValues,
      'p0': instance.p0,
      'p1': instance.p1,
      'p2': instance.p2,
    };
