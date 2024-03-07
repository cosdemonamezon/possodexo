// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      json['id'] as int,
      json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
      json['code'] as String?,
      json['name'] as String?,
      (json['stdprice'] as num?)?.toDouble(),
      (json['sellprice'] as num?)?.toDouble(),
      json['enableShot'] as bool,
      json['shotPrice'] as String?,
      json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
      json['priceQTY'] as int?,
      json['qty'] as int?,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'deletedAt': instance.deletedAt?.toIso8601String(),
      'code': instance.code,
      'name': instance.name,
      'stdprice': instance.stdprice,
      'sellprice': instance.sellprice,
      'enableShot': instance.enableShot,
      'shotPrice': instance.shotPrice,
      'category': instance.category,
      'priceQTY': instance.priceQTY,
      'qty': instance.qty,
    };
