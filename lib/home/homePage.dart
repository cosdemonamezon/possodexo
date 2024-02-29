import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:possodexo/constants.dart';
import 'package:possodexo/home/widgets/ClosePrintDialog.dart';
import 'package:possodexo/home/widgets/DropdownBranch.dart';
import 'package:possodexo/home/widgets/OpenAndCloseSwitch.dart';
import 'package:possodexo/home/widgets/OpenPrintDialog.dart';
import 'package:possodexo/home/widgets/OpenSalesShift.dart';
import 'package:possodexo/home/widgets/ShowOpenShift.dart';
import 'package:possodexo/home/widgets/TablePromotion.dart';
import 'package:possodexo/home/widgets/membership.dart';
import '../payment/widgets/paymentCash.dart';
import 'widgets/Addpointsela.dart';
import 'widgets/GridProduct.dart';
import 'widgets/Promotion.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> filteredProducts = [];
  List<String> nationality = ["ไทย", "พม่า", "ลาว"];
  String lang = "ไทย";
  List<ItemSelect> selectedItem = [];
  int selectedIndex = 0;
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

  List<Map<String, String>> product = [
    {'name': 'ทั้งหมด', 'type': 'all'},
    {'name': 'เครื่องดื่ม', 'type': 'drink'},
    {'name': 'ของหวาน', 'type': 'dessert'}
  ];
  String sclectedProduct = "ทั้งหมด";
  List<Map<String, dynamic>> gridCoffees = [];
  List<Map<String, dynamic>> gridCoffee = [
    {
      'image': 'assets/images/coffee2.png',
      'priceS': 165,
      'priceM': 175,
      'priceL': 185,
      'name': 'Matcha Latte',
      'type': 'เครื่องดื่ม'
    },
    {
      'image': 'assets/images/coffee3.png',
      'priceS': 65,
      'priceM': 75,
      'priceL': 85,
      'name': 'Americano',
      'type': 'เครื่องดื่ม'
    },
    {
      'image': 'assets/images/coffee4.png',
      'priceS': 165,
      'priceM': 175,
      'priceL': 185,
      'name': 'Matcha Latte',
      'type': 'เครื่องดื่ม'
    },
    {
      'image': 'assets/images/coffee5.png',
      'priceS': 65,
      'priceM': 75,
      'priceL': 85,
      'name': 'Americano',
      'type': 'เครื่องดื่ม'
    },
    {
      'image': 'assets/images/coffee6.png',
      'priceS': 165,
      'priceM': 175,
      'priceL': 185,
      'name': 'Americano',
      'type': 'เครื่องดื่ม'
    },
    {
      'image': 'assets/images/coffee7.png',
      'priceS': 65,
      'priceM': 75,
      'priceL': 85,
      'name': 'Matcha Latte',
      'type': 'เครื่องดื่ม'
    },
    {
      'image': 'assets/images/coffee8.png',
      'priceS': 165,
      'priceM': 175,
      'priceL': 185,
      'name': 'Americano',
      'type': 'เครื่องดื่ม'
    },
    {
      'image': 'assets/images/coffee9.png',
      'priceS': 65,
      'priceM': 75,
      'priceL': 85,
      'name': 'Matcha Latte',
      'type': 'เครื่องดื่ม'
    },
    {
      'image': 'assets/images/coddee10.png',
      'priceS': 165,
      'priceM': 175,
      'priceL': 185,
      'name': 'Americano',
      'type': 'เครื่องดื่ม'
    },
    {
      'image': 'assets/images/coffee9.png',
      'priceS': 65,
      'priceM': 75,
      'priceL': 85,
      'name': 'Matcha Latte',
      'type': 'เครื่องดื่ม'
    },
    {
      'image': 'assets/images/dessert3.jpg',
      'priceS': 165,
      'priceM': 175,
      'priceL': 185,
      'name': 'Mango Sticky Rice',
      'type': 'ของหวาน'
    },
    {
      'image': 'assets/images/dessert2.jpg',
      'priceS': 65,
      'priceM': 75,
      'priceL': 85,
      'name': 'Bingsu',
      'type': 'ของหวาน'
    },
    {
      'image': 'assets/images/dessert1.jpg',
      'priceS': 165,
      'priceM': 175,
      'priceL': 185,
      'name': 'waffle',
      'type': 'ของหวาน'
    },
  ];

  void onTapProduct(int index) {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    gridCoffees = gridCoffee;
  }

  double newtotal(
    ItemSelect orders,
  ) {
    return double.parse((orders.size! == 0
            ? orders.priceS! * orders.qty!
            : orders.size! == 1
                ? orders.priceM! * orders.qty!
                : orders.priceL! * orders.qty!)
        .toString());
  }

  double sumPrice(List<ItemSelect> productPrice) => productPrice.fold(
      0, (previousValue, element) => previousValue + newtotal(element));

  double newtotaQTYl(ItemSelect orders) =>
      double.parse((orders.qty).toString());

  double sumQTY(List<ItemSelect> productPrice) => productPrice.fold(
      0, (previousValue, element) => previousValue + newtotaQTYl(element));

  String sizeValue = 'สาขาพระราม 6';
  String printValue = 'พิมพ์ใบกำกับภาษี';
  bool open = true;
  bool print = false;
  bool openShift = false;
  int qty = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            flex: 15,
            child: SingleChildScrollView(
              child: Column(children: [
                Container(
                  decoration: BoxDecoration(color: Color(0xFFECEFF1)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(2),
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
                              width: size.width * 0.04,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    border:
                                        Border.all(color: Color(0xFF1264E3))),
                                child: PopupMenuButton(
                                  color: Colors.white,
                                  surfaceTintColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero),
                                  icon: Icon(Icons.more_horiz),
                                  itemBuilder: (ctx) => [
                                    PopupMenuItem(
                                      child: Row(
                                        children: [
                                          Icon(Icons.sticky_note_2),
                                          Text(
                                            'พิมพ์ใบกำกับภาษี',
                                            style: TextStyle(
                                              fontFamily: 'IBMPlexSansThai',
                                            ),
                                          ),
                                        ],
                                      ),
                                      onTap: () {},
                                    ),
                                    PopupMenuItem(
                                      child: Row(
                                        children: [
                                          Icon(Icons.receipt),
                                          Text(
                                            'พิมพ์ใบเสร็จย้อนหลัง',
                                            style: TextStyle(
                                              fontFamily: 'IBMPlexSansThai',
                                            ),
                                          ),
                                        ],
                                      ),
                                      onTap: () {},
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFECEFF1),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 1,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                ),

                //ส่วนแสดงสินค้า
                openShift == true
                    ? Container(
                        color: Colors.white,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Card(
                                  surfaceTintColor: Colors.white,
                                  elevation: 2,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                      side: BorderSide(color: kButtonColor)),
                                  child: SizedBox(
                                    width: size.width * 0.1,
                                    height: size.height * 0.06,
                                    child: Center(
                                        child: Text(
                                      '1 - POS01',
                                      style: TextStyle(
                                          color: kButtonColor,
                                          fontFamily: 'IBMPlexSansThai',
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) => Addpointsela(
                                        size: size,
                                        pressCancel: () {
                                          Navigator.pop(context, false);
                                        },
                                        pressOk: () {
                                          Navigator.pop(context, true);
                                        },
                                        pressClose: () {
                                          Navigator.pop(context, false);
                                        },
                                      ),
                                    );
                                  },
                                  child: Card(
                                    surfaceTintColor: Colors.white,
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        side: BorderSide(color: kButtonColor)),
                                    color: Colors.white,
                                    child: SizedBox(
                                      width: size.width * 0.07,
                                      height: size.height * 0.06,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/icons/add.png',
                                            scale: 25,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'เพิ่ม',
                                            style: TextStyle(
                                                color: kButtonColor,
                                                fontFamily: 'IBMPlexSansThai',
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            Container(
                              height: size.height * 0.1,
                              width: double.infinity,
                              color: kTabColor,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  DropdownButton<String>(
                                    selectedItemBuilder: (e) =>
                                        product.map<Widget>((item) {
                                      return Center(
                                        child: Text(
                                          item['name']!,
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                    icon: Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.white,
                                    ),
                                    underline: SizedBox(),
                                    items: product
                                        .map<DropdownMenuItem<String>>((item) {
                                      return DropdownMenuItem<String>(
                                        value: item['name'],
                                        child: Text(
                                          item['name']!,
                                          style: TextStyle(
                                            fontFamily: 'IBMPlexSansThai',
                                            color: Colors.black,
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                    value: sclectedProduct,
                                    onChanged: (v) {
                                      setState(() {
                                        sclectedProduct = v!;
                                        gridCoffees = gridCoffee;
                                        gridCoffees =
                                            gridCoffees.where((product) {
                                          if (v == 'ทั้งหมด') {
                                            return true;
                                          } else {
                                            return product['type'] == v;
                                          }
                                        }).toList();
                                      });
                                    },
                                  ),
                                  Row(),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            SizedBox(
                              height: size.height * 0.536,
                              child: SingleChildScrollView(
                                child: SizedBox(
                                  child: GridCoffee(
                                    qty: qty,
                                    gridCoffee: gridCoffees,
                                    onChange: (value) {
                                      inspect(value);
                                      final item = ItemSelect(
                                        image: value['item']['image'],
                                        priceS: value['item']['priceS'],
                                        priceM: value['item']['priceM'],
                                        priceL: value['item']['priceL'],
                                        name: value['item']['name'],
                                        type: value['item']['type'],
                                        size: value['size'],
                                      );
                                      selectedItem.add(item);
                                      setState(() {});
                                    },
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.14,
                              child: GridProMotion(),
                            )
                          ],
                        ),
                      )
                    : ShowOpenShift(
                        size: size,
                        press: () async {
                          final ok = await showDialog(
                            context: context,
                            builder: (context) => OpenSalesShift(
                              size: size,
                              pressCancel: () {
                                Navigator.pop(context, false);
                              },
                              pressOk: () {
                                Navigator.pop(context, true);
                              },
                              pressClose: () {
                                Navigator.pop(context, false);
                              },
                            ),
                          );
                          if (ok == true) {
                            setState(() {
                              openShift = true;
                            });
                          }
                        },
                      ),
              ]),
            )),
        //Expanded(flex: 1, child: Container()),
        //ส่วนสำหรับแสดง รายการคิดเงิน
        Expanded(
          flex: 8,
          child: SingleChildScrollView(
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
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 23,
                            fontFamily: 'IBMPlexSansThai',
                          ),
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
                                          fontFamily: 'IBMPlexSansThai',
                                          color: selectedIndex == 0
                                              ? Color.fromARGB(
                                                  255, 255, 255, 255)
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
                                            fontFamily: 'IBMPlexSansThai',
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
                      height: size.height * 0.486,
                      width: size.width * 1,
                      child: Column(
                        children: [
                          Container(),
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
                                    padding: const EdgeInsets.all(6.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.grey)),
                                          borderRadius:
                                              BorderRadius.circular(2),
                                          color: Color(0xFFFFFAFAFA)),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Opacity(
                                            opacity: 0.5,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5, top: 3),
                                              child: Text(
                                                'สัญชาติ',
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
                                    padding: const EdgeInsets.all(6.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.grey)),
                                          borderRadius:
                                              BorderRadius.circular(2),
                                          color: Color(0xFFFFFAFAFA)),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Opacity(
                                            opacity: 0.5,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5, top: 3),
                                              child: Text(
                                                'เพศ',
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
                          Container(
                              color: Color(0xffE8EAF6),
                              width: size.width * 0.5,
                              height: size.height * 0.04,
                              child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedItem.clear();
                                    });
                                  },
                                  child: Row(
                                    children: [
                                      Text("Order #20240214001"),
                                      Icon(Icons.cancel),
                                    ],
                                  ))),

                          /// โช สินค้า
                          // GestureDetector(
                          //   onTap: () async {
                          //     final listItem2 = await showDialog(
                          //         context: context,
                          //         builder: (context) {
                          //           return GridCoffee();
                          //         });

                          //     if (listItem2 != null) {
                          //       setState(() {});
                          //     }
                          //   },
                          // )
                          SizedBox(
                            height: size.height * 0.001,
                          ),
                          selectedItem.isEmpty
                              ? SizedBox.shrink()
                              : SizedBox(
                                  height: size.height * 0.3,
                                  child: ListView.builder(
                                    itemCount: selectedItem.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: size.height * 0.01,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(selectedItem[index].name ??
                                                    ''),
                                                Row(
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        if (selectedItem[index]
                                                                .qty! >
                                                            1) {
                                                          setState(() {
                                                            selectedItem[index]
                                                                    .qty =
                                                                selectedItem[
                                                                            index]
                                                                        .qty! -
                                                                    1;
                                                            final price = selectedItem[
                                                                            index]
                                                                        .size ==
                                                                    0
                                                                ? selectedItem[
                                                                            index]
                                                                        .priceS! *
                                                                    selectedItem[
                                                                            index]
                                                                        .qty!
                                                                : selectedItem[
                                                                                index]
                                                                            .size ==
                                                                        1
                                                                    ? selectedItem[index]
                                                                            .priceM! *
                                                                        selectedItem[index]
                                                                            .qty!
                                                                    : selectedItem[index]
                                                                            .priceL! *
                                                                        selectedItem[index]
                                                                            .qty!;

                                                            selectedItem[index]
                                                                    .priceQTY =
                                                                price;
                                                          });
                                                        }
                                                      },
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                            color: Color(
                                                                0xFF9E9E9E),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        6)),
                                                        child:
                                                            Icon(Icons.remove),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                        "${selectedItem[index].qty}"),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          selectedItem[index]
                                                                  .qty =
                                                              selectedItem[
                                                                          index]
                                                                      .qty! +
                                                                  1;
                                                          final price = selectedItem[
                                                                          index]
                                                                      .size ==
                                                                  0
                                                              ? selectedItem[
                                                                          index]
                                                                      .priceS! *
                                                                  selectedItem[
                                                                          index]
                                                                      .qty!
                                                              : selectedItem[index]
                                                                          .size ==
                                                                      1
                                                                  ? selectedItem[
                                                                              index]
                                                                          .priceM! *
                                                                      selectedItem[
                                                                              index]
                                                                          .qty!
                                                                  : selectedItem[
                                                                              index]
                                                                          .priceL! *
                                                                      selectedItem[
                                                                              index]
                                                                          .qty!;
                                                          inspect(price);
                                                          selectedItem[index]
                                                              .priceQTY = price;
                                                        });
                                                      },
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                            color: Color(
                                                                0xFF9E9E9E),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        6)),
                                                        child: Icon(Icons.add),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            selectedItem[index].type ==
                                                    "เครื่องดื่ม"
                                                ? Row(
                                                    children: [
                                                      Text('ขนาด'),
                                                      SizedBox(
                                                        width:
                                                            size.width * 0.01,
                                                      ),
                                                      Text(selectedItem[index]
                                                                  .size ==
                                                              0
                                                          ? 'S'
                                                          : selectedItem[index]
                                                                      .size ==
                                                                  1
                                                              ? 'M'
                                                              : "L")
                                                    ],
                                                  )
                                                : SizedBox.shrink(),
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
                                                  selectedItem[index].size == 0
                                                      ? selectedItem[index]
                                                          .priceS!
                                                          .toStringAsFixed(2)
                                                      : selectedItem[index]
                                                                  .size ==
                                                              1
                                                          ? selectedItem[index]
                                                              .priceM!
                                                              .toStringAsFixed(
                                                                  2)
                                                          : selectedItem[index]
                                                              .priceL!
                                                              .toStringAsFixed(
                                                                  2),
                                                ),
                                                selectedItem[index].priceQTY ==
                                                        0
                                                    ? Text(
                                                        selectedItem[index]
                                                                    .size ==
                                                                0
                                                            ? selectedItem[
                                                                    index]
                                                                .priceS!
                                                                .toStringAsFixed(
                                                                    2)
                                                            : selectedItem[index]
                                                                        .size ==
                                                                    1
                                                                ? selectedItem[
                                                                        index]
                                                                    .priceM!
                                                                    .toStringAsFixed(
                                                                        2)
                                                                : selectedItem[
                                                                        index]
                                                                    .priceL!
                                                                    .toStringAsFixed(
                                                                        2),
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )
                                                    : Text(
                                                        selectedItem[index]
                                                            .priceQTY!
                                                            .toStringAsFixed(2),
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                              ],
                                            ),
                                            Divider()
                                          ],
                                        ),
                                      );
                                    },
                                  )),
                        ],
                      ),
                    ),
                  ],
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        color: Color.fromARGB(15, 0, 0, 0),
                        height: size.height * 0.01,
                        width: size.width * 1,
                      ),
                      Column(
                        children: [
                          Container(
                            color: Colors.white,
                            height: size.height * 0.30,
                            width: size.width * 1,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: size.height * 0.01,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "จำนวนสินค้า",
                                        style: TextStyle(
                                          fontFamily: 'IBMPlexSansThai',
                                        ),
                                      ),
                                      Text(
                                        '${sumQTY(selectedItem)} ชิ้น',
                                        style: TextStyle(
                                          fontFamily: 'IBMPlexSansThai',
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "รวม",
                                        style: TextStyle(
                                          fontFamily: 'IBMPlexSansThai',
                                        ),
                                      ),
                                      Text(
                                        '${sumPrice(selectedItem)} ฿',
                                        style: TextStyle(
                                          fontFamily: 'IBMPlexSansThai',
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "ส่วนลด",
                                        style: TextStyle(
                                          fontFamily: 'IBMPlexSansThai',
                                        ),
                                      ),
                                      Text(
                                        '0 ฿',
                                        style: TextStyle(
                                          fontFamily: 'IBMPlexSansThai',
                                        ),
                                      )
                                    ],
                                  ),
                                  Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "ชำระทั้งหมด",
                                        style: TextStyle(
                                          fontFamily: 'IBMPlexSansThai',
                                        ),
                                      ),
                                      Text(
                                        "${sumPrice(selectedItem)} ฿",
                                        style: TextStyle(
                                          fontFamily: 'IBMPlexSansThai',
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: size.height * 0.02,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          final statusD = await showDialog(
                                              context: context,
                                              builder: (context) =>
                                                  TablePromotion(
                                                    closeblack: () {
                                                      Navigator.pop(context);
                                                    },
                                                  ));
                                          if (statusD == true) {}
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all(
                                                  color: Colors.black)),
                                          height: size.height * 0.05,
                                          width: size.width * 0.13,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "ดูโปรโมชั่น",
                                                  style: TextStyle(
                                                    fontFamily:
                                                        'IBMPlexSansThai',
                                                  ),
                                                ),
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
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          final statusD = await showDialog(
                                              context: context,
                                              builder: (context) => Membership(
                                                    closeblack: () {
                                                      Navigator.pop(context);
                                                    },
                                                  ));
                                          if (statusD == true) {}
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all(
                                                  color: Colors.black)),
                                          height: size.height * 0.05,
                                          width: size.width * 0.13,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
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
                                  InkWell(
                                    onTap: () {
                                      selectedItem.isNotEmpty
                                          ? Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      PaymentCash(
                                                        selectedItem:
                                                            selectedItem,
                                                        sumPrice: sumPrice(
                                                                selectedItem)
                                                            .toString(),
                                                        sumQTY:
                                                            sumQTY(selectedItem)
                                                                .toString(),
                                                      )))
                                          : null;
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: selectedItem.isNotEmpty
                                              ? Colors.blue
                                              : Color.fromARGB(
                                                  110, 185, 185, 185)),
                                      height: size.height * 0.05,
                                      width: size.width * 0.28,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Opacity(
                                              opacity: 0.8,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 5, top: 3),
                                                child: Text(
                                                  'ชำระเงิน ',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 12,
                                                      fontFamily:
                                                          'IBMPlexSansThai',
                                                      color: selectedItem
                                                              .isNotEmpty
                                                          ? Colors.white
                                                          : Color.fromARGB(110,
                                                              185, 185, 185)),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ItemSelect {
  String? image;

  int? priceS;
  int? priceM;
  int? priceL;
  int? priceQTY;
  int? size;
  String? name;
  String? type;
  int? qty;

  ItemSelect({
    this.image,
    this.priceS,
    this.priceM,
    this.priceL,
    this.priceQTY = 0,
    this.size,
    this.name,
    this.type,
    this.qty = 1,
  });
}
