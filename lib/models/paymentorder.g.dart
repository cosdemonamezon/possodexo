// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paymentorder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentOrder _$PaymentOrderFromJson(Map<String, dynamic> json) => PaymentOrder(
      json['id'] as int,
      json['orderStatus'] as String?,
      (json['total'] as num?)?.toDouble(),
      (json['discount'] as num?)?.toDouble(),
      (json['grandTotal'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$PaymentOrderToJson(PaymentOrder instance) =>
    <String, dynamic>{
      'id': instance.id,
      'orderStatus': instance.orderStatus,
      'total': instance.total,
      'discount': instance.discount,
      'grandTotal': instance.grandTotal,
    };
