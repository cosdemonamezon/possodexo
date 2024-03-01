import 'package:flutter/material.dart';

class DiscountWidgets extends StatefulWidget {
  const DiscountWidgets({super.key});

  @override
  State<DiscountWidgets> createState() => _DiscountWidgetsState();
}

class _DiscountWidgetsState extends State<DiscountWidgets> {
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
      height: size.height * 0.2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
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
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                    onTap: () {
                      onItemTapped(0);
                    },
                    child: selectedIndex == 0
                        ? Container(
                            height: size.height * 0.08,
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
                            height: size.height * 0.08,
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
                      onItemTapped(1);
                    },
                    child: selectedIndex == 1
                        ? Container(
                            height: size.height * 0.08,
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
                            height: size.height * 0.08,
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
          )
        ],
      ),
    );
  }
}
