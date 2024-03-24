import 'package:json_annotation/json_annotation.dart';
import 'package:possodexo/models/category.dart';

part 'unit.g.dart';

@JsonSerializable()
class Unit {
  final int? id;
  final int? name;

  Unit(
    this.id,
    this.name
  );

  factory Unit.fromJson(Map<String, dynamic> json) => _$UnitFromJson(json);

  Map<String, dynamic> toJson() => _$UnitToJson(this);
}
