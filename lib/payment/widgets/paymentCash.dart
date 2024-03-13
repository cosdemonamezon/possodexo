import 'dart:developer';

import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:possodexo/home/homePage.dart';
import 'package:possodexo/home/widgets/OpenAndCloseSwitch.dart';
import 'package:possodexo/models/product.dart';
import 'package:possodexo/payment/widgets/Addpayment.dart';
import 'package:possodexo/payment/widgets/Discount.dart';
import 'package:possodexo/payment/widgets/GiftVoucherwidgets.dart';
import 'package:possodexo/payment/widgets/OtherDiscountsWidgets.dart';
import 'package:possodexo/payment/widgets/Proceedpayment.dart';
import 'package:possodexo/payment/widgets/Proceedsplitpayments.dart';
import 'package:possodexo/payment/widgets/Redeempointswidget.dart';

import 'package:possodexo/payment/widgets/numbercel.dart';
import 'package:possodexo/payment/widgets/paymentmedtod.dart';

class PaymentCash extends StatefulWidget {
  PaymentCash({super.key, required this.selectedItem, required this.sumPrice, required this.sumQTY});
  final List<ItemSelect> selectedItem;
  final String sumPrice;
  final String sumQTY;
  String? money;
  @override
  State<PaymentCash> createState() => _PaymentCashState();
}

class _PaymentCashState extends State<PaymentCash> {
  bool checkNum = false;
  int? sizeprice;
  TextEditingController ai = TextEditingController();
  bool _isSelected = false;
  int priceDiscount = 0;
  int priceVoucher = 0;
  int priceotherDiscount = 0;
  int Points = 0;
  int Price = 0;
  int priceDiscountPercen = 0;
  String? from = 'discount';

