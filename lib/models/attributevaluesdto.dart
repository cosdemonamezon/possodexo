import 'package:json_annotation/json_annotation.dart';

part 'attributevaluesdto.g.dart';

@JsonSerializable()
class AttributeValuesDto {
  final String attributeValueName;
  final int quantity;
  final int price;
  final double total;

  AttributeValuesDto(this.attributeValueName, this.quantity, this.price, this.total);

  factory AttributeValuesDto.fromJson(Map<String, dynamic> json) => _$AttributeValuesDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AttributeValuesDtoToJson(this);
}
