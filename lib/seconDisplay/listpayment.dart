import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Listpayment extends StatefulWidget {
  const Listpayment({Key? key}) : super(key: key);

  @override
  State<Listpayment> createState() => _ListpaymentState();
}

class _ListpaymentState extends State<Listpayment> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // รายการการชำระเงิน
          Column(
            children: [
              Column(
                children: [
                  Container(
                    width: size.width * 0.4,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xFFB0BEC5),
                      ),
                    ),
                    child: Container(
                      width: size.width * 0.4,
                      height: size.height * 0.1,
                      decoration: BoxDecoration(color: Color(0xFF1B1B28)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Row(
                          children: [
                            SizedBox(
                              width: size.width * 0.16,
                              child: Text(
                                'รายการชำระ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.2,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    'Order #',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    ' 20240214001',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Text('data')
                ],
              ),
            ],
          ),
          //// ชำระเงินทั้งหมด
          Expanded(
            child: Column(
              children: [
                Container(
                  width: size.width * 0.65,
                  height: size.height * 0.2,
                  decoration: BoxDecoration(color: Color(0xFf1264E3)),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          child: Text(
                            'ชำระเงินทั้งหมด',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Text(
                              '243.00',
                              style: TextStyle(fontSize: 90, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Text('data')
              ],
            ),
          ),
        ],
      ),
    );
  }
}
