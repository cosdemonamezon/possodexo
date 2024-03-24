import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:possodexo/constants.dart';
import 'package:possodexo/models/order.dart';
import 'package:possodexo/models/orderitemsdto.dart';
import 'package:possodexo/models/orderpayments.dart';
import 'package:possodexo/models/paymentorder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PaymentApi {
  const PaymentApi();

  //สร้างออร์เดอร์
  static Future<Order> ceateOrders({required int shiftId, required double total, required List<OrderItemsDto> orderItems}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    var headers = {'Authorization': 'Bearer $token', 'Content-Type': 'application/json'};
    final url = Uri.https(publicUrl, '/api/order');
    final response = await http.post(url,
        headers: headers,
        body: convert.jsonEncode({
          "shiftId": shiftId,
          "total": total,
          "orderItems": orderItems,
        }));
    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = convert.jsonDecode(response.body);
      return Order.fromJson(data);
    } else {
      final data = convert.jsonDecode(response.body);
      throw Exception(data['message']);
    }
  }

  //เลือกการชำระเงิน
  static Future<PaymentOrder> paymentSelected({required int orderId, required List<OrderPayments> orderPayments}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    var headers = {'Authorization': 'Bearer $token', 'Content-Type': 'application/json'};
    final url = Uri.https(publicUrl, '/api/order/$orderId/payment');
    final response = await http.post(url,
        headers: headers,
        body: convert.jsonEncode({
          "orderPayments": orderPayments,
        }));
    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = convert.jsonDecode(response.body);
      return PaymentOrder.fromJson(data);
    } else {
      final data = convert.jsonDecode(response.body);
      throw Exception(data['message']);
    }
  }

  //เน็ก API ดูการชำระเงินตัวถัดไป
  static Future nextPayment() async{
    
  }


  //จ่ายเงินทางเลือก
  static Future alternativePayment({required int orderId, required int orderPaymentId}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    var headers = {'Authorization': 'Bearer $token', 'Content-Type': 'application/json'};
    final url = Uri.https(publicUrl, '/api/order/$orderId/paid/$orderPaymentId');
    final response = await http.post(
      url,
      headers: headers,
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = convert.jsonDecode(response.body);
      return data;
    } else {
      final data = convert.jsonDecode(response.body);
      throw Exception(data['message']);
    }
  }
}