  int selectedItem = 0;
  int totalPrice = 0;
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
                        style: TextStyle(color: Colors.white, fontFamily: 'IBMPlexSansThai', fontSize: 16),
                      )
                    ],
                  ),
                ),
              ),

              /// โชราคาที่มาจากหน้า homepage////
              Container(
                height: size.height * 0.46,
                width: size.width * 0.25,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(color: Colors.white),
                child: Column(
                  children: [
                    Container(
                        color: Color(0xffE8EAF6),
                        width: size.width * 0.5,
                        height: size.height * 0.06,
                        child: InkWell(
                            onTap: () {
                              setState(() {
                                // selectedItem2.clear();
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Order #20240214001"),
                                ),
                                SizedBox(
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(Icons.cancel),
                                      ),
                                      Text("ลบบิล")
                                    ],
                                  ),
                                ),
                              ],
                            ))),
                  ],
                ),
                // child: ListView.builder(
                //   itemCount: widget.selectedItem.length,
                //   itemBuilder: (context, index) {
                //     return Column(
                //       children: [
                //         Row(
                //           children: [
                //             Text("${widget.selectedItem[index].name}"),
                //             Text(" X ${widget.selectedItem[index].qty}"),
                //             SizedBox(
                //               width: 10,
                //             ),
                //           ],
                //         ),
                //         Row(
                //           children: [
                //             Text('ขนาด'),
                //             SizedBox(
                //               width: size.width * 0.01,
                //             ),
                //             Text(widget.selectedItem[index].size == 0
                //                 ? 'S'
                //                 : widget.selectedItem[index].size == 1
                //                     ? 'M'
                //                     : "L")
                //           ],
                //         ),
                //         Row(
                //           children: [
                //             Text('โปรโมชั่น'),
                //           ],
                //         ),
                //         Row(
                //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //           children: [
                //             Text(
                //               widget.selectedItem[index].size == 0
                //                   ? widget.selectedItem[index].priceS!.toStringAsFixed(2)
                //                   : widget.selectedItem[index].size == 1
                //                       ? widget.selectedItem[index].priceM!.toStringAsFixed(2)
                //                       : widget.selectedItem[index].priceL!.toStringAsFixed(2),
                //             ),
                //             widget.selectedItem[index].priceQTY == 0
                //                 ? Text(
                //                     widget.selectedItem[index].priceS!.toStringAsFixed(2),
                //                     style: TextStyle(fontWeight: FontWeight.bold),
                //                   )
                //                 : Text(
                //                     widget.selectedItem[index].priceQTY!.toStringAsFixed(2),
                //                     style: TextStyle(fontWeight: FontWeight.bold),
                //                   ),
                //           ],
                //         ),
                //       ],
                //     );
                //   },
                // )
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
                      color: selectedItem == 1 ? Color(0xff1264E3) : Colors.white,
                      border: Border(bottom: BorderSide(color: Color.fromARGB(255, 228, 226, 226)))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: selectedItem == 1
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
                            style: TextStyle(color: selectedItem == 1 ? Colors.white : Color(0xff1264E3)),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.arrow_forward_ios_outlined, size: 15, color: selectedItem == 1 ? Colors.white : Color(0xff1264E3)),
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
                  onItemTapped1(0);
                },
                child: Container(
                  height: size.height * 0.05,
                  width: size.width * 0.25,
                  decoration: BoxDecoration(
                      color: selectedItem == 0 ? Color(0xff1264E3) : Colors.white,
                      border: Border(bottom: BorderSide(color: Color.fromARGB(255, 228, 226, 226)))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: selectedItem == 0
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
                            style: TextStyle(color: selectedItem == 0 ? Colors.white : Color(0xff1264E3)),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.arrow_forward_ios_outlined, size: 15, color: selectedItem == 0 ? Colors.white : Color(0xff1264E3)),
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
                          child: Text("1,000"),
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
                      decoration: BoxDecoration(color: Color.fromARGB(255, 228, 226, 226)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: selectedItem == 0
                                  ? Text(
                                      "ชำระเงิน",
                                      style: TextStyle(fontSize: 20),
                                    )
                                  : Text(
                                      "ส่วนลด",
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
                                  height: size.height * 0.86,
                                  width: size.width * 0.5,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                            child: selectedItem == 0
                                                ? Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text("เลือกวิธีการชำระเงิน"),
                                                      SizedBox(
                                                        width: size.width * 0.23,
                                                      ),
                                                      OpenAndCloseSwitch(
                                                        size: size,
                                                        open: open,
                                                        showTextClose: 'เเบ่งจ่าย',
                                                        showTextOpen: 'เเบ่งจ่าย',
                                                        onChanged: (value) {
                                                          setState(() {
                                                            open = value;
                                                          });
                                                        },
                                                      ),
                                                    ],
                                                  )
                                                : Row(
                                                    // children: [Text("kub")],
                                                    )),
                                        SizedBox(
                                          height: size.height * 0.01,
                                        ),
                                        SizedBox(
                                            child: selectedItem == 0
                                                ? Column(
                                                    children: [
                                                      open == true
                                                          ? Addpayment(
                                                              size: size,
                                                              money: money,
                                                              general2: general2,
                                                              seclecpayment: (value) {
                                                                setState(() {
                                                                  money = value!;
                                                                });
                                                              },
                                                            )
                                                          : Column(
                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                Container(height: size.height * 0.18, child: PaymentMethod()),
                                                                Row(
                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      'ยอดชำระ',
                                                                      style: TextStyle(color: Color(0xFF424242), fontSize: 16),
                                                                    ),
                                                                    Text(
                                                                      'ชำระทั้งหมด',
                                                                      style: TextStyle(color: Color(0xFF1264E3), fontSize: 16),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Numbercel(
                                                                  ai: ai,
                                                                ),
                                                              ],
                                                            ),
                                                    ],
                                                  )
                                                : Column(
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          InkWell(
                                                              onTap: () {
                                                                onItemTappeDiscount(0);
                                                              },
                                                              child: selectedIndex == 0
                                                                  ? Container(
                                                                      width: size.width * 0.12,
                                                                      height: size.height * 0.05,
                                                                      decoration: BoxDecoration(
                                                                        border: Border(bottom: BorderSide(color: Color(0xFF1264E3))),
                                                                      ),
                                                                      child: Text(
                                                                        'ส่วนลด',
                                                                        textAlign: TextAlign.center,
                                                                        style: TextStyle(fontSize: 20, color: Color(0xFF1264E3)),
                                                                      ),
                                                                    )
                                                                  : Container(
                                                                      width: size.width * 0.12,
                                                                      height: size.height * 0.05,
                                                                      decoration: BoxDecoration(
                                                                        border: Border(bottom: BorderSide(color: Color(0xFFB0BEC5))),
                                                                      ),
                                                                      child: Text(
                                                                        'ส่วนลด',
                                                                        textAlign: TextAlign.center,
                                                                        style: TextStyle(fontSize: 20, color: Color(0xFF424242)),
                                                                      ),
                                                                    )),
                                                          InkWell(
                                                            onTap: () {
                                                              onItemTappeDiscount(1);
                                                            },
                                                            child: selectedIndex == 1
                                                                ? Container(
                                                                    width: size.width * 0.12,
                                                                    height: size.height * 0.05,
                                                                    decoration: BoxDecoration(
                                                                      border: Border(bottom: BorderSide(color: Color(0xFF1264E3))),
                                                                    ),
                                                                    child: Text(
                                                                      'Gift Voucher',
                                                                      textAlign: TextAlign.center,
                                                                      style: TextStyle(fontSize: 20, color: Color(0xFF1264E3)),
                                                                    ),
                                                                  )
                                                                : Container(
                                                                    width: size.width * 0.12,
                                                                    height: size.height * 0.05,
                                                                    decoration: BoxDecoration(
                                                                      border: Border(bottom: BorderSide(color: Color(0xFFB0BEC5))),
                                                                    ),
                                                                    child: Text(
                                                                      'Gift Voucher',
                                                                      textAlign: TextAlign.center,
                                                                      style: TextStyle(fontSize: 20, color: Color(0xFF424242)),
                                                                    ),
                                                                  ),
                                                          ),
                                                          InkWell(
                                                            onTap: () {
                                                              onItemTappeDiscount(2);
                                                            },
                                                            child: selectedIndex == 2
                                                                ? Container(
                                                                    width: size.width * 0.12,
                                                                    height: size.height * 0.05,
                                                                    decoration: BoxDecoration(
                                                                      border: Border(bottom: BorderSide(color: Color(0xFF1264E3))),
                                                                    ),
                                                                    child: Text(
                                                                      'แลกคะแนน',
                                                                      textAlign: TextAlign.center,
                                                                      style: TextStyle(fontSize: 20, color: Color(0xFF1264E3)),
                                                                    ),
                                                                  )
                                                                : Container(
                                                                    width: size.width * 0.12,
                                                                    height: size.height * 0.05,
                                                                    decoration: BoxDecoration(
                                                                      border: Border(bottom: BorderSide(color: Color(0xFFB0BEC5))),
                                                                    ),
                                                                    child: Text(
                                                                      'แลกคะแนน',
                                                                      textAlign: TextAlign.center,
                                                                      style: TextStyle(fontSize: 20, color: Color(0xFF424242)),
                                                                    ),
                                                                  ),
                                                          ),
                                                          InkWell(
                                                              onTap: () {
                                                                onItemTappeDiscount(3);
                                                              },
                                                              child: selectedIndex == 3
                                                                  ? Container(
                                                                      width: size.width * 0.12,
                                                                      height: size.height * 0.05,
                                                                      decoration: BoxDecoration(
                                                                        border: Border(bottom: BorderSide(color: Color(0xFF1264E3))),
                                                                      ),
                                                                      child: Text(
                                                                        'ส่วนลดอื่นๆ',
                                                                        textAlign: TextAlign.center,
                                                                        style: TextStyle(fontSize: 20, color: Color(0xFF1264E3)),
                                                                      ),
                                                                    )
                                                                  : Container(
                                                                      width: size.width * 0.12,
                                                                      height: size.height * 0.05,
                                                                      decoration: BoxDecoration(
                                                                        border: Border(bottom: BorderSide(color: Color(0xFFB0BEC5))),
                                                                      ),
                                                                      child: Text(
                                                                        'ส่วนลดอื่นๆ',
                                                                        textAlign: TextAlign.center,
                                                                        style: TextStyle(fontSize: 20, color: Color(0xFF424242)),
                                                                      ),
                                                                    )),
                                                        ],
                                                      ),
                                                      selectedIndex == 0
                                                          ? DiscountWidgets(
                                                              from: (value) => {setState(() => from = value)},
                                                              discount: (value) => {
                                                                setState(() {
                                                                  if (from == 'discount') {
                                                                    priceDiscount = int.parse(value);
                                                                  } else {
                                                                    priceDiscountPercen = int.parse(value);
                                                                  }
                                                                })
                                                              },
                                                            )
                                                          : selectedIndex == 1
                                                              ? GiftVoucherwidgets(
                                                                  voucher: (value) {
                                                                    inspect(value);
                                                                    if (value != '') {
                                                                      setState(() {
                                                                        priceVoucher = int.parse(value);
                                                                      });
                                                                    }
                                                                  },
                                                                )
                                                              : selectedIndex == 2
                                                                  ? Redeempointswidget(
                                                                      redeem: (p0) {
                                                                        RegExp regex =
                                                                            RegExp(r"(\d{1,3}(,\d{3})*)\s*คะแนน.*?(\d{1,3}(,\d{3})*)\s*บาท");

                                                                        Match? match = regex.firstMatch(p0);
                                                                        if (match != null) {
                                                                          Points = int.parse(match.group(1)!.replaceAll(',', ''));
                                                                          Price = int.parse(match.group(3)!.replaceAll(',', ''));
                                                                          log(Points.toString());
                                                                          setState(() {});
                                                                        }
                                                                      },
                                                                    )
                                                                  : selectedIndex == 3
                                                                      ? OtherDiscountsWidgets(
                                                                          otherDiscount: (value) {
                                                                            inspect(value);
                                                                            if (value != '') {
                                                                              setState(() {
                                                                                priceotherDiscount = int.parse(value);
                                                                              });
                                                                            }
                                                                          },
                                                                        )
                                                                      : SizedBox.shrink(),
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
            selectedItem == 0
                ? open == true
                    ? Column(
                        children: [
                          Column(
                            children: [
                              Container(
                                height: size.height * 0.08,
                                width: size.width * 0.25,
                                decoration: BoxDecoration(color: Color(0xfffECEFF1)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    "แบ่งจ่าย",
                                    style: TextStyle(fontSize: 23),
                                  ),
                                ),
                              ),
                              Container(
                                height: size.height * 0.87,
                                width: size.width * 0.25,
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(color: Color.fromARGB(255, 245, 245, 245)),
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
                                  SizedBox(
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => Proceedsplitpayments()));
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Color(0xff4CAF50)),
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
                                    ),
                                  ),
                                ]),
                              ),
                            ],
                          ),
                        ],
                      )
                    : Column(
                        children: [
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
                                decoration: BoxDecoration(color: Color.fromARGB(255, 245, 245, 245)),
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
                                  SizedBox(
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => Proceedpayment()));
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Color(0xff4CAF50)),
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
                                    ),
                                  ),
                                ]),
                              ),
                            ],
                          ),
                        ],
                      )
                : Column(
                    children: [
                      Container(
                        height: size.height * 0.1,
                        width: size.width * 0.245,
                        decoration: BoxDecoration(
                            color: Color(0xfffECEFF1),
                            border: Border(
                              bottom: BorderSide(
                                color: Color(0xFFB0BEC5),
                              ),
                            )),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            children: [
                              Container(
                                width: size.width * 0.10,
                                child: Text(
                                  "รายการส่วนลด",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() => priceDiscount = 0);
                                  setState(() => priceDiscountPercen = 0);
                                  setState(() => priceVoucher = 0);
                                  setState(() => Price = 0);
                                  setState(() => priceotherDiscount = 0);
                                },
                                child: Container(
                                  child: Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            setState(() => priceDiscount = 0);
                                            setState(() => priceDiscountPercen = 0);
                                            setState(() => priceVoucher = 0);
                                            setState(() => Price = 0);
                                            setState(() => priceotherDiscount = 0);
                                          },
                                          icon: Icon(
                                            Icons.highlight_remove_sharp,
                                            size: 15,
                                            color: Color(0xFF616161),
                                          )),
                                      Text('ล้างข้อมูลทั้งหมด')
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Text(
                            'ส่วนลด',
                            style: TextStyle(fontSize: 20, color: Color(0xFF1264E3)),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: size.width * 0.1,
                                child: Text(
                                  'จำนวนเงิน',
                                  style: TextStyle(
                                      color: Color(
                                        0xFF424242,
                                      ),
                                      fontSize: 16),
                                ),
                              ),
                              Container(
                                width: size.width * 0.1,
                                child: Text(
                                  textAlign: TextAlign.end,
                                  NumberFormat('#,##0.00', 'en_US').format(priceDiscount),
                                  style: TextStyle(
                                      color: Color(
                                        0xFF424242,
                                      ),
                                      fontSize: 20),
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    setState(() => priceDiscount = 0);
                                  },
                                  icon: Icon(
                                    Icons.highlight_remove_sharp,
                                    size: 15,
                                    color: Color(0xFF616161),
                                  )),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: size.width * 0.1,
                                child: Text(
                                  'เปอร์เซ็น  5 %',
                                  style: TextStyle(
                                      color: Color(
                                        0xFF424242,
                                      ),
                                      fontSize: 16),
                                ),
                              ),
                              Container(
                                width: size.width * 0.1,
                                child: Text(
                                  textAlign: TextAlign.end,
                                  NumberFormat('#,##0.00', 'en_US').format(priceDiscountPercen),
                                  style: TextStyle(
                                      color: Color(
                                        0xFF424242,
                                      ),
                                      fontSize: 20),
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    setState(() => priceDiscountPercen = 0);
                                  },
                                  icon: Icon(
                                    Icons.highlight_remove_sharp,
                                    size: 15,
                                    color: Color(0xFF616161),
                                  )),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        width: size.width * 0.24,
                        child: Divider(
                          height: 10,
                          color: Color(0xFFB0BEC5),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Text(
                            'Gift Voucher',
                            style: TextStyle(fontSize: 20, color: Color(0xFF1264E3)),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: size.width * 0.1,
                                child: Text(
                                  'คูปองห้อง',
                                  style: TextStyle(
                                      color: Color(
                                        0xFF424242,
                                      ),
                                      fontSize: 16),
                                ),
                              ),
                              Container(
                                width: size.width * 0.1,
                                child: Text(
                                  textAlign: TextAlign.end,
                                  NumberFormat('#,##0.00', 'en_US').format(priceVoucher),
                                  style: TextStyle(
                                      color: Color(
                                        0xFF424242,
                                      ),
                                      fontSize: 20),
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    setState(() => priceVoucher = 0);
                                  },
                                  icon: Icon(
                                    Icons.highlight_remove_sharp,
                                    size: 15,
                                    color: Color(0xFF616161),
                                  )),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: size.width * 0.1,
                                child: Text(
                                  'คูปองหน้าร้าน',
                                  style: TextStyle(
                                      color: Color(
                                        0xFF424242,
                                      ),
                                      fontSize: 16),
                                ),
                              ),
                              Container(
                                width: size.width * 0.1,
                                child: Text(
                                  textAlign: TextAlign.end,
                                  '15.00',
                                  style: TextStyle(
                                      color: Color(
                                        0xFF424242,
                                      ),
                                      fontSize: 20),
                                ),
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.highlight_remove_sharp,
                                    size: 15,
                                    color: Color(0xFF616161),
                                  )),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        width: size.width * 0.24,
                        child: Divider(
                          height: 10,
                          color: Color(0xFFB0BEC5),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Text(
                            'แลกคะแนน',
                            style: TextStyle(fontSize: 20, color: Color(0xFF1264E3)),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: size.width * 0.1,
                                child: Text(
                                  '${NumberFormat('#,##0', 'en_US').format(Points)} คะแนน',
                                  style: TextStyle(
                                      color: Color(
                                        0xFF424242,
                                      ),
                                      fontSize: 16),
                                ),
                              ),
                              Container(
                                width: size.width * 0.1,
                                child: Text(
                                  textAlign: TextAlign.end,
                                  NumberFormat('#,##0.00', 'en_US').format(Price),
                                  style: TextStyle(
                                      color: Color(
                                        0xFF424242,
                                      ),
                                      fontSize: 20),
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    setState(() => Price = 0);
                                  },
                                  icon: Icon(
                                    Icons.highlight_remove_sharp,
                                    size: 15,
                                    color: Color(0xFF616161),
                                  )),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        width: size.width * 0.24,
                        child: Divider(
                          height: 10,
                          color: Color(0xFFB0BEC5),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Text(
                            'ส่วนลดอื่นๆ',
                            style: TextStyle(fontSize: 20, color: Color(0xFF1264E3)),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: size.width * 0.1,
                                child: Text(
                                  'ส่วนลด The 1',
                                  style: TextStyle(
                                      color: Color(
                                        0xFF424242,
                                      ),
                                      fontSize: 16),
                                ),
                              ),
                              Container(
                                width: size.width * 0.1,
                                child: Text(
                                  textAlign: TextAlign.end,
                                  NumberFormat('#,##0.00', 'en_US').format(priceotherDiscount),
                                  style: TextStyle(
                                      color: Color(
                                        0xFF424242,
                                      ),
                                      fontSize: 20),
                                ),
                              ),
                              IconButton(
                                  onPressed: () {
                                    setState(() => priceotherDiscount = 0);
                                  },
                                  icon: Icon(
                                    Icons.highlight_remove_sharp,
                                    size: 15,
                                    color: Color(0xFF616161),
                                  )),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: size.width * 0.1,
                                child: Text(
                                  'คูปองห้าง',
                                  style: TextStyle(
                                      color: Color(
                                        0xFF424242,
                                      ),
                                      fontSize: 16),
                                ),
                              ),
                              Container(
                                width: size.width * 0.1,
                                child: Text(
                                  textAlign: TextAlign.end,
                                  '25.00',
                                  style: TextStyle(
                                      color: Color(
                                        0xFF424242,
                                      ),
                                      fontSize: 20),
                                ),
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.highlight_remove_sharp,
                                    size: 15,
                                    color: Color(0xFF616161),
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ],
                  )
          ],
        ),
      ),
    );
  }
}

