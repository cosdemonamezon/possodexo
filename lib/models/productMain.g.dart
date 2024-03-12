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
      qty: json['qty'] as int? ?? 1,
      priceQTY: (json['priceQTY'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$ProductMainToJson(ProductMain instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'imageUrl': instance.imageUrl,
      'productAttribute': instance.productAttribute,
      'priceQTY': instance.priceQTY,
      'qty': instance.qty,
    };
