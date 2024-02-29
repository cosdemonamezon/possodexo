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
      json['stdprice'] as String?,
      json['sellprice'] as String?,
      json['enableShot'] as bool,
      json['shotPrice'] as String?,
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
    };
