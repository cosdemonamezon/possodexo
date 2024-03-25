import 'package:json_annotation/json_annotation.dart';
import 'package:possodexo/models/orderpayment.dart';
import 'package:possodexo/models/paymentqr.dart';

part 'nextpayment.g.dart';

@JsonSerializable()
class NextPayment {
  final bool next;
  final OrderPayment? orderPayment;
  final PaymentQr? payment;

  NextPayment(this.next, this.orderPayment, this.payment);

  factory NextPayment.fromJson(Map<String, dynamic> json) => _$NextPaymentFromJson(json);

  Map<String, dynamic> toJson() => _$NextPaymentToJson(this);
}
