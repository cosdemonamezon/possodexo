import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:possodexo/constants.dart';

class PaymentApi {
  const PaymentApi();

  //สร้างออร์เดอร์
  static Future ceateOrders() async {
    //final token = prefs.getString('token');
    //final token = prefs.getString('token');
    final url = Uri.https(publicUrl, '/api/order');
    final response = await http.post(url,
        //headers: {'Authorization': 'Bearer $token', 'Content-Type': 'application/json'},
        body: convert.jsonEncode({
          "shiftId": 0,
          "total": 0,
          "orderItems": [],
        }));
    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = convert.jsonDecode(response.body);
      return data['data'];
    } else {
      final data = convert.jsonDecode(response.body);
      throw Exception(data['message']);
    }
  }

  //เลือกการชำระเงิน
  static Future paymentSelected({required int orderId}) async {
    //final token = prefs.getString('token');
    //final token = prefs.getString('token');
    final url = Uri.https(publicUrl, '/api/order/$orderId/payment');
    final response = await http.post(url,
        //headers: {'Authorization': 'Bearer $token', 'Content-Type': 'application/json'},
        body: convert.jsonEncode({
          "orderPayments": [],
        }));
    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = convert.jsonDecode(response.body);
      return data['data'];
    } else {
      final data = convert.jsonDecode(response.body);
      throw Exception(data['message']);
    }
  }

  //จ่ายเงินทางเลือก
  static Future alternativePayment({required int orderId, required int orderPaymentId}) async {
    //final token = prefs.getString('token');
    //final token = prefs.getString('token');
    final url = Uri.https(publicUrl, '/api/order/$orderId/paid/$orderPaymentId');
    final response = await http.post(
      url,
      //headers: {'Authorization': 'Bearer $token', 'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = convert.jsonDecode(response.body);
      return data['data'];
    } else {
      final data = convert.jsonDecode(response.body);
      throw Exception(data['message']);
    }
  }
}