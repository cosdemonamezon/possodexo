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
      body: Container(
        color: Color(0xFFF6F6F8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // รายการการชำระเงิน
            Container(
              height: size.height * 1,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    right: BorderSide(
                      color: Color(0xFFB0BEC5),
                    ),
                  )),
              child: Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: SizedBox(
                      height: size.height * 0.7,
                      child: Column(
                        children: [
                          Container(
                            width: size.width * 0.44,
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
                                padding: const EdgeInsets.only(left: 30, right: 30),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          SizedBox(
                            height: size.height * 0.03,
                          ),
                          SizedBox(
                            height: size.height * 0.1,
                            width: size.width * 0.44,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 40, right: 40),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        child: Row(
                                          children: [
                                            Text(
                                              'กาแฟสังขยา (Custard Coffee)',
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                            SizedBox(
                                              width: size.width * 0.01,
                                            ),
                                            Text(
                                              'X1',
                                              style: TextStyle(
                                                color: Color(0xFF9E9E9E),
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        child: Text(
                                          '65.00',
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * 0.01,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 40, right: 40),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'เพิ่มช็อตกาแฟ  1',
                                        style: TextStyle(color: Color(0xFF455A64), fontSize: 16),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * 0.01,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.44,
                            child: Divider(
                              color: Color(0xFFB0BEC5),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          SizedBox(
                            height: size.height * 0.14,
                            width: size.width * 0.44,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 40, right: 40),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        child: Row(
                                          children: [
                                            Text(
                                              'Matcha Latte',
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                            SizedBox(
                                              width: size.width * 0.01,
                                            ),
                                            Text(
                                              'X2',
                                              style: TextStyle(
                                                color: Color(0xFF9E9E9E),
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        child: Text(
                                          '150.00',
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * 0.01,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 40, right: 40),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'ขนาด M',
                                        style: TextStyle(color: Color(0xFF455A64), fontSize: 16),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * 0.01,
                                ),
                                SizedBox(
                                  height: size.height * 0.01,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 40, right: 40),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'แถมโค้ก 1 ขวด',
                                        style: TextStyle(color: Color(0xFF455A64), fontSize: 16),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.44,
                            child: Divider(
                              color: Color(0xFFB0BEC5),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          SizedBox(
                            height: size.height * 0.14,
                            width: size.width * 0.44,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 40, right: 40),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        child: Row(
                                          children: [
                                            Text(
                                              'COCOA',
                                              style: TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                            SizedBox(
                                              width: size.width * 0.01,
                                            ),
                                            Text(
                                              'X1',
                                              style: TextStyle(
                                                color: Color(0xFF9E9E9E),
                                                fontSize: 16,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        child: Text(
                                          '58.00',
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * 0.01,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 40, right: 40),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'ขนาด S',
                                        style: TextStyle(color: Color(0xFF455A64), fontSize: 16),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: size.height * 0.01,
                                ),
                                SizedBox(
                                  height: size.height * 0.01,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 40, right: 40),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'ส่วนลด 2.00 บาท',
                                        style: TextStyle(color: Color(0xFFFF5252), fontSize: 16),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.44,
                            child: Divider(
                              color: Color(0xFFB0BEC5),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.44,
                    child: Divider(
                      thickness: 8,
                      color: Color(0xFFF6F6F8),
                    ),
                  ),
                  Container(
                    height: size.height * 0.28,
                    width: size.width * 0.44,
                    color: Colors.white,
                    child: Column(
                      children: [
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40, right: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                child: Row(
                                  children: [
                                    Text(
                                      'จำนวนสินค้า',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Color(0xFF424242),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                child: Text(
                                  '5',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFF424242),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40, right: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                child: Row(
                                  children: [
                                    Text(
                                      'รวม',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Color(0xFF424242),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                child: Text(
                                  '360.00 ฿',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFF424242),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40, right: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                child: Row(
                                  children: [
                                    Text(
                                      'ส่วนลด',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Color(0xFF424242),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                child: Text(
                                  '-117.00 ฿',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFFFF5252),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        SizedBox(
                          width: size.width * 0.4,
                          child: Divider(
                            color: Color(0xFFB0BEC5),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 40, right: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                child: Row(
                                  children: [
                                    Text(
                                      'ชำระทั้งหมด',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Color(0xFF424242),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                child: Text(
                                  '243.00 ฿',
                                  style: TextStyle(
                                    fontSize: 23,
                                    color: Color(0xFF1264E3),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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
      ),
    );
  }
}
