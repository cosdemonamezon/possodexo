// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:possodexo/home/firstPage.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: FirstPage(),
//     );
//   }
// }

// class TaxPage extends StatefulWidget {
//   const TaxPage({Key? key}) : super(key: key);

//   @override
//   State<TaxPage> createState() => _TaxPageState();
// }

// class _TaxPageState extends State<TaxPage> {
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Tax Page'),
//       ),
//       body: Container(
//         height: size.height * 0.4,
//         width: size.width * 1,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(8),
//           color: Colors.white,
//         ),
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(left: 20, right: 20),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   SizedBox(
//                     width: size.width * 0.4,
//                     child: Text(
//                       'ใบกำกับภาษี',
//                       style: TextStyle(fontSize: 30, color: Color(0xFF424242)),
//                     ),
//                   ),
//                   SizedBox(
//                     height: size.height * 0.1,
//                     width: size.width * 0.4,
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: TextFormField(
//                         decoration: InputDecoration(
//                           filled: true,
//                           fillColor: Color(0xFFFAFAFA),
//                           hintText: "ค้นหาเลขที่ใบกำกับภาษี",
//                           prefixIcon: Icon(Icons.search, color: Color(0xFF78909C)),
//                         ),
//                         validator: (value) {
//                           if (value == '') {}
//                           return null;
//                         },
//                         keyboardType: TextInputType.number,
//                       ),
//                     ),
//                   ),
//                   Container(
//                     height: size.height * 0.08,
//                     width: size.width * 0.08,
//                     decoration: BoxDecoration(border: Border.all(color: Color(0xFF1264E3)), borderRadius: BorderRadius.circular(8)),
//                     child: Center(
//                       child: Text(
//                         'ค้นหา',
//                         style: TextStyle(color: Color(0xFF1264E3), fontSize: 20),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:possodexo/home/homePage.dart';
import 'package:possodexo/home/widgets/ClosePrintDialog.dart';
import 'package:possodexo/home/widgets/DropdownBranch.dart';
import 'package:possodexo/home/widgets/ItemMenuWidget.dart';
import 'package:possodexo/home/widgets/OpenAndCloseSwitch.dart';
import 'package:possodexo/home/widgets/OpenPrintDialog.dart';

class TaxPage extends StatefulWidget {
  const TaxPage({super.key});

  @override
  State<TaxPage> createState() => _TaxPageState();
}

class _TaxPageState extends State<TaxPage> {
  String pageActive = 'Home';

  _pageView() {
    switch (pageActive) {
      case 'Home':
        return HomePage();
      case 'Menu':
        return Container();
      case 'History':
        return Container();
      case 'Setting':
        return Container();
    }
  }

  _setPage(String page) {
    setState(() {
      pageActive = page;
    });
  }

  bool open = true;
  bool print = false;
  bool openShift = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff1f2029),
        body: Row(
          children: [
            Container(
              width: size.width * 0.08,
              height: size.height,
              padding: EdgeInsets.only(top: 24, right: 12, left: 12),
              child: Column(
                children: [
                  Column(
                    children: [
                      Image.asset('assets/icons/Logo_White.png'),
                      SizedBox(height: size.height * 0.02),
                      Text(
                        'by Okontek',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 8,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.02),
                  Expanded(
                    child: ListView(
                      children: [
                        ItemMenuWidget(
                          pageActive: pageActive,
                          menu: 'Home',
                          title: 'สั่งและชำระ',
                          image: 'assets/icons/Orderandpay.png',
                          press: () => _setPage('Home'),
                        ),
                        ItemMenuWidget(
                          pageActive: pageActive,
                          menu: 'Menu',
                          title: 'ยกเลิกบิล',
                          image: 'assets/icons/Cancelbill.png',
                          press: () => _setPage('Menu'),
                        ),
                        ItemMenuWidget(
                          pageActive: pageActive,
                          menu: 'History',
                          title: 'ปิด/เปิด \n กะงาน',
                          image: 'assets/icons/Clock.png',
                          press: () => _setPage('History'),
                        ),
                        SizedBox(
                          height: size.height * 0.13,
                        ),
                        ItemMenuWidget(
                          pageActive: pageActive,
                          menu: 'Setting',
                          title: 'ตั้งค่า POS',
                          image: 'assets/icons/Settinglogo.png',
                          press: () => _setPage('Setting'),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: AnimatedContainer(
                      //padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      height: size.height * 0.05,
                      width: size.width * 0.08,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color.fromARGB(255, 68, 68, 68),
                      ),
                      duration: Duration(milliseconds: 300),
                      curve: Curves.slowMiddle,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'ออกจากระบบ',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: 'IBMPlexSansThai',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                ],
              ),
            ),

            ///Show Page
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 2, right: 1),
                padding: EdgeInsets.only(top: 0, right: 0, left: 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(1), topRight: Radius.circular(1)),
                  color: Color.fromARGB(255, 229, 230, 240),
                ),
                child: Column(
                  children: [
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
                            child: DropdownBranch(),
                          ),
                          SizedBox(
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
                                        color: Colors.white, borderRadius: BorderRadius.circular(8), border: Border.all(color: Color(0xFF1264E3))),
                                    child: PopupMenuButton(
                                      color: Colors.white,
                                      surfaceTintColor: Colors.white,
                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
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
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => TaxPage()),
                                            );
                                          },
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
                    SizedBox(
                      width: size.width * 0.4,
                      child: Text(
                        'ใบกำกับภาษี',
                        style: TextStyle(fontSize: 30, color: Color(0xFF424242)),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.1,
                      width: size.width * 0.4,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xFFFAFAFA),
                            hintText: "ค้นหาเลขที่ใบกำกับภาษี",
                            prefixIcon: Icon(Icons.search, color: Color(0xFF78909C)),
                          ),
                          validator: (value) {
                            if (value == '') {}
                            return null;
                          },
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ),
                    Container(
                      height: size.height * 0.08,
                      width: size.width * 0.08,
                      decoration: BoxDecoration(border: Border.all(color: Color(0xFF1264E3)), borderRadius: BorderRadius.circular(8)),
                      child: Center(
                        child: Text(
                          'ค้นหา',
                          style: TextStyle(color: Color(0xFF1264E3), fontSize: 20),
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
    );
  }
}
