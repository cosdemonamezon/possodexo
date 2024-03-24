// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shift.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Shift _$ShiftFromJson(Map<String, dynamic> json) => Shift(
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
      json['change'] as int?,
      json['cash'] as int?,
      json['remark'] as String?,
      json['status'] as String?,
    )
      ..user = json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>)
      ..branch = json['branch'] == null
          ? null
          : Branch.fromJson(json['branch'] as Map<String, dynamic>);

Map<String, dynamic> _$ShiftToJson(Shift instance) => <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'deletedAt': instance.deletedAt?.toIso8601String(),
      'change': instance.change,
      'cash': instance.cash,
      'remark': instance.remark,
      'status': instance.status,
      'user': instance.user,
      'branch': instance.branch,
    };
