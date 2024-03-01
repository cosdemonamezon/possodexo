import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:possodexo/home/firstPage.dart';
import 'package:possodexo/home/homePage.dart';
import 'package:possodexo/login/loginPage.dart';
import 'package:possodexo/payment/widgets/Discount.dart';
import 'package:possodexo/payment/widgets/paymentCash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('th');
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: PaymentCash(
        selectedItem: [],
        sumPrice: '',
        sumQTY: '',
      ),
    );
  }
}
