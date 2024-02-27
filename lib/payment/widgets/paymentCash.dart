import 'package:flutter/material.dart';
import 'package:possodexo/home/homePage.dart';

class PaymentCash extends StatefulWidget {
  const PaymentCash(
      {super.key,
      required this.selectedItem,
      required this.sumPrice,
      required this.sumQTY});
  final List<ItemSelect> selectedItem;
  final String sumPrice;
  final String sumQTY;

  @override
  State<PaymentCash> createState() => _PaymentCashState();
}

class _PaymentCashState extends State<PaymentCash> {
  @override
  void initState() {
    super.initState();
    print(widget.selectedItem);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 5,
            child: Column(
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
                    height: size.width * 0.005,
                  ),
                  Column(
                    children: [
                      Container(
                        height: size.height * 0.5,
                        width: size.width * 0.25,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 228, 226, 226)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                SizedBox(
                                    height: size.height * 0.3,
                                    child: ListView.builder(
                                      itemCount: widget.selectedItem.length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(
                                                          "${widget.selectedItem[index].qty}"),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text('ขนาด'),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text('โปรโมชั่น'),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    widget.selectedItem[index]
                                                        .price!
                                                        .toStringAsFixed(2),
                                                  ),
                                                  widget.selectedItem[index]
                                                              .priceQTY ==
                                                          0
                                                      ? Text(
                                                          widget
                                                              .selectedItem[
                                                                  index]
                                                              .price!
                                                              .toStringAsFixed(
                                                                  2),
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        )
                                                      : Text(
                                                          widget
                                                              .selectedItem[
                                                                  index]
                                                              .priceQTY!
                                                              .toStringAsFixed(
                                                                  2),
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ))
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    color: Color.fromARGB(15, 0, 0, 0),
                    height: size.height * 0.005,
                    width: size.width * 0.25,
                  ),
                  Container(
                    height: size.height * 0.05,
                    width: size.width * 0.25,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 228, 226, 226),
                        border: Border(
                            bottom: BorderSide(
                                color: Color.fromARGB(255, 228, 226, 226)))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                "assets/icons/Frame.png",
                                scale: 20,
                              ),
                            ),
                            Text(
                              "ส่วนลด",
                              style: TextStyle(color: Color(0xff1264E3)),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: Color(0xff1264E3),
                        )
                      ],
                    ),
                  ),
                  Container(
                    color: Color.fromARGB(15, 0, 0, 0),
                    height: size.height * 0.005,
                    width: size.width * 0.25,
                  ),
                  Container(
                    height: size.height * 0.05,
                    width: size.width * 0.25,
                    decoration: BoxDecoration(
                        color: Color(0xff1264E3),
                        border: Border(
                            bottom: BorderSide(
                                color: Color.fromARGB(255, 228, 226, 226)))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                "assets/icons/Barth.png",
                                scale: 20,
                              ),
                            ),
                            Text(
                              "ชำระเงิน",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        Icon(Icons.arrow_forward_ios_outlined,
                            color: Colors.white)
                      ],
                    ),
                  ),
                  Container(
                    color: Color.fromARGB(255, 228, 226, 226),
                    height: size.height * 0.257,
                    width: size.width * 0.25,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("จำนวนสินค้า"),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("${widget.sumQTY} ฿"),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("รวม"),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("${widget.sumPrice} ฿"),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("ส่วนลด"),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("0฿"),
                            )
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("ชำระทั้งหมด"),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("${widget.sumPrice}฿"),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ]),
          ),
          Expanded(flex: 15, child: Column())
        ],
      ),
    );
  }
}
