// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listProduct.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListProduct _$ListProductFromJson(Map<String, dynamic> json) => ListProduct(
      Product.fromJson(json['product'] as Map<String, dynamic>),
      ProductAttributeValue.fromJson(
          json['attributeValues'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ListProductToJson(ListProduct instance) =>
    <String, dynamic>{
      'product': instance.product,
      'attributeValues': instance.attributeValues,
    };
