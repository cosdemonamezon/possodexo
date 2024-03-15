import 'package:json_annotation/json_annotation.dart';
import 'package:possodexo/models/attributevaluesdto.dart';

part 'attributesdto.g.dart';

@JsonSerializable()
class AttributesDto {
  final String attributeName;
  final double total;
  final List<AttributeValuesDto> attributeValues;

  AttributesDto(this.attributeName, this.total, this.attributeValues);

  factory AttributesDto.fromJson(Map<String, dynamic> json) => _$AttributesDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AttributesDtoToJson(this);
}
