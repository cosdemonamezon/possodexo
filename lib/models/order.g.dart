// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
      (json['discount'] as num?)?.toDouble(),
      (json['grandTotal'] as num?)?.toDouble(),
      json['id'] as int,
      json['orderDate'] == null
          ? null
          : DateTime.parse(json['orderDate'] as String),
      json['orderNo'] as String?,
      json['orderStatus'] as String?,
      json['shift'] == null
          ? null
          : Shift.fromJson(json['shift'] as Map<String, dynamic>),
      (json['total'] as num?)?.toDouble(),
      json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      json['orderPayments'] == null
          ? null
          : OrderPayment.fromJson(
              json['orderPayments'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'deletedAt': instance.deletedAt?.toIso8601String(),
      'orderNo': instance.orderNo,
      'orderDate': instance.orderDate?.toIso8601String(),
      'orderStatus': instance.orderStatus,
      'total': instance.total,
      'discount': instance.discount,
      'grandTotal': instance.grandTotal,
      'shift': instance.shift,
      'orderPayments': instance.orderPayments,
    };
