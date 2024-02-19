import 'package:flutter/material.dart';
import 'package:possodexo/constants.dart';
import 'package:possodexo/home/widgets/ClosePrintDialog.dart';
import 'package:possodexo/home/widgets/DropdownBranch.dart';
import 'package:possodexo/home/widgets/OpenAndCloseSwitch.dart';
import 'package:possodexo/home/widgets/OpenPrintDialog.dart';
import 'package:possodexo/home/widgets/OpenSalesShift.dart';
import 'package:possodexo/home/widgets/ShowOpenShift.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                    //color: Colors.grey,
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
                                  )),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Container(
                          height: size.height * 0.10,
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
                      ],
                    )
                  : ShowOpenShift(
                      size: size,
                      press: () async {
                        final ok = await showDialog(
                          context: context,
                          builder: (context) => OpenSalesShift(
                            size: size,
                            pressOk: () {
                              Navigator.pop(context, true);
                            },
                            pressCancel: () {
                              Navigator.pop(context, false);
                            },
                          ),
                        );
                        if (ok == true) {
                          setState(() {
                            openShift = true;
                          });
                        } else {
                          setState(() {
                            openShift = false;
                          });
                        }
                      },
                    )
            ],
          ),
        ),
        //Expanded(flex: 1, child: Container()),
        //ส่วนสำหรับแสดง รายการคิดเงิน
        Expanded(
          flex: 5,
          child: Column(
            children: [
              Container(
                height: size.height * 0.094,
                color: Colors.black,
                child: Row(
                  children: [
                    Text(
                      'รายการชำระ',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
