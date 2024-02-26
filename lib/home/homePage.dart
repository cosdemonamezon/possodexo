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
  List<String> nationality = ["ไทย", "พม๋า", "ลาว"];
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
      'price': 165,
      'name': 'Matcha Latte',
      'type': 'เครื่องดื่ม'
    },
    {
      'image': 'assets/images/coffee3.png',
      'price': 65,
      'name': 'Americano',
      'type': 'เครื่องดื่ม'
    },
    {
      'image': 'assets/images/coffee4.png',
      'price': 165,
      'name': 'Matcha Latte',
      'type': 'เครื่องดื่ม'
    },
    {
      'image': 'assets/images/coffee5.png',
      'price': 65,
      'name': 'Americano',
      'type': 'เครื่องดื่ม'
    },
    {
      'image': 'assets/images/coffee6.png',
      'price': 165,
      'name': 'Americano',
      'type': 'เครื่องดื่ม'
    },
    {
      'image': 'assets/images/coffee7.png',
      'price': 65,
      'name': 'Matcha Latte',
      'type': 'เครื่องดื่ม'
    },
    {
      'image': 'assets/images/coffee8.png',
      'price': 165,
      'name': 'Americano',
      'type': 'เครื่องดื่ม'
    },
    {
      'image': 'assets/images/coffee9.png',
      'price': 65,
      'name': 'Matcha Latte',
      'type': 'เครื่องดื่ม'
    },
    {
      'image': 'assets/images/coddee10.png',
      'price': 165,
      'name': 'Americano',
      'type': 'เครื่องดื่ม'
    },
    {
      'image': 'assets/images/coffee9.png',
      'price': 65,
      'name': 'Matcha Latte',
      'type': 'เครื่องดื่ม'
    },
    {
      'image': 'assets/images/dessert3.jpg',
      'price': 165,
      'name': 'Mango Sticky Rice',
      'type': 'ของหวาน'
    },
    {
      'image': 'assets/images/dessert2.jpg',
      'price': 65,
      'name': 'Bingsu',
      'type': 'ของหวาน'
    },
    {
      'image': 'assets/images/dessert1.jpg',
      'price': 165,
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

  double newtotal(ItemSelect orders) =>
      double.parse((orders.qty! * orders.price!).toString());

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
                                  border: Border.all(color: Color(0xFF1264E3))),
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
                                      borderRadius: BorderRadius.circular(5.0),
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
                            height: size.height * 0.08,
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
                          // SizedBox(
                          //   height: size.height * 0.01,
                          // ),
                          SizedBox(
                            height: size.height * 0.565,
                            child: SingleChildScrollView(
                              child: SizedBox(
                                child: GridCoffee(
                                  qty: qty,
                                  gridCoffee: gridCoffees,
                                  onChange: (value) {
                                    final item = ItemSelect(
                                      image: value['image'],
                                      price: value['price'],
                                      name: value['name'],
                                      type: value['type'],
                                    );
                                    selectedItem.add(item);
                                    setState(() {});
                                  },
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.140,
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
            ])),
        //Expanded(flex: 1, child: Container()),
        //ส่วนสำหรับแสดง รายการคิดเงิน
        Expanded(
          flex: 5,
          child: Column(
            children: [
              Container(
                height: size.height * 0.08,
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
                    height: size.height * 0.55,
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
                                            bottom:
                                                BorderSide(color: Colors.grey)),
                                        borderRadius: BorderRadius.circular(2),
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
                                                                  .all(6.0),
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
                                            bottom:
                                                BorderSide(color: Colors.grey)),
                                        borderRadius: BorderRadius.circular(2),
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
                        selectedItem.isEmpty
                            ? SizedBox.shrink()
                            : SizedBox(
                                height: size.height * 0.30,
                                child: ListView.builder(
                                  itemCount: selectedItem.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          selectedItem
                                                              .removeAt(index);
                                                        });
                                                      },
                                                      icon: Icon(Icons.delete)),
                                                  Text(selectedItem[index]
                                                          .name ??
                                                      ''),
                                                ],
                                              ),
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
                                                          final price =
                                                              selectedItem[
                                                                          index]
                                                                      .price! *
                                                                  selectedItem[
                                                                          index]
                                                                      .qty!;
    
                                                          selectedItem[index]
                                                              .priceQTY = price;
                                                        });
                                                      }
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          color:
                                                              Color(0xFF9E9E9E),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(6)),
                                                      child: Icon(Icons.remove),
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
                                                            selectedItem[index]
                                                                    .qty! +
                                                                1;
                                                        final price =
                                                            selectedItem[index]
                                                                    .price! *
                                                                selectedItem[
                                                                        index]
                                                                    .qty!;
    
                                                        selectedItem[index]
                                                            .priceQTY = price;
                                                      });
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          color:
                                                              Color(0xFF9E9E9E),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(6)),
                                                      child: Icon(Icons.add),
                                                    ),
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
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                selectedItem[index]
                                                    .price!
                                                    .toStringAsFixed(2),
                                              ),
                                              selectedItem[index].priceQTY == 0
                                                  ? Text(
                                                      selectedItem[index]
                                                          .price!
                                                          .toStringAsFixed(2),
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )
                                                  : Text(
                                                      selectedItem[index]
                                                          .priceQTY!
                                                          .toStringAsFixed(2),
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
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
                ],
              ),
              Column(
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
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () async {
                                      final statusD = await showDialog(
                                          context: context,
                                          builder: (context) => TablePromotion(
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
                                          border:
                                              Border.all(color: Colors.black)),
                                      height: size.height * 0.05,
                                      width: size.width * 0.1,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "ดูโปรโมชั่น",
                                              style: TextStyle(
                                                fontFamily: 'IBMPlexSansThai',
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
                                          border:
                                              Border.all(color: Colors.black)),
                                      height: size.height * 0.05,
                                      width: size.width * 0.1,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text("สมัครสมาชิก"),
                                          ],
                                        ),
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
                                              fontFamily: 'IBMPlexSansThai',
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
                      ),
                    ],
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

class ItemSelect {
  String? image;
  int? price;
  int? priceQTY;
  String? name;
  String? type;
  int? qty;

  ItemSelect({
    this.image,
    this.price,
    this.priceQTY = 0,
    this.name,
    this.type,
    this.qty = 1,
  });
}
