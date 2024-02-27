import 'package:flutter/material.dart';

class PaymentCash extends StatefulWidget {
  const PaymentCash({super.key});

  @override
  State<PaymentCash> createState() => _PaymentCashState();
}

class _PaymentCashState extends State<PaymentCash> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: size.height * 0.12,
              width: size.width * 0.25,
              decoration: BoxDecoration(color: Colors.black),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Row(
                  children: [
                    IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                    Text(
                      'กลับ',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'IBMPlexSansThai',
                          fontSize: 16),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: size.width * 0.2,
            ),
            Divider(),
          ]),
    );
  }
}
