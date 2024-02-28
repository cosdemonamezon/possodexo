import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:possodexo/home/homePage.dart';
import 'package:possodexo/home/widgets/OpenAndCloseSwitch.dart';

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
  TextEditingController ai = TextEditingController();
  bool _isSelected = false;
  int selectedIndex = 0;
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  bool open = true;
  @override
  void initState() {
    super.initState();
    print(widget.selectedItem);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Row(
          children: [
            Column(children: [
              Container(
                height: size.height * 0.08,
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
              Container(
                  height: size.height * 0.46,
                  width: size.width * 0.25,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(color: Colors.white),
                  child: ListView.builder(
                    itemCount: widget.selectedItem.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Row(
                            children: [
                              Text("${widget.selectedItem[index].name}"),
                              Text(" X ${widget.selectedItem[index].qty}"),
                              SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text('ขนาด'),
                              SizedBox(
                                width: size.width * 0.01,
                              ),
                              Text(widget.selectedItem[index].size == 0
                                  ? 'S'
                                  : widget.selectedItem[index].size == 1
                                      ? 'M'
                                      : "L")
                            ],
                          ),
                          Row(
                            children: [
                              Text('โปรโมชั่น'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.selectedItem[index].size == 0
                                    ? widget.selectedItem[index].priceS!
                                        .toStringAsFixed(2)
                                    : widget.selectedItem[index].size == 1
                                        ? widget.selectedItem[index].priceM!
                                            .toStringAsFixed(2)
                                        : widget.selectedItem[index].priceL!
                                            .toStringAsFixed(2),
                              ),
                              widget.selectedItem[index].priceQTY == 0
                                  ? Text(
                                      widget.selectedItem[index].priceS!
                                          .toStringAsFixed(2),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
                                  : Text(
                                      widget.selectedItem[index].priceQTY!
                                          .toStringAsFixed(2),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                            ],
                          ),
                        ],
                      );
                    },
                  )),
              Container(
                color: Color.fromARGB(15, 0, 0, 0),
                height: size.height * 0.005,
                width: size.width * 0.25,
              ),
              Container(
                height: size.height * 0.05,
                width: size.width * 0.25,
                decoration: BoxDecoration(
                    color: Colors.white,
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 15,
                        color: Color(0xff1264E3),
                      ),
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 15,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
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
                          child: Text("${widget.sumQTY}"),
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
            Expanded(
              flex: 10,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: size.height * 0.95,
                      width: double.infinity,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 228, 226, 226)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "ชำระเงิน",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white,
                            ),
                            height: size.height * 0.85,
                            width: size.width * 0.5,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("เลือกวิธีการชำระเงิน"),
                                      SizedBox(
                                        width: size.width * 0.23,
                                      ),
                                      OpenAndCloseSwitch(
                                        size: size,
                                        open: open,
                                        showTextOpen: 'เเบ่งจ่าย',
                                        showTextClose: 'เเบ่งจ่าย',
                                        onChanged: (value) {
                                          setState(() {
                                            open = value;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: size.height * 0.01,
                                  ),
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              onItemTapped(0);
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: selectedIndex == 0
                                                      ? Color(0xfffE8EAF6)
                                                      : Colors.white,
                                                  border: Border.all(
                                                      color: Color(0xff1264E3)),
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                              height: size.height * 0.05,
                                              width: size.width * 0.11,
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10),
                                                    child: Image.asset(
                                                        "assets/icons/cash.png",
                                                        scale: 20),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10),
                                                    child: Text("เงินสด"),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: size.width * 0.01,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              onItemTapped(1);
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: selectedIndex == 1
                                                      ? Color(0xfffE8EAF6)
                                                      : Colors.white,
                                                  border: Border.all(
                                                      color: Color(0xff1264E3)),
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                              height: size.height * 0.05,
                                              width: size.width * 0.11,
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 5),
                                                    child: Image.asset(
                                                        "assets/icons/Promptpay.png",
                                                        scale: 20),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 5),
                                                    child: Text("QR Promptpay"),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: size.width * 0.01,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              onItemTapped(2);
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: selectedIndex == 2
                                                      ? Color(0xfffE8EAF6)
                                                      : Colors.white,
                                                  border: Border.all(
                                                      color: Color(0xff1264E3)),
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                              height: size.height * 0.05,
                                              width: size.width * 0.11,
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10),
                                                    child: Image.asset(
                                                        "assets/icons/TrueMoney.png",
                                                        scale: 20),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10),
                                                    child: Text("True Money"),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: size.width * 0.01,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              onItemTapped(3);
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: selectedIndex == 3
                                                      ? Color(0xfffE8EAF6)
                                                      : Colors.white,
                                                  border: Border.all(
                                                      color: Color(0xff1264E3)),
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                              height: size.height * 0.05,
                                              width: size.width * 0.11,
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10),
                                                    child: Image.asset(
                                                        "assets/icons/MaeManee.png",
                                                        scale: 20),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10),
                                                    child: Text("แม่มณี"),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: size.height * 0.01,
                                      ),
                                      Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              onItemTapped(4);
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: selectedIndex == 4
                                                      ? Color(0xfffE8EAF6)
                                                      : Colors.white,
                                                  border: Border.all(
                                                      color: Color(0xff1264E3)),
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                              height: size.height * 0.05,
                                              width: size.width * 0.11,
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10),
                                                    child: Image.asset(
                                                        "assets/icons/Linepay.png",
                                                        scale: 20),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10),
                                                    child: Text("LINE Pay"),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: size.width * 0.01,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              onItemTapped(5);
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: selectedIndex == 5
                                                      ? Color(0xfffE8EAF6)
                                                      : Colors.white,
                                                  border: Border.all(
                                                      color: Color(0xff1264E3)),
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                              height: size.height * 0.05,
                                              width: size.width * 0.11,
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 5),
                                                    child: Image.asset(
                                                        "assets/icons/moneyCard.png",
                                                        scale: 20),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 5),
                                                    child: Text(
                                                        "บัตรเครดิต/เดบิต"),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: size.width * 0.01,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              onItemTapped(6);
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: selectedIndex == 6
                                                      ? Color(0xfffE8EAF6)
                                                      : Colors.white,
                                                  border: Border.all(
                                                      color: Color(0xff1264E3)),
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                              height: size.height * 0.05,
                                              width: size.width * 0.11,
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10),
                                                    child: Image.asset(
                                                        "assets/icons/MaeManee.png",
                                                        scale: 20),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10),
                                                    child: Text("แม่มณี"),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: size.width * 0.01,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              onItemTapped(7);
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: selectedIndex == 7
                                                      ? Color(0xfffE8EAF6)
                                                      : Colors.white,
                                                  border: Border.all(
                                                      color: Color(0xff1264E3)),
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                              height: size.height * 0.05,
                                              width: size.width * 0.11,
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10),
                                                    child: Image.asset(
                                                        "assets/icons/EmCard.png",
                                                        scale: 20),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10),
                                                    child: Text("บัตรพนักงาน"),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: size.height * 0.01,
                                      ),
                                      Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              onItemTapped(8);
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: selectedIndex == 8
                                                      ? Color(0xfffE8EAF6)
                                                      : Colors.white,
                                                  border: Border.all(
                                                      color: Color(0xff1264E3)),
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                              height: size.height * 0.05,
                                              width: size.width * 0.11,
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10),
                                                    child: Image.asset(
                                                        "assets/icons/Wechart.png",
                                                        scale: 20),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10),
                                                    child: Text("We Chart"),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: size.width * 0.01,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              onItemTapped(9);
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: selectedIndex == 9
                                                      ? Color(0xfffE8EAF6)
                                                      : Colors.white,
                                                  border: Border.all(
                                                      color: Color(0xff1264E3)),
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                              height: size.height * 0.05,
                                              width: size.width * 0.11,
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 5),
                                                    child: Image.asset(
                                                        "assets/icons/Alipay.png",
                                                        scale: 20),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 5),
                                                    child: Text("Alipay"),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: size.width * 0.01,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              onItemTapped(10);
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: selectedIndex == 10
                                                      ? Color(0xfffE8EAF6)
                                                      : Colors.white,
                                                  border: Border.all(
                                                      color: Color(0xff1264E3)),
                                                  borderRadius:
                                                      BorderRadius.circular(8)),
                                              height: size.height * 0.05,
                                              width: size.width * 0.11,
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10),
                                                    child: Image.asset(
                                                        "assets/icons/Wallet.png",
                                                        scale: 20),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10),
                                                    child: Text("อื่นๆ"),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: size.height * 0.01,
                                      ),
                                    ],
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border:
                                          Border.all(color: Color(0xfffB0BEC5)),
                                    ),
                                    width: double.infinity,
                                    height: size.height * 0.09,
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: TextFormField(
                                        controller: ai,
                                        readOnly: true,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "฿",
                                          hintStyle: TextStyle(fontSize: 25),
                                        ),
                                        validator: (value) {
                                          if (value == '') {
                                            return "โปรดใส่ข้อความให้ครบถ้วน";
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: size.height * 0.01),
                                  Container(
                                    margin: const EdgeInsets.only(
                                        left: 1, right: 1),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: size.height * 0.01,
                                        ),
                                        Column(
                                          children: [
                                            const SizedBox(height: 20),

                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              // implement the number keys (from 0 to 9) with the NumberButton widget
                                              // the NumberButton widget is defined in the bottom of this file
                                              children: [
                                                SizedBox(
                                                  width: size.width * 0.1,
                                                  height: size.height * 0.08,
                                                  child: NumberButton(
                                                    number: '7',
                                                    size: 10,
                                                    color: Colors.white,
                                                    controller: ai,
                                                    onPressed: () {
                                                      ai.text += '7';
                                                    },
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: size.width * 0.01,
                                                ),
                                                SizedBox(
                                                  width: size.width * 0.1,
                                                  height: size.height * 0.08,
                                                  child: NumberButton(
                                                    number: '8',
                                                    size: 10,
                                                    color: Colors.white,
                                                    controller: ai,
                                                    onPressed: () {
                                                      ai.text += '8';
                                                    },
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: size.width * 0.01,
                                                ),
                                                SizedBox(
                                                  width: size.width * 0.1,
                                                  height: size.height * 0.08,
                                                  child: NumberButton(
                                                    number: '9',
                                                    size: 10,
                                                    color: Colors.white,
                                                    controller: ai,
                                                    onPressed: () {
                                                      ai.text += '9';
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 20),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                SizedBox(
                                                  width: size.width * 0.1,
                                                  height: size.height * 0.08,
                                                  child: NumberButton(
                                                    number: '4',
                                                    size: 10,
                                                    color: Colors.white,
                                                    controller: ai,
                                                    onPressed: () {
                                                      ai.text += '4';
                                                    },
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: size.width * 0.01,
                                                ),
                                                SizedBox(
                                                  width: size.width * 0.1,
                                                  height: size.height * 0.08,
                                                  child: NumberButton(
                                                    number: '5',
                                                    size: 10,
                                                    color: Colors.white,
                                                    controller: ai,
                                                    onPressed: () {
                                                      ai.text += '5';
                                                    },
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: size.width * 0.01,
                                                ),
                                                SizedBox(
                                                  width: size.width * 0.1,
                                                  height: size.height * 0.08,
                                                  child: NumberButton(
                                                    number: '6',
                                                    size: 10,
                                                    color: Colors.white,
                                                    controller: ai,
                                                    onPressed: () {
                                                      ai.text += '6';
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 20),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                SizedBox(
                                                  width: size.width * 0.1,
                                                  height: size.height * 0.08,
                                                  child: NumberButton(
                                                    number: '1',
                                                    size: 10,
                                                    color: Colors.white,
                                                    controller: ai,
                                                    onPressed: () {
                                                      ai.text += '1';
                                                    },
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: size.width * 0.01,
                                                ),
                                                SizedBox(
                                                  width: size.width * 0.1,
                                                  height: size.height * 0.08,
                                                  child: NumberButton(
                                                    number: '2',
                                                    size: 10,
                                                    color: Colors.white,
                                                    controller: ai,
                                                    onPressed: () {
                                                      ai.text += '2';
                                                    },
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: size.width * 0.01,
                                                ),
                                                SizedBox(
                                                  width: size.width * 0.1,
                                                  height: size.height * 0.08,
                                                  child: NumberButton(
                                                    number: '3',
                                                    size: 10,
                                                    color: Colors.white,
                                                    controller: ai,
                                                    onPressed: () {
                                                      ai.text += '3';
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 20),
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: size.width * 0.1,
                                                  height: size.height * 0.08,
                                                  child: NumberButton(
                                                    number: '00',
                                                    size: 10,
                                                    color: Colors.white,
                                                    controller: ai,
                                                    onPressed: () {
                                                      ai.text += '00';
                                                    },
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: size.width * 0.01,
                                                ),
                                                SizedBox(
                                                  width: size.width * 0.1,
                                                  height: size.height * 0.08,
                                                  child: NumberButton(
                                                    number: '0',
                                                    size: 10,
                                                    color: Colors.white,
                                                    controller: ai,
                                                    onPressed: () {
                                                      ai.text += '0';
                                                    },
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: size.width * 0.01,
                                                ),
                                                SizedBox(
                                                  width: size.width * 0.1,
                                                  height: size.height * 0.08,
                                                  child: NumberButton(
                                                    number: '.',
                                                    size: 10,
                                                    color: Colors.white,
                                                    controller: ai,
                                                    onPressed: () {
                                                      ai.text += '.';
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 20),
                                            // Row(
                                            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            //   children: List.generate(itemUnitPrices.length, (index) => NumberButton1(
                                            //       number: '${itemUnitPrices[index].value}',
                                            //       size: 10,
                                            //       color: Colors.black,
                                            //       controller: ai,
                                            //       name: '${itemUnitPrices[index].name}',
                                            //       price: '${itemUnitPrices[index].price}',
                                            //     ),),
                                            // ),
                                            //ส่วนที่โชว์ ปุ่ม สามปุ่ม
                                            // Wrap(
                                            //   alignment: WrapAlignment.start,
                                            //   children: List.generate(
                                            //       itemUnitPrices.length,
                                            //       (index) => Padding(
                                            //             padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                                            //             child: NumKeyShortcut(
                                            //               number: itemUnitPrices[index].value.toString(),
                                            //               price: itemUnitPrices[index].price.toString(),
                                            //               name: itemUnitPrices[index].name.toString(),
                                            //               controller: controller,
                                            //             ),
                                            //           )),
                                            // ),
                                            SizedBox(height: 4),
                                            // Row(
                                            //   mainAxisAlignment:
                                            //       MainAxisAlignment.center,
                                            //   children: [
                                            //     IconButton(
                                            //       onPressed: () {},
                                            //       icon: Icon(
                                            //         Icons.delete,
                                            //         color: const Color.fromARGB(
                                            //             255, 20, 20, 20),
                                            //       ),
                                            //       iconSize: 10,
                                            //     ),
                                            //   ],
                                            // ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: size.width * 0.01,
                                        ),
                                        Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 10),
                                              child: InkWell(
                                                onTap: () {
                                                  // ตรวจสอบว่ามีตัวอักษรใน TextFormField หรือไม่
                                                  ai.text = ai.text.substring(
                                                      0,
                                                      ai.text.length -
                                                          1); // ลบตัวอักษรที่สุดท้ายออก
                                                },
                                                child: SizedBox(
                                                  width: size.width * 0.08,
                                                  height: size.height * 0.2,
                                                  child: NumberButton(
                                                    number: '<',
                                                    size: 10,
                                                    color: Colors.white,
                                                    controller: ai,
                                                    onPressed: () {
                                                      ai.text = ai.text
                                                          .substring(
                                                              0,
                                                              ai.text.length -
                                                                  1);
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: size.width * 0.08,
                                              height: size.height * 0.2,
                                              child: NumberButton(
                                                number: 'C',
                                                size: 10,
                                                color: Colors.white,
                                                controller: ai,
                                                onPressed: () {
                                                  ai.text = '';
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  height: size.height * 0.08,
                  width: size.width * 0.25,
                  decoration: BoxDecoration(color: Color(0xfffECEFF1)),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      "เงินสด",
                      style: TextStyle(fontSize: 23),
                    ),
                  ),
                ),
                Container(
                  height: size.height * 0.87,
                  width: size.width * 0.25,
                  padding: EdgeInsets.all(8),
                  decoration:
                      BoxDecoration(color: Color.fromARGB(255, 245, 245, 245)),
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "รวม",
                            style: TextStyle(
                              fontFamily: 'IBMPlexSansThai',
                            ),
                          ),
                          Text(
                            '${widget.sumPrice} ฿',
                            style: TextStyle(
                              fontFamily: 'IBMPlexSansThai',
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Color(0xfff78909C),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "ยอดชำระ",
                            style: TextStyle(
                              fontFamily: 'IBMPlexSansThai',
                            ),
                          ),
                          Text(
                            '${widget.sumPrice} ฿',
                            style: TextStyle(
                              fontFamily: 'IBMPlexSansThai',
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "เงินทอน",
                            style: TextStyle(
                              fontFamily: 'IBMPlexSansThai',
                            ),
                          ),
                          Text(
                            '0.00 ฿',
                            style: TextStyle(
                              fontFamily: 'IBMPlexSansThai',
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "รวม",
                            style: TextStyle(
                              color: Colors.red,
                              fontFamily: 'IBMPlexSansThai',
                            ),
                          ),
                          Text(
                            '${widget.sumPrice} ฿',
                            style: TextStyle(
                              color: Colors.red,
                              fontFamily: 'IBMPlexSansThai',
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(color: Color(0xfff78909C)),
                    Container()
                  ]),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class NumberButton extends StatelessWidget {
  final String number;
  final double size;
  final Color color;
  final TextEditingController controller;
  final Function() onPressed;

  const NumberButton({
    Key? key,
    required this.number,
    required this.size,
    required this.color,
    required this.controller,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(size / 2),
          ),
        ),
        onPressed: onPressed,
        child: Center(
          child: Text(
            number.toString(),
            style: const TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25),
          ),
        ),
      ),
    );
  }
}
