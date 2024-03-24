import 'package:json_annotation/json_annotation.dart';
import 'package:possodexo/models/category.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final int id;
  final int? username;
  final int? password;
  final String? code;
  final String? firstName;
  final String? lastName;
  final String? phoneNumber;
  final bool? isActive;

  User(
    this.id,
    this.username,
    this.password,
    this.code,
    this.firstName,
    this.isActive,
    this.lastName,
    this.phoneNumber
  );

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
