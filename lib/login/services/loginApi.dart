import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:possodexo/constants.dart';

class LoginApi {
  const LoginApi();

  static Future login(String username, String password,) async {
    final url = Uri.https(publicUrl, 'api/auth/sign-in');
    final response = await http.post(url, body: {
      'username': username,
      'password': password,
    });
    if (response.statusCode == 200) {
      final data = convert.jsonDecode(response.body);
      return data['accessToken'];
    } else {
      final data = convert.jsonDecode(response.body);
      throw Exception(data['message']);
    }
  }

  //สมัครสมาชิก
  static Future register(String phoneNumber, String username,String password,String code,String firstName,String lastName,) async {
    final url = Uri.https(publicUrl, 'api/user');
    final response = await http.post(url, body: {
      'phoneNumber': phoneNumber,
      'username': username,
      'password': password,
      'code': code,
      'firstName': firstName,
      'lastName': lastName,
      "roleId": 0
    });
    if (response.statusCode == 200) {
      final data = convert.jsonDecode(response.body);
      return data;
    } else {
      final data = convert.jsonDecode(response.body);
      throw Exception(data['message']);
    }
  }
}