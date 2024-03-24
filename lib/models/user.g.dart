// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      json['id'] as int,
      json['username'] as int?,
      json['password'] as int?,
      json['code'] as String?,
      json['firstName'] as String?,
      json['isActive'] as bool?,
      json['lastName'] as String?,
      json['phoneNumber'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'password': instance.password,
      'code': instance.code,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'phoneNumber': instance.phoneNumber,
      'isActive': instance.isActive,
    };
