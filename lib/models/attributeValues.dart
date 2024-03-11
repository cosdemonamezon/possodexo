import 'package:json_annotation/json_annotation.dart';

part 'attributeValues.g.dart';

@JsonSerializable()
class AttributeValues {
  final int id;
  final String? name;
  final int? price;

  AttributeValues(
    this.id,
    this.name,
    this.price,
  );

  factory AttributeValues.fromJson(Map<String, dynamic> json) =>
      _$AttributeValuesFromJson(json);

  Map<String, dynamic> toJson() => _$AttributeValuesToJson(this);
}
