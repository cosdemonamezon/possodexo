import 'package:json_annotation/json_annotation.dart';
import 'package:possodexo/models/category.dart';

part 'shift.g.dart';

@JsonSerializable()
class Shift {
  final int id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;
  final int? change;
  final int? cash;
  final String? remark;
  final String? status;

  Shift(
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.change,
    this.cash,
    this.remark,
    this.status,
  );

  factory Shift.fromJson(Map<String, dynamic> json) => _$ShiftFromJson(json);

  Map<String, dynamic> toJson() => _$ShiftToJson(this);
}
