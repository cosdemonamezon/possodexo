import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Redeempointswidget extends StatefulWidget {
  Redeempointswidget({super.key, this.redeem});
  final Function(String)? redeem;

  @override
  State<Redeempointswidget> createState() => _RedeempointswidgetState();
}

class _RedeempointswidgetState extends State<Redeempointswidget> {
  List<String> point = ["200 คะแนน จะได้รับสิทธิแลกซื้อสินค้ามูลค่า 500 บาท", "1,000,000 คะแนน จะได้รับสิทธิแลกซื้อสินค้ามูลค่า 1,000,000 บาท"];
  String? _selectedponit;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.75,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30, bottom: 30, top: 20, right: 30),
            child: Container(
              height: size.height * 0.1,
              decoration: BoxDecoration(color: Color(0xFFE8EAF6), borderRadius: BorderRadius.circular(8)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Text(
                      'เงื่อนไขการแลกคะแนน',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF424242),
                        fontFamily: 'IBMPlexSansThai',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Text(
                      '100,309',
                      style: TextStyle(
                        fontSize: 34,
                        color: Color(0xFF424242),
                        fontFamily: 'IBMPlexSansThai',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Container(
              height: size.height * 0.108,
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
                      value: _selectedponit,
                      onChanged: (v) {
                        setState(() {
                          _selectedponit = v ?? '';
                        });
                      },
                      dropdownColor: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ],
                ),
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
                    onPressed: () {
                      widget.redeem!(_selectedponit ?? '');
                    },
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
          SizedBox(
            height: 180,
          ),
          SizedBox(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(color: Color(0xFFFFECB3), borderRadius: BorderRadius.circular(8)),
                  width: size.width * 0.22,
                  height: size.height * 0.09,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          'แลกคะแนน',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF424242),
                            fontFamily: 'IBMPlexSansThai',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Text(
                          '200',
                          style: TextStyle(
                            fontSize: 32,
                            color: Color(0xFF424242),
                            fontFamily: 'IBMPlexSansThai',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(color: Color(0xFFE8EAF6), borderRadius: BorderRadius.circular(8)),
                  width: size.width * 0.22,
                  height: size.height * 0.09,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          'คงเหลือ',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF424242),
                            fontFamily: 'IBMPlexSansThai',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Text(
                          '100,100',
                          style: TextStyle(
                            fontSize: 32,
                            color: Color(0xFF424242),
                            fontFamily: 'IBMPlexSansThai',
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
