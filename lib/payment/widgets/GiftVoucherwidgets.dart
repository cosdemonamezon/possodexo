import 'dart:developer';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:possodexo/constants.dart';

class GiftVoucherwidgets extends StatefulWidget {
  GiftVoucherwidgets({
    super.key,
    this.voucher,
  });
  TextEditingController? ai = TextEditingController();
  final Function(String)? voucher;

  @override
  State<GiftVoucherwidgets> createState() => _GiftVoucherwidgetsState();
}

class _GiftVoucherwidgetsState extends State<GiftVoucherwidgets> {
  TextEditingController ai = TextEditingController();
  List<String> coupon = ["คูปองห้อง", "คูปองหน้าร้าน"];
  String? _selectedCoupon;
  @override
  void initState() {
    super.initState();
    ai = TextEditingController();
  }

  @override
  void dispose() {
    ai.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.75,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30, bottom: 30, top: 20),
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
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Container(
                  width: size.width * 0.2,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Color(0xFF78909C),
                      ),
                    ),
                    color: Color(0xFFFAFAFA),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      padding: EdgeInsets.only(left: 20),
                      hint: Text(
                        'ประเภทคูปอง',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF424242),
                          fontFamily: 'IBMPlexSansThai',
                        ),
                      ),
                      isExpanded: true,
                      items: coupon
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
                      value: _selectedCoupon,
                      onChanged: (v) {
                        setState(() {
                          _selectedCoupon = v ?? '';
                        });
                      },
                      underline: SizedBox(),
                      dropdownColor: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 30,
              ),
              Container(
                  width: size.width * 0.2,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Color(0xFF78909C),
                      ),
                    ),
                    color: Color(0xFFFAFAFA),
                  ),
                  child: TextFormField(
                    controller: widget.ai,
                    decoration: InputDecoration(
                      hintText: 'Gift Voucher',
                      prefixIcon: Icon(
                        Icons.search,
                        color: Color(0xFF616161),
                        size: 16,
                      ),
                    ),
                  ))
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Color(0xfffB0BEC5)),
            ),
            width: double.infinity,
            height: size.height * 0.09,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "฿",
                    style: TextStyle(fontSize: 25),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: SizedBox(
                      width: size.width * 0.45,
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      surfaceTintColor: Colors.white,
                      foregroundColor: Colors.red,
                      backgroundColor: Colors.white,
                      fixedSize: Size.fromHeight(60),
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
                    onPressed: () => widget.voucher!(widget.ai!.text),
                    style: ElevatedButton.styleFrom(
                      surfaceTintColor: Color(0xFF4CAF50),
                      foregroundColor: Color(0xFF4CAF50),
                      backgroundColor: Color(0xFF4CAF50),
                      fixedSize: Size.fromHeight(60),
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
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
