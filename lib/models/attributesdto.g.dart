// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attributesdto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttributesDto _$AttributesDtoFromJson(Map<String, dynamic> json) =>
    AttributesDto(
      json['attributeName'] as String,
      (json['total'] as num).toDouble(),
      (json['attributeValues'] as List<dynamic>)
          .map((e) => AttributeValuesDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AttributesDtoToJson(AttributesDto instance) =>
    <String, dynamic>{
      'attributeName': instance.attributeName,
      'total': instance.total,
      'attributeValues': instance.attributeValues,
    };
