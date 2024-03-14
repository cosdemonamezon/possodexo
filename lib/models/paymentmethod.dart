import 'package:json_annotation/json_annotation.dart';
import 'package:possodexo/models/orderpayment.dart';

part 'paymentmethod.g.dart';

@JsonSerializable()
class PaymentMethod {
  final int id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;
  final String? name;
  final String? icon;
  final String? type;
  OrderPayment? orderPayments;

  PaymentMethod(
    this.id,
    this.createdAt,
    this.deletedAt,
    this.updatedAt,
    this.icon,
    this.name,
    this.orderPayments,
    this.type
  );

  factory PaymentMethod.fromJson(Map<String, dynamic> json) => _$PaymentMethodFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentMethodToJson(this);
}
