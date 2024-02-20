import 'package:flutter/material.dart';
import 'package:possodexo/constants.dart';
import 'package:possodexo/home/widgets/ClosePrintDialog.dart';
import 'package:possodexo/home/widgets/DropdownBranch.dart';
import 'package:possodexo/home/widgets/OpenAndCloseSwitch.dart';
import 'package:possodexo/home/widgets/OpenPrintDialog.dart';
import 'package:possodexo/home/widgets/ShowOpenShift.dart';
import 'widgets/GridProduct.dart';
import 'widgets/Promotion.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> nationality = ["ไทย", "พมา", "ลาว"];
  String lang = "ไทย";
  int selectedIndex = 0;
  int selectedIndex1 = 0;
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  List<String> general = ["ไม่ระบุ", "ชาย", "หญิง"];
  String sex = "ไม่ระบุ";
  void onItemTapped1(int index) {
    setState(() {});
  }

  String sizeValue = 'สาขาพระราม 6';
  String printValue = 'พิมพ์ใบกำกับภาษี';
  bool open = true;
  bool print = false;
  bool openShift = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 15,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: size.height * 0.08,
                    width: size.width * 0.16,
                    // color: Colors.grey,
                    child: DropdownBranch(
                      sizeValue: sizeValue,
                      size: size,
                      onSelected: (value) {
                        setState(() {
                          sizeValue = value!;
                        });
                      },
                    ),
                  ),
                  Container(
                    height: size.height * 0.08,
                    width: size.width * 0.38,
                    //color: Colors.grey,
                    child: Row(
                      children: [
                        OpenAndCloseSwitch(
                          size: size,
                          open: open,
                          showTextOpen: 'เปิดเมนู',
                          showTextClose: 'ปิดเมนู',
                          onChanged: (value) {
                            setState(() {
                              open = value;
                            });
                          },
                        ),
                        OpenAndCloseSwitch(
                          size: size,
                          open: print,
                          showTextOpen: 'พิมพ์ใบเสร็จ',
                          showTextClose: 'พิมพ์ใบเสร็จ',
                          onChanged: (value) async {
                            setState(() {
                              print = value;
                            });
                            if (value == true) {
                              showDialog(
                                context: context,
                                builder: (context) => OpenPrintDialog(
                                  size: size,
                                  pressOk: () {
                                    Navigator.pop(context, true);
                                  },
                                  pressCancel: () {
                                    Navigator.pop(context, false);
                                  },
                                ),
                              );
                            } else {
                              showDialog(
                                context: context,
                                builder: (context) => ClosePrintDialog(
                                  size: size,
                                  pressOk: () {
                                    Navigator.pop(context, true);
                                  },
                                  pressCancel: () {
                                    Navigator.pop(context, false);
                                  },
                                ),
                              );
                            }
                          },
                        ),
                        SizedBox(
                          height: size.height * 0.06,
                          width: size.width * 0.08,
                          child: PopupMenuButton(
                            icon: Icon(Icons.more_horiz),
                            itemBuilder: (ctx) => [
                              PopupMenuItem(
                                child: Row(
                                  children: [
                                    Icon(Icons.sticky_note_2),
                                    Text('พิมพ์ใบกำกับภาษี'),
                                  ],
                                ),
                                onTap: () {},
                              ),
                              PopupMenuItem(
                                child: Row(
                                  children: [
                                    Icon(Icons.receipt),
                                    Text('พิมพ์ใบเสร็จย้อนหลัง'),
                                  ],
                                ),
                                onTap: () {},
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Divider(),

              //ส่วนแสดงสินค้า
              openShift == true
                  ? Column(
                      children: [
                        Row(
                          children: [
                            Card(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  side: BorderSide(color: kButtonColor)),
                              child: SizedBox(
                                width: size.width * 0.14,
                                height: size.height * 0.06,
                                child: Center(
                                    child: Text(
                                  '1 - POS01',
                                  style: TextStyle(
                                      color: kButtonColor,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                )),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    side: BorderSide(color: kButtonColor)),
                                child: SizedBox(
                                  width: size.width * 0.14,
                                  height: size.height * 0.06,
                                  child: Center(
                                      child: Row(
                                    children: [
                                      Icon(Icons.add),
                                      Text(
                                        'เพิ่ม',
                                        style: TextStyle(
                                            color: kButtonColor,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                GestureDetector(
                                onTap: () {},
                                child: Card(
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                      side: BorderSide(color: kButtonColor)),
                                  child: SizedBox(
                                    width: size.width * 0.10,
                                    height: size.height * 0.06,
                                    child: Center(
                                        child: Row(
                                      children: [
                                        Icon(Icons.add),
                                        Text(
                                          'เพิ่ม',
                                          style: TextStyle(
                                              color: kButtonColor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    ),
                                  ),
                                ),
                              ),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Container(
                            height: size.height * 0.1,
                            width: double.infinity,
                            color: kTabColor,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text('data'),
                                    Icon(Icons.arrow_downward),
                                  ],
                                ),
                                Row(),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Container(
                            height: size.height * 0.574,
                            child: SingleChildScrollView(
                              child: SizedBox(
                                child: GridCoffee(),
                              ),
                            ),
                          ),
                          Container(
                            height: size.height * 0.13,
                            child: GridProMotion(),
                          )
                          ]
                        ],
                      ]
                      ),
                    ),
                  : ShowOpenShift(
                      size: size,
                      press: () {
                        setState(() {
                          openShift = true;
                        });
                      },
                    ),
        //Expanded(flex: 1, child: Container()),
        //ส่วนสำหรับแสดง รายการคิดเงิน
        Expanded(
          flex: 5,
          child: Column(
            children: [
              Container(
                height: size.height * 0.15,
                color: Colors.black,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'รายการชำระ',
                        style: TextStyle(color: Colors.white, fontSize: 23),
                      ),
                    ),
                    Container(
                      width: size.width * 0.11,
                      height: size.height * 0.06,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                onItemTapped(0);
                              },
                              child: Container(
                                width: size.width * 0.05,
                                height: size.height * 0.05,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: selectedIndex == 0
                                      ? Colors.blue
                                      : Color.fromARGB(255, 255, 255, 255),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "ทั่วไป",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: selectedIndex == 0
                                            ? Color.fromARGB(255, 255, 255, 255)
                                            : Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                onItemTapped(1);
                              },
                              child: Container(
                                width: size.width * 0.05,
                                height: size.height * 0.05,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: selectedIndex == 1
                                        ? Colors.blue
                                        : Color.fromARGB(255, 255, 255, 255)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "สมาชิก",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: selectedIndex == 1
                                              ? Color.fromARGB(
                                                  255, 255, 255, 255)
                                              : Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  Container(
                    color: Colors.white,
                    height: size.height * 0.53,
                    width: size.width * 1,
                    child: Column(
                      children: [
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: size.height * 0.12,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom:
                                                BorderSide(color: Colors.grey)),
                                        borderRadius: BorderRadius.circular(2),
                                        color: Color(0xFFFFFAFAFA)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            selectedIndex1 = (0);
                                          },
                                          child: Opacity(
                                            opacity: 0.09,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5, top: 3),
                                              child: Text(
                                                'สัญชาติ',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        DropdownButtonHideUnderline(
                                          child: DropdownButton<String>(
                                            isExpanded: true,
                                            items: nationality
                                                .map((String item) =>
                                                    DropdownMenuItem<String>(
                                                      value: item,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal:
                                                                    1.0),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Text(
                                                            item,
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 16,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ))
                                                .toList(),
                                            value: lang,
                                            onChanged: (v) {
                                              setState(() {
                                                lang = v!;
                                              });
                                            },
                                            underline: SizedBox(),
                                            dropdownColor: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                height: size.height * 0.12,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom:
                                                BorderSide(color: Colors.grey)),
                                        borderRadius: BorderRadius.circular(2),
                                        color: Color(0xFFFFFAFAFA)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Opacity(
                                          opacity: 0.09,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 5, top: 3),
                                            child: Text(
                                              'เพศ',
                                              style: TextStyle(
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                        ),
                                        DropdownButtonHideUnderline(
                                          child: DropdownButton<String>(
                                            isExpanded: true,
                                            items: general
                                                .map((String item) =>
                                                    DropdownMenuItem<String>(
                                                      value: item,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal:
                                                                    1.0),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Text(
                                                            item,
                                                            style:
                                                                const TextStyle(
                                                              fontSize: 16,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ))
                                                .toList(),
                                            value: sex,
                                            onChanged: (v) {
                                              setState(() {
                                                sex = v!;
                                              });
                                            },
                                            underline: SizedBox(),
                                            dropdownColor: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    color: Color.fromARGB(15, 0, 0, 0),
                    height: size.height * 0.01,
                    width: size.width * 1,
                  ),
                  Container(
                    color: Colors.white,
                    height: size.height * 0.25,
                    width: size.width * 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Text("จำนวนสินค้า"), Text("0")],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Text("รวม"), Text("0.00 ฿")],
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [Text("ชำระทั้งหมด"), Text("0.00 ฿")],
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(color: Colors.black)),
                                height: size.height * 0.05,
                                width: size.width * 0.1,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("ดูโปรโมชั่น"),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Image.asset(
                                        "assets/icons/Subtract.png",
                                        scale: 15,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(color: Colors.black)),
                                height: size.height * 0.05,
                                width: size.width * 0.1,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("สมัครสมาชิก"),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Color.fromARGB(110, 185, 185, 185)),
                            height: size.height * 0.05,
                            width: size.width * 0.21,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Opacity(
                                    opacity: 0.8,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5, top: 3),
                                      child: Text(
                                        'ชำระเงิน 0.00',
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
