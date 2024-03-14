// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attributevaluesdto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttributeValuesDto _$AttributeValuesDtoFromJson(Map<String, dynamic> json) =>
    AttributeValuesDto(
      json['attributeValueName'] as String,
      json['quantity'] as int,
      json['price'] as int,
      (json['total'] as num).toDouble(),
    );

Map<String, dynamic> _$AttributeValuesDtoToJson(AttributeValuesDto instance) =>
    <String, dynamic>{
      'attributeValueName': instance.attributeValueName,
      'quantity': instance.quantity,
      'price': instance.price,
      'total': instance.total,
    };
