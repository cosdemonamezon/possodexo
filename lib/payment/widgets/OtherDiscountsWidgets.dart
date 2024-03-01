import 'package:flutter/material.dart';

class OtherDiscountsWidgets extends StatefulWidget {
  const OtherDiscountsWidgets({super.key});

  @override
  State<OtherDiscountsWidgets> createState() => _OtherDiscountsWidgetsState();
}

class _OtherDiscountsWidgetsState extends State<OtherDiscountsWidgets> {
  List<String> payment = ["จำนวนเงิน", "เปอร์เซ็นต์"];
  String? _selectedpaymet;

  List<String> point = ["ส่วนลด The 1", "คูปองห้าง"];
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
                const EdgeInsets.only(left: 30, bottom: 30, top: 20, right: 30),
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
                  height: 35,
                  decoration: BoxDecoration(
                      color: Color(0xFFCFD8DC),
                      borderRadius: BorderRadius.circular(6)),
                  child: Icon(
                    Icons.add,
                    size: 15,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: size.height * 0.08,
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
                                        padding:
                                            const EdgeInsets.only(left: 10),
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
                            value: _selectedpaymet,
                            onChanged: (v) {
                              setState(() {
                                _selectedpaymet = v ?? '';
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
                    height: size.height * 0.08,
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
                                        padding:
                                            const EdgeInsets.only(left: 10),
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
                            underline: SizedBox(),
                            dropdownColor: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                      height: size.height * 0.08,
                      width: size.width * 0.12,
                      decoration: BoxDecoration(
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
                                  ),
                                ),
                              )),
                        ],
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
