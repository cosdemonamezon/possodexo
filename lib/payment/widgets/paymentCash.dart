import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:possodexo/home/homePage.dart';
import 'package:possodexo/home/widgets/OpenAndCloseSwitch.dart';
import 'package:possodexo/payment/widgets/Discount.dart';
import 'package:possodexo/payment/widgets/GiftVoucherwidgets.dart';
import 'package:possodexo/payment/widgets/OtherDiscountsWidgets.dart';
import 'package:possodexo/payment/widgets/Redeempointswidget.dart';

import 'package:possodexo/payment/widgets/numbercel.dart';

class PaymentCash extends StatefulWidget {
  PaymentCash({
    super.key,
    required this.selectedItem,
    // required this.sumPrice,
    // required this.sumQTY
  });
  final List<ItemSelect> selectedItem;
  // final String sumPrice;
  // final String sumQTY;
  String? money;
  @override
  State<PaymentCash> createState() => _PaymentCashState();
}

class _PaymentCashState extends State<PaymentCash> {
  bool checkNum = false;
  TextEditingController ai = TextEditingController();
  bool _isSelected = false;

  int selectedItem = 0;
  void onItemTapped1(int index1) {
    setState(() {
      selectedItem = index1;
    });
  }

  int selectedIndex = 0;
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  bool open = false;
  @override
  void initState() {
    super.initState();
    print(widget.selectedItem);
  }

