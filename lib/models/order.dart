import 'package:json_annotation/json_annotation.dart';
import 'package:possodexo/models/orderitems.dart';
import 'package:possodexo/models/orderpayment.dart';
import 'package:possodexo/models/shift.dart';

part 'order.g.dart';

@JsonSerializable()
class Order {
  final int id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;
  final String? orderNo;
  final DateTime? orderDate;
  final String? orderStatus;
  final double? total;
  final double? discount;
  final double? grandTotal;
  Shift? shift;
  List<Orderitems>? orderItems;
  List<OrderPayment>? orderPayments;

  Order(
    this.createdAt,
    this.deletedAt,
    this.discount,
    this.grandTotal,
    this.id,
    this.orderDate,
    this.orderNo,
    this.orderStatus,
    this.shift,
    this.total,
    this.updatedAt,
    this.orderPayments,
    this.orderItems
  );

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);
}
