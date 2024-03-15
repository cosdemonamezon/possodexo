import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OtherDiscountsWidgets extends StatefulWidget {
  final Function(String)? otherDiscount;
  final Function(String)? fromtype;

  OtherDiscountsWidgets({Key? key, this.otherDiscount, this.fromtype});
  @override
  State<OtherDiscountsWidgets> createState() => _OtherDiscountsWidgetsState();
}

class _OtherDiscountsWidgetsState extends State<OtherDiscountsWidgets> {
  List<TextEditingController> otherdiscount = [];
  TextEditingController discount = TextEditingController();

  List<String> payment = ["จำนวนเงิน", "เปอร์เซ็นต์"];
  String payment1 = 'จำนวนเงิน';
  String? _selectedpayment;

  List<String> point = ["ส่วนลด The 1", "คูปองห้าง"];
  String point1 = 'จำนวนเงิน';
  String? _selectedpoint;

  List<Map<String, String>> rowData = [];

  @override
  void initState() {
    super.initState();
    _selectedpayment = payment.first;
    _selectedpoint = point.first;
    payment1 = payment.first;
    point1 = point.first;
    rowData.add({
      'payment': payment1,
      'point': point1,
      'amount': '',
    });
    addUniqueController();
  }

  void addPaddingAndRow() {
    setState(() {
      rowData.add({
        'payment': payment1,
        'point': point1,
        'amount': '0',
      });
      addUniqueController();
    });
  }

  void addUniqueController() {
    TextEditingController newController = TextEditingController();
    String newValue = newController.text;
    bool valueExists = otherdiscount.any((controller) => controller.text == newValue);
    // if (!valueExists) {
    otherdiscount.add(newController);
    // }
  }

  void clearAllData() {
    setState(() {
      rowData.clear();
      rowData.add({
        'payment': payment1,
        'point': point1,
        'amount': '',
      });
      addUniqueController();
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        height: size.height * 0.75,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30, bottom: 30, top: 20, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'ส่วนลดอื่นๆ',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF424242),
                      fontFamily: 'IBMPlexSansThai',
                    ),
                  ),
                  Container(
                    width: size.width * 0.023,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Color(0xFFCFD8DC),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.add, size: 15),
                      onPressed: addPaddingAndRow,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.48,
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: rowData.length,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 10);
                },
                itemBuilder: (BuildContext context, int index) {
                  return RowDiscountWidget(
                    otherDiscount: otherdiscount[index],
                    rowData: rowData[index],
                    payment: payment,
                    point: point,
                    onChangedPayment: (String? newValue) {
                      setState(() {
                        rowData[index]['payment'] = newValue ?? '';
                        payment1 = newValue!;
                      });
                    },
                    onChangedPoint: (String? newValue) {
                      setState(() {
                        rowData[index]['point'] = newValue ?? '';
                        point1 = newValue!;
                      });
                    },
                    onChangedAmount: (String newValue) {
                      setState(() {
                        rowData[index]['amount'] = newValue;
                      });
                    },
                    onRemove: (index) {
                      setState(() {
                        log(index.toString());
                        // log(rowData.toString());
                        inspect(rowData.toString());
                        inspect(otherdiscount.toString());
                        // log(otherdiscount.toString());
                        rowData.removeAt(index);
                        // otherdiscount.removeAt(index);
                        otherdiscount[index].dispose();
                        log(rowData.toString());
                        log(otherdiscount.toString());
                      });
                    },
                  );
                },
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
                      onPressed: () {
                        otherdiscount.clear();
                        clearAllData();
                      },
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
                      onPressed: () {
                        widget.otherDiscount!(otherdiscount
                            .map((controller) => int.tryParse(controller.text) ?? 0)
                            .reduce((value, element) => value + element)
                            .toString());
                        otherdiscount.clear();
                        // rowData.clear();
                        clearAllData();
                        widget.fromtype!(point1);
                      },
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
      ),
    );
  }
}

class RowDiscountWidget extends StatefulWidget {
  final Map<String, String> rowData;
  final List<String> payment;
  final List<String> point;
  final ValueChanged<String?> onChangedPayment;
  final ValueChanged<String?> onChangedPoint;
  final ValueChanged<String> onChangedAmount;
  final Function(int)? onRemove;
  final Function(String)? otherdiscount;
  TextEditingController? otherDiscount;
  final Function(String)? fromtype;

  RowDiscountWidget({
    Key? key,
    required this.rowData,
    required this.payment,
    required this.point,
    required this.onChangedPayment,
    required this.onChangedPoint,
    required this.onChangedAmount,
    required this.onRemove,
    this.otherdiscount,
    this.otherDiscount,
    this.fromtype,
  }) : super(key: key);
  @override
  _RowDiscountWidgetState createState() => _RowDiscountWidgetState();
}

class _RowDiscountWidgetState extends State<RowDiscountWidget> {
  @override
  void dispose() {
    widget.otherDiscount?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: size.height * 0.11,
              width: size.width * 0.1,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color(0xFF78909C),
                  ),
                ),
                color: Color(0xFFFAFAFA),
              ),
              child: DropdownButtonHideUnderline(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 4),
                      child: Text(
                        'รูปแบบ',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF424242),
                          fontFamily: 'IBMPlexSansThai',
                        ),
                      ),
                    ),
                    DropdownButton<String>(
                      isExpanded: true,
                      items: widget.payment
                          .map((String item) => DropdownMenuItem<String>(
                                value: item,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'IBMPlexSansThai',
                                    ),
                                  ),
                                ),
                              ))
                          .toList(),
                      value: widget.rowData['payment'],
                      onChanged: widget.onChangedPayment,
                      underline: SizedBox(),
                      dropdownColor: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: size.height * 0.11,
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 4),
                      child: Text(
                        'รูปแบบ',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF424242),
                          fontFamily: 'IBMPlexSansThai',
                        ),
                      ),
                    ),
                    DropdownButton<String>(
                      isExpanded: true,
                      items: widget.point
                          .map((String item) => DropdownMenuItem<String>(
                                value: item,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'IBMPlexSansThai',
                                    ),
                                  ),
                                ),
                              ))
                          .toList(),
                      value: widget.rowData['point'],
                      onChanged: widget.onChangedPoint,
                      underline: SizedBox(),
                      dropdownColor: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: size.height * 0.11,
              width: size.width * 0.12,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color(0xFF78909C),
                  ),
                ),
                color: Color(0xFFFAFAFA),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 4),
                    child: Row(
                      children: [
                        Text(
                          'บาท',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF424242),
                            fontFamily: 'IBMPlexSansThai',
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.2,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: TextFormField(
                        controller: widget.otherDiscount,
                        onChanged: widget.onChangedAmount,
                        decoration: InputDecoration(
                          hintText: 'จำนานเงิน',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // IconButton(
            //   onPressed: () {
            //     widget.onRemove;
            //   },
            //   icon: Icon(
            //     Icons.highlight_remove_sharp,
            //     color: Color(0xFF616161),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
