import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OtherDiscountsWidgets extends StatefulWidget {
  OtherDiscountsWidgets({super.key});

  @override
  State<OtherDiscountsWidgets> createState() => _OtherDiscountsWidgetsState();
}

class _OtherDiscountsWidgetsState extends State<OtherDiscountsWidgets> {
  List<String> payment = ["จำนวนเงิน", "เปอร์เซ็นต์"];
  String? _selectedpayment;

  List<String> point = ["ส่วนลด The 1", "คูปองห้าง"];
  String? _selectedpoint;

  List<Widget> rowdiscount = [];

  void addPaddingAndRow() {
    final size = MediaQuery.of(context).size;
    setState(() {
      rowdiscount.add(
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
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
                          items: payment
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
                          value: _selectedpayment,
                          onChanged: (v) {
                            setState(() {
                              _selectedpayment = v ?? '';
                            });
                          },
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
                          items: point
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
                          value: _selectedpoint,
                          onChanged: (v) {
                            setState(() {
                              _selectedpoint = v ?? '';
                            });
                          },
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
                      Container(
                        width: size.width * 0.2,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: TextFormField(
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
              ],
            ),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        height: size.height * 0.7,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 30, bottom: 30, top: 20, right: 30),
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
                    width: size.width * 0.02,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Color(0xFFCFD8DC),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.add, size: 15),
                      onPressed: () {
                        addPaddingAndRow();
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.47,
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: rowdiscount.length,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 10);
                },
                itemBuilder: (BuildContext context, int index) {
                  return rowdiscount[index];
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
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        surfaceTintColor: Color(0xFF4CAF50),
                        foregroundColor: Color(0xFF4CAF50),
                        backgroundColor: Color(0xFF4CAF50),
                        fixedSize: Size.fromHeight(60),
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
      ),
    );
  }
}
