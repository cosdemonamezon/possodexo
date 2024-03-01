import 'package:flutter/material.dart';

class Redeempointswidget extends StatefulWidget {
  const Redeempointswidget({super.key});

  @override
  State<Redeempointswidget> createState() => _RedeempointswidgetState();
}

class _RedeempointswidgetState extends State<Redeempointswidget> {
  List<String> point = [
    "200 คะแนน จะได้รับสิทธิแลกซื้อสินค้ามูลค่า 500 บาท",
    "400 คะแนน จะได้รับสิทธิแลกซื้อสินค้ามูลค่า 1,0s00 บาท"
  ];
  String? _selectedponit;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.2,
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 30, bottom: 15, top: 20, right: 30),
            child: Container(
              height: size.height * 0.07,
              decoration: BoxDecoration(
                  color: Color(0xFFE8EAF6),
                  borderRadius: BorderRadius.circular(8)),
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
              height: size.height * 0.07,
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
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'IBMPlexSansThai',
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
                      underline: SizedBox(),
                      dropdownColor: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
