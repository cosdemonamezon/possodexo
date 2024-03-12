import 'package:flutter/material.dart';

class Listpayment extends StatefulWidget {
  const Listpayment({super.key});

  @override
  State<Listpayment> createState() => _ListpaymentState();
}

class _ListpaymentState extends State<Listpayment> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: size.width * 0.1,
            height: size.height * 0.1,
            decoration: BoxDecoration(color: Color(0xFF1B1B28)),
          )
        ],
      ),
    );
  }
}
