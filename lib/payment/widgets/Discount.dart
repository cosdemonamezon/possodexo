import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:possodexo/payment/widgets/numbercel.dart';
import 'package:possodexo/payment/widgets/numbercelpercen.dart';

class DiscountWidgets extends StatefulWidget {
  const DiscountWidgets({super.key, this.discount, this.from});

  final Function(String)? discount;
  final Function(String)? from;

  @override
  State<DiscountWidgets> createState() => _DiscountWidgetsState();
}

class _DiscountWidgetsState extends State<DiscountWidgets> {
  TextEditingController ai = TextEditingController();
  int selectedIndex = 0;
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.77,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30, bottom: 10, top: 10),
            child: Row(
              children: [
                Text(
                  'การเลือกรูปแบบการลด',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF424242),
                    fontFamily: 'IBMPlexSansThai',
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                    onTap: () {
                      widget.from!('discount');
                      onItemTapped(0);
                    },
                    child: selectedIndex == 0
                        ? Container(
                            height: size.height * 0.06,
                            width: size.width * 0.11,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Color(0xFF1264E3)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Image.asset(
                                  'assets/icons/selectpoint.png',
                                  height: size.height * 0.025,
                                ),
                                Text(
                                  'จำนวนเงิน',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFF424242),
                                    fontFamily: 'IBMPlexSansThai',
                                  ),
                                )
                              ],
                            ),
                          )
                        : Container(
                            height: size.height * 0.06,
                            width: size.width * 0.11,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Color(0xFF1264E3)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Image.asset(
                                  'assets/icons/unselectpoint.png',
                                  height: size.height * 0.025,
                                ),
                                Text(
                                  'จำนวนเงิน',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFF424242),
                                    fontFamily: 'IBMPlexSansThai',
                                  ),
                                )
                              ],
                            ),
                          )),
                SizedBox(
                  width: 30,
                ),
                InkWell(
                    onTap: () {
                      widget.from!('discountPercen');
                      onItemTapped(1);
                    },
                    child: selectedIndex == 1
                        ? Container(
                            height: size.height * 0.06,
                            width: size.width * 0.11,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Color(0xFF1264E3)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Image.asset(
                                  'assets/icons/selectpoint.png',
                                  height: size.height * 0.025,
                                ),
                                Text(
                                  'เปอเซ็นต์ % ',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFF424242),
                                    fontFamily: 'IBMPlexSansThai',
                                  ),
                                )
                              ],
                            ),
                          )
                        : Container(
                            height: size.height * 0.06,
                            width: size.width * 0.11,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Color(0xFF1264E3)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Image.asset(
                                  'assets/icons/unselectpoint.png',
                                  height: size.height * 0.025,
                                ),
                                Text(
                                  'เปอเซ็นต์ % ',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFF424242),
                                    fontFamily: 'IBMPlexSansThai',
                                  ),
                                )
                              ],
                            ),
                          )),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          selectedIndex == 0 ? Numbercel(ai: ai) : Numbercelpercen(ai: ai),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      ai.clear();
                    },
                    style: ElevatedButton.styleFrom(
                      surfaceTintColor: Colors.white,
                      foregroundColor: Colors.red,
                      backgroundColor: Colors.white,
                      fixedSize: Size.fromHeight(50),
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        side: BorderSide(color: Colors.red),
                      ),
                    ),
                    child: Text(
                      'ล้างข้อมูล',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.red,
                        fontFamily: 'IBMPlexSansThai',
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 50,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      if (ai != null && ai.text.isNotEmpty) {
                        widget.discount!(ai.text);

                        ai.clear();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      surfaceTintColor: Color(0xFF4CAF50),
                      foregroundColor: Color(0xFF4CAF50),
                      backgroundColor: Color(0xFF4CAF50),
                      fixedSize: Size.fromHeight(50),
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        // side: BorderSide(color: Colors.red),
                      ),
                    ),
                    child: Text(
                      'บันทึก',
                      style: TextStyle(
                        fontSize: 24,
                        color: Color(0xFFFFFFFF),
                        fontFamily: 'IBMPlexSansThai',
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