  void onItemTappeDiscount(int index) {
    setState(() {
      selectedIndex = index;
    });
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
              InkWell(
                onTap: () {
                  onItemTapped1(0);
                },
                child: Container(
                  height: size.height * 0.05,
                  width: size.width * 0.25,
                  decoration: BoxDecoration(
                      color:
                          selectedItem == 0 ? Color(0xff1264E3) : Colors.white,
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
                              child: selectedItem == 0
                                  ? Image.asset(
                                      "assets/icons/Frame (2).png",
                                      scale: 20,
                                    )
                                  : Image.asset(
                                      "assets/icons/Frame.png",
                                      scale: 20,
                                    )),
                          Text(
                            "ส่วนลด",
                            style: TextStyle(
                                color: selectedItem == 0
                                    ? Colors.white
                                    : Color(0xff1264E3)),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.arrow_forward_ios_outlined,
                            size: 15,
                            color: selectedItem == 0
                                ? Colors.white
                                : Color(0xff1264E3)),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                color: Color.fromARGB(15, 0, 0, 0),
                height: size.height * 0.005,
                width: size.width * 0.25,
              ),
              InkWell(
                onTap: () {
                  onItemTapped1(1);
                },
                child: Container(
                  height: size.height * 0.05,
                  width: size.width * 0.25,
                  decoration: BoxDecoration(
                      color:
                          selectedItem == 1 ? Color(0xff1264E3) : Colors.white,
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
                              child: selectedItem == 1
                                  ? Image.asset(
                                      "assets/icons/Barth.png",
                                      scale: 20,
                                    )
                                  : Image.asset(
                                      "assets/icons/Frame (3).png",
                                      scale: 20,
                                    )),
                          Text(
                            "ชำระเงิน",
                            style: TextStyle(
                                color: selectedItem == 1
                                    ? Colors.white
                                    : Color(0xff1264E3)),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.arrow_forward_ios_outlined,
                            size: 15,
                            color: selectedItem == 1
                                ? Colors.white
                                : Color(0xff1264E3)),
                      ),
                    ],
                  ),
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
                          // child: Text("${widget.sumQTY}"),
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
                          // child: Text("${widget.sumPrice} ฿"),
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
                          // child: Text("${widget.sumPrice}฿"),
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
                              child: selectedItem == 0
                                  ? Text(
                                      "ส่วนลด",
                                      style: TextStyle(fontSize: 20),
                                    )
                                  : Text(
                                      "ชำระเงิน",
                                      style: TextStyle(fontSize: 20),
                                    )),
                          SingleChildScrollView(
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.white,
                                  ),
                                  height: size.height * 0.84,
                                  width: size.width * 0.5,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                            child: selectedItem == 1
                                                ? Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                          "เลือกวิธีการชำระเงิน"),
                                                      SizedBox(
                                                        width:
                                                            size.width * 0.23,
                                                      ),
                                                      OpenAndCloseSwitch(
                                                        size: size,
                                                        open: open,
                                                        showTextClose:
                                                            'เเบ่งจ่าย',
                                                        showTextOpen:
                                                            'เเบ่งจ่าย',
                                                        onChanged: (value) {
                                                          setState(() {
                                                            open = value;
                                                            print(open);
                                                          });
                                                        },
                                                      ),
                                                    ],
                                                  )
                                                : Row()),
                                        SizedBox(
                                          height: size.height * 0.01,
                                        ),
                                        SizedBox(
                                            child: selectedItem == 1
                                                ? Column(
                                                    children: [
                                                      open == true
                                                          ? SplitPayment()
                                                          : Column(
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    InkWell(
                                                                      onTap:
                                                                          () {
                                                                        onItemTapped(
                                                                            0);
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        decoration: BoxDecoration(
                                                                            color: selectedIndex == 0
                                                                                ? Color(0xfffE8EAF6)
                                                                                : Colors.white,
                                                                            border: Border.all(color: Color(0xff1264E3)),
                                                                            borderRadius: BorderRadius.circular(8)),
                                                                        height: size.height *
                                                                            0.05,
                                                                        width: size.width *
                                                                            0.11,
                                                                        child:
                                                                            Row(
                                                                          children: [
                                                                            Padding(
                                                                              padding: const EdgeInsets.only(left: 10),
                                                                              child: Image.asset("assets/icons/cash.png", scale: 20),
                                                                            ),
                                                                            Padding(
                                                                              padding: const EdgeInsets.only(left: 10),
                                                                              child: Text("เงินสด"),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      width: size
                                                                              .width *
                                                                          0.01,
                                                                    ),
                                                                    InkWell(
                                                                      onTap:
                                                                          () {
                                                                        onItemTapped(
                                                                            1);
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        decoration: BoxDecoration(
                                                                            color: selectedIndex == 1
                                                                                ? Color(0xfffE8EAF6)
                                                                                : Colors.white,
                                                                            border: Border.all(color: Color(0xff1264E3)),
                                                                            borderRadius: BorderRadius.circular(8)),
                                                                        height: size.height *
                                                                            0.05,
                                                                        width: size.width *
                                                                            0.11,
                                                                        child:
                                                                            Row(
                                                                          children: [
                                                                            Padding(
                                                                              padding: const EdgeInsets.only(left: 5),
                                                                              child: Image.asset("assets/icons/Promptpay.png", scale: 20),
                                                                            ),
                                                                            Padding(
                                                                              padding: const EdgeInsets.only(left: 5),
                                                                              child: Text("QR Promptpay"),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      width: size
                                                                              .width *
                                                                          0.01,
                                                                    ),
                                                                    InkWell(
                                                                      onTap:
                                                                          () {
                                                                        onItemTapped(
                                                                            2);
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        decoration: BoxDecoration(
                                                                            color: selectedIndex == 2
                                                                                ? Color(0xfffE8EAF6)
                                                                                : Colors.white,
                                                                            border: Border.all(color: Color(0xff1264E3)),
                                                                            borderRadius: BorderRadius.circular(8)),
                                                                        height: size.height *
                                                                            0.05,
                                                                        width: size.width *
                                                                            0.11,
                                                                        child:
                                                                            Row(
                                                                          children: [
                                                                            Padding(
                                                                              padding: const EdgeInsets.only(left: 10),
                                                                              child: Image.asset("assets/icons/TrueMoney.png", scale: 20),
                                                                            ),
                                                                            Padding(
                                                                              padding: const EdgeInsets.only(left: 10),
                                                                              child: Text("True Money"),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      width: size
                                                                              .width *
                                                                          0.01,
                                                                    ),
                                                                    InkWell(
                                                                      onTap:
                                                                          () {
                                                                        onItemTapped(
                                                                            3);
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        decoration: BoxDecoration(
                                                                            color: selectedIndex == 3
                                                                                ? Color(0xfffE8EAF6)
                                                                                : Colors.white,
                                                                            border: Border.all(color: Color(0xff1264E3)),
                                                                            borderRadius: BorderRadius.circular(8)),
                                                                        height: size.height *
                                                                            0.05,
                                                                        width: size.width *
                                                                            0.11,
                                                                        child:
                                                                            Row(
                                                                          children: [
                                                                            Padding(
                                                                              padding: const EdgeInsets.only(left: 10),
                                                                              child: Image.asset("assets/icons/MaeManee.png", scale: 20),
                                                                            ),
                                                                            Padding(
                                                                              padding: const EdgeInsets.only(left: 10),
                                                                              child: Text("แม่มณี"),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height:
                                                                      size.height *
                                                                          0.01,
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    InkWell(
                                                                      onTap:
                                                                          () {
                                                                        onItemTapped(
                                                                            4);
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        decoration: BoxDecoration(
                                                                            color: selectedIndex == 4
                                                                                ? Color(0xfffE8EAF6)
                                                                                : Colors.white,
                                                                            border: Border.all(color: Color(0xff1264E3)),
                                                                            borderRadius: BorderRadius.circular(8)),
                                                                        height: size.height *
                                                                            0.05,
                                                                        width: size.width *
                                                                            0.11,
                                                                        child:
                                                                            Row(
                                                                          children: [
                                                                            Padding(
                                                                              padding: const EdgeInsets.only(left: 10),
                                                                              child: Image.asset("assets/icons/Linepay.png", scale: 20),
                                                                            ),
                                                                            Padding(
                                                                              padding: const EdgeInsets.only(left: 10),
                                                                              child: Text("LINE Pay"),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      width: size
                                                                              .width *
                                                                          0.01,
                                                                    ),
                                                                    InkWell(
                                                                      onTap:
                                                                          () {
                                                                        onItemTapped(
                                                                            5);
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        decoration: BoxDecoration(
                                                                            color: selectedIndex == 5
                                                                                ? Color(0xfffE8EAF6)
                                                                                : Colors.white,
                                                                            border: Border.all(color: Color(0xff1264E3)),
                                                                            borderRadius: BorderRadius.circular(8)),
                                                                        height: size.height *
                                                                            0.05,
                                                                        width: size.width *
                                                                            0.11,
                                                                        child:
                                                                            Row(
                                                                          children: [
                                                                            Padding(
                                                                              padding: const EdgeInsets.only(left: 5),
                                                                              child: Image.asset("assets/icons/moneyCard.png", scale: 20),
                                                                            ),
                                                                            Padding(
                                                                              padding: const EdgeInsets.only(left: 5),
                                                                              child: Text("บัตรเครดิต/เดบิต"),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      width: size
                                                                              .width *
                                                                          0.01,
                                                                    ),
                                                                    InkWell(
                                                                      onTap:
                                                                          () {
                                                                        onItemTapped(
                                                                            6);
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        decoration: BoxDecoration(
                                                                            color: selectedIndex == 6
                                                                                ? Color(0xfffE8EAF6)
                                                                                : Colors.white,
                                                                            border: Border.all(color: Color(0xff1264E3)),
                                                                            borderRadius: BorderRadius.circular(8)),
                                                                        height: size.height *
                                                                            0.05,
                                                                        width: size.width *
                                                                            0.11,
                                                                        child:
                                                                            Row(
                                                                          children: [
                                                                            Padding(
                                                                              padding: const EdgeInsets.only(left: 10),
                                                                              child: Image.asset("assets/icons/MaeManee.png", scale: 20),
                                                                            ),
                                                                            Padding(
                                                                              padding: const EdgeInsets.only(left: 10),
                                                                              child: Text("แม่มณี"),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      width: size
                                                                              .width *
                                                                          0.01,
                                                                    ),
                                                                    InkWell(
                                                                      onTap:
                                                                          () {
                                                                        onItemTapped(
                                                                            7);
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        decoration: BoxDecoration(
                                                                            color: selectedIndex == 7
                                                                                ? Color(0xfffE8EAF6)
                                                                                : Colors.white,
                                                                            border: Border.all(color: Color(0xff1264E3)),
                                                                            borderRadius: BorderRadius.circular(8)),
                                                                        height: size.height *
                                                                            0.05,
                                                                        width: size.width *
                                                                            0.11,
                                                                        child:
                                                                            Row(
                                                                          children: [
                                                                            Padding(
                                                                              padding: const EdgeInsets.only(left: 10),
                                                                              child: Image.asset("assets/icons/EmCard.png", scale: 20),
                                                                            ),
                                                                            Padding(
                                                                              padding: const EdgeInsets.only(left: 10),
                                                                              child: Text("บัตรพนักงาน"),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height:
                                                                      size.height *
                                                                          0.01,
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    InkWell(
                                                                      onTap:
                                                                          () {
                                                                        onItemTapped(
                                                                            8);
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        decoration: BoxDecoration(
                                                                            color: selectedIndex == 8
                                                                                ? Color(0xfffE8EAF6)
                                                                                : Colors.white,
                                                                            border: Border.all(color: Color(0xff1264E3)),
                                                                            borderRadius: BorderRadius.circular(8)),
                                                                        height: size.height *
                                                                            0.05,
                                                                        width: size.width *
                                                                            0.11,
                                                                        child:
                                                                            Row(
                                                                          children: [
                                                                            Padding(
                                                                              padding: const EdgeInsets.only(left: 10),
                                                                              child: Image.asset("assets/icons/Wechart.png", scale: 20),
                                                                            ),
                                                                            Padding(
                                                                              padding: const EdgeInsets.only(left: 10),
                                                                              child: Text("We Chart"),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      width: size
                                                                              .width *
                                                                          0.01,
                                                                    ),
                                                                    InkWell(
                                                                      onTap:
                                                                          () {
                                                                        onItemTapped(
                                                                            9);
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        decoration: BoxDecoration(
                                                                            color: selectedIndex == 9
                                                                                ? Color(0xfffE8EAF6)
                                                                                : Colors.white,
                                                                            border: Border.all(color: Color(0xff1264E3)),
                                                                            borderRadius: BorderRadius.circular(8)),
                                                                        height: size.height *
                                                                            0.05,
                                                                        width: size.width *
                                                                            0.11,
                                                                        child:
                                                                            Row(
                                                                          children: [
                                                                            Padding(
                                                                              padding: const EdgeInsets.only(left: 5),
                                                                              child: Image.asset("assets/icons/Alipay.png", scale: 20),
                                                                            ),
                                                                            Padding(
                                                                              padding: const EdgeInsets.only(left: 5),
                                                                              child: Text("Alipay"),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      width: size
                                                                              .width *
                                                                          0.01,
                                                                    ),
                                                                    InkWell(
                                                                      onTap:
                                                                          () {
                                                                        onItemTapped(
                                                                            10);
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        decoration: BoxDecoration(
                                                                            color: selectedIndex == 10
                                                                                ? Color(0xfffE8EAF6)
                                                                                : Colors.white,
                                                                            border: Border.all(color: Color(0xff1264E3)),
                                                                            borderRadius: BorderRadius.circular(8)),
                                                                        height: size.height *
                                                                            0.05,
                                                                        width: size.width *
                                                                            0.11,
                                                                        child:
                                                                            Row(
                                                                          children: [
                                                                            Padding(
                                                                              padding: const EdgeInsets.only(left: 10),
                                                                              child: Image.asset("assets/icons/Wallet.png", scale: 20),
                                                                            ),
                                                                            Padding(
                                                                              padding: const EdgeInsets.only(left: 10),
                                                                              child: Text("อื่นๆ"),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height:
                                                                      size.height *
                                                                          0.01,
                                                                ),
                                                                Numbercel(),
                                                              ],
                                                            ),
                                                    ],
                                                  )
                                                : Column(
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          InkWell(
                                                              onTap: () {
                                                                onItemTappeDiscount(
                                                                    0);
                                                              },
                                                              child: selectedIndex ==
                                                                      0
                                                                  ? Container(
                                                                      width: size
                                                                              .width *
                                                                          0.12,
                                                                      height: size
                                                                              .height *
                                                                          0.05,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        border: Border(
                                                                            bottom:
                                                                                BorderSide(color: Color(0xFF1264E3))),
                                                                      ),
                                                                      child:
                                                                          Text(
                                                                        'ส่วนลด',
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                20,
                                                                            color:
                                                                                Color(0xFF1264E3)),
                                                                      ),
                                                                    )
                                                                  : Container(
                                                                      width: size
                                                                              .width *
                                                                          0.12,
                                                                      height: size
                                                                              .height *
                                                                          0.05,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        border: Border(
                                                                            bottom:
                                                                                BorderSide(color: Color(0xFFB0BEC5))),
                                                                      ),
                                                                      child:
                                                                          Text(
                                                                        'ส่วนลด',
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                20,
                                                                            color:
                                                                                Color(0xFF424242)),
                                                                      ),
                                                                    )),
                                                          InkWell(
                                                            onTap: () {
                                                              onItemTappeDiscount(
                                                                  1);
                                                            },
                                                            child:
                                                                selectedIndex ==
                                                                        1
                                                                    ? Container(
                                                                        width: size.width *
                                                                            0.12,
                                                                        height: size.height *
                                                                            0.05,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          border:
                                                                              Border(bottom: BorderSide(color: Color(0xFF1264E3))),
                                                                        ),
                                                                        child:
                                                                            Text(
                                                                          'Gift Voucher',
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: TextStyle(
                                                                              fontSize: 20,
                                                                              color: Color(0xFF1264E3)),
                                                                        ),
                                                                      )
                                                                    : Container(
                                                                        width: size.width *
                                                                            0.12,
                                                                        height: size.height *
                                                                            0.05,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          border:
                                                                              Border(bottom: BorderSide(color: Color(0xFFB0BEC5))),
                                                                        ),
                                                                        child:
                                                                            Text(
                                                                          'Gift Voucher',
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: TextStyle(
                                                                              fontSize: 20,
                                                                              color: Color(0xFF424242)),
                                                                        ),
                                                                      ),
                                                          ),
                                                          InkWell(
                                                            onTap: () {
                                                              onItemTappeDiscount(
                                                                  2);
                                                            },
                                                            child:
                                                                selectedIndex ==
                                                                        2
                                                                    ? Container(
                                                                        width: size.width *
                                                                            0.12,
                                                                        height: size.height *
                                                                            0.05,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          border:
                                                                              Border(bottom: BorderSide(color: Color(0xFF1264E3))),
                                                                        ),
                                                                        child:
                                                                            Text(
                                                                          'แลกคะแนน',
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: TextStyle(
                                                                              fontSize: 20,
                                                                              color: Color(0xFF1264E3)),
                                                                        ),
                                                                      )
                                                                    : Container(
                                                                        width: size.width *
                                                                            0.12,
                                                                        height: size.height *
                                                                            0.05,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          border:
                                                                              Border(bottom: BorderSide(color: Color(0xFFB0BEC5))),
                                                                        ),
                                                                        child:
                                                                            Text(
                                                                          'แลกคะแนน',
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: TextStyle(
                                                                              fontSize: 20,
                                                                              color: Color(0xFF424242)),
                                                                        ),
                                                                      ),
                                                          ),
                                                          InkWell(
                                                              onTap: () {
                                                                onItemTappeDiscount(
                                                                    3);
                                                              },
                                                              child: selectedIndex ==
                                                                      3
                                                                  ? Container(
                                                                      width: size
                                                                              .width *
                                                                          0.12,
                                                                      height: size
                                                                              .height *
                                                                          0.05,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        border: Border(
                                                                            bottom:
                                                                                BorderSide(color: Color(0xFF1264E3))),
                                                                      ),
                                                                      child:
                                                                          Text(
                                                                        'ส่วนลดอื่นๆ',
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                20,
                                                                            color:
                                                                                Color(0xFF1264E3)),
                                                                      ),
                                                                    )
                                                                  : Container(
                                                                      width: size
                                                                              .width *
                                                                          0.12,
                                                                      height: size
                                                                              .height *
                                                                          0.05,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        border: Border(
                                                                            bottom:
                                                                                BorderSide(color: Color(0xFFB0BEC5))),
                                                                      ),
                                                                      child:
                                                                          Text(
                                                                        'ส่วนลดอื่นๆ',
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                20,
                                                                            color:
                                                                                Color(0xFF424242)),
                                                                      ),
                                                                    )),
                                                        ],
                                                      ),
                                                      selectedIndex == 0
                                                          ? DiscountWidgets()
                                                          : selectedIndex == 1
                                                              ? GiftVoucherwidgets()
                                                              : selectedIndex ==
                                                                      2
                                                                  ? Redeempointswidget()
                                                                  : selectedIndex ==
                                                                          3
                                                                      ? OtherDiscountsWidgets()
                                                                      : SizedBox(),
                                                    ],
                                                  )),
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
                  ],
                ),
              ),
            ),
            selectedItem == 1
                ? Column(
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
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 245, 245, 245)),
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
                                // Text(
                                //   '${widget.sumPrice} ฿',
                                //   style: TextStyle(
                                //     fontFamily: 'IBMPlexSansThai',
                                //   ),
                                // ),
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
                                // Text(
                                //   '${widget.sumPrice} ฿',
                                //   style: TextStyle(
                                //     fontFamily: 'IBMPlexSansThai',
                                //   ),
                                // ),
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
                                // Text(
                                //   '${widget.sumPrice} ฿',
                                //   style: TextStyle(
                                //     color: Colors.red,
                                //     fontFamily: 'IBMPlexSansThai',
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                          Divider(color: Color(0xfff78909C)),
                          SizedBox(
                            height: size.height * 0.5,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Color(0xff4CAF50)),
                            height: size.height * 0.095,
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  "ยืนยันชำระเงิน",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ]),
                      ),
                    ],
                  )
                : Column(
                    children: [],
                  )
          ],
        ),
      ),
    );
  }
}

class SplitPayment extends StatefulWidget {
  const SplitPayment({super.key});

  @override
  State<SplitPayment> createState() => _SplitPaymentState();
}

class _SplitPaymentState extends State<SplitPayment> {
  String money = "เงินสด";
  List<String> general2 = [
    "เงินสด",
    "บัตรเครดิต/เดบิต",
    "QR Promptpay",
    "True Money",
    "LINE Pay",
    "Transfer",
    "Consignment",
    "บัตรพนักงาน  ",
    "แม่มณี",
    "อื่นๆ"
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    TextEditingController ai = TextEditingController();
    return Column(children: [
      SizedBox(
        height: size.height * 0.001,
      ),
      SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: size.height * 0.1,
              width: size.width * 0.13,
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey)),
                  borderRadius: BorderRadius.circular(2),
                  color: Color(0xFFFFFAFAFA)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Opacity(
                    opacity: 0.5,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5, top: 3),
                      child: Text(
                        'วิธีการชำระเงิน',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'IBMPlexSansThai',
                        ),
                      ),
                    ),
                  ),
                  DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      items: general2
                          .map((String item) => DropdownMenuItem<String>(
                                value: item,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 1.0),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ))
                          .toList(),
                      value: money,
                      onChanged: (v) {
                        setState(() {
                          money = v!;
                        });
                      },
                      underline: SizedBox(),
                      dropdownColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: size.height * 0.1,
              width: size.width * 0.13,
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey)),
                  borderRadius: BorderRadius.circular(2),
                  color: Color(0xFFFFFAFAFA)),
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Opacity(
                          opacity: 0.5,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 3),
                            child: Text(
                              'วิธีการชำระเงิน',
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'IBMPlexSansThai',
                              ),
                            ),
                          ),
                        ),
                        Text(
                          "฿",
                          style: TextStyle(fontSize: 25),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: SizedBox(
                        width: 0.01,
                        child: TextFormField(
                          controller: ai,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                          validator: (selectedItem) {
                            if (selectedItem == '') {}
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: size.height * 0.1,
              width: size.width * 0.13,
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey)),
                  borderRadius: BorderRadius.circular(2),
                  color: Color(0xFFFFFAFAFA)),
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Opacity(
                          opacity: 0.5,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 3),
                            child: Text(
                              'หมายเหตุ',
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'IBMPlexSansThai',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: SizedBox(
                        width: size.width * 0.01,
                        child: TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                          validator: (selectedItem) {
                            if (selectedItem == '') {}
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        height: size.height * 0.02,
      ),
      Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff1264E3)),
                  borderRadius: BorderRadius.circular(8)),
              height: size.height * 0.05,
              width: size.width * 0.1,
              child: Padding(
                padding: const EdgeInsets.only(left: 25, top: 5),
                child: Text(
                  "ชำระทั้งหมด",
                  style: TextStyle(color: Color(0xff1264E3)),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Color(0xff1264E3)),
                    borderRadius: BorderRadius.circular(8)),
                height: size.height * 0.05,
                width: size.width * 0.14,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 15,
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/icons/PlusCircle.png",
                        scale: 20,
                      ),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      Text(
                        "เพิ่มวิธีการชำระเงิน",
                        style: TextStyle(color: Color(0xff1264E3)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      SizedBox(
        height: 10,
      ),
      Container(
        margin: const EdgeInsets.only(left: 1, right: 1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                SizedBox(height: 4),
              ],
            ),
            SizedBox(
              width: size.width * 0.01,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: InkWell(
                    onTap: () {
                      // ตรวจสอบว่ามีตัวอักษรใน TextFormField หรือไม่
                      ai.text = ai.text.substring(
                          0, ai.text.length - 1); // ลบตัวอักษรที่สุดท้ายออก
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
                          if (ai.text.isNotEmpty) {
                            ai.text = ai.text.substring(0, ai.text.length - 1);
                          }
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
      ),
    ]);
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