class SplitPayment extends StatefulWidget {
  SplitPayment({super.key});

  @override
  State<SplitPayment> createState() => _SplitPaymentState();
}

class _SplitPaymentState extends State<SplitPayment> {
  List<Widget> payment = [];
  @override
  Widget build(BuildContext context) {
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
    void addModtodpayment() {
      final size = MediaQuery.of(context).size;
      setState(() {
        payment.add(
          Container(
            color: Colors.black,
            width: size.width * 0.01,
            height: size.height * 0.1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: size.height * 0.1,
                  width: size.width * 0.13,
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.grey)), borderRadius: BorderRadius.circular(2), color: Color(0xFFFFFAFAFA)),
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
                      Row(
                        children: [
                          DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              isExpanded: true,
                              items: general2
                                  .map((String item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 1.0),
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
                    ],
                  ),
                ),
                Container(
                  height: size.height * 0.1,
                  width: size.width * 0.13,
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.grey)), borderRadius: BorderRadius.circular(2), color: Color(0xFFFFFAFAFA)),
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
                      border: Border(bottom: BorderSide(color: Colors.grey)), borderRadius: BorderRadius.circular(2), color: Color(0xFFFFFAFAFA)),
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
                IconButton(
                    onPressed: () {
                      setState(() {
                        payment.removeLast();
                      });
                    },
                    icon: Icon(
                      Icons.highlight_remove_sharp,
                      color: Color(0xFF616161),
                    )),
              ],
            ),
          ),
        );
      });
    }

    final size = MediaQuery.of(context).size;
    TextEditingController ai = TextEditingController();

    return Column(children: [
      SizedBox(
        height: size.height * 0.01,
      ),
      SizedBox(
        height: size.height * 0.2,
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: payment.length,
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(height: 10);
          },
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                payment[index],
              ],
            );
          },
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
              decoration: BoxDecoration(border: Border.all(color: Color(0xff1264E3)), borderRadius: BorderRadius.circular(8)),
              height: size.height * 0.05,
              width: size.width * 0.1,
              child: Padding(
                padding: const EdgeInsets.only(left: 35, top: 10),
                child: Text(
                  "ชำระทั้งหมด",
                  style: TextStyle(color: Color(0xff1264E3)),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: InkWell(
              onTap: () {
                addModtodpayment();
                //setState(() {});
                print(payment);
              },
              child: Container(
                decoration: BoxDecoration(border: Border.all(color: Color(0xff1264E3)), borderRadius: BorderRadius.circular(8)),
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
    ]);
  }
}
