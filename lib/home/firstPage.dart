import 'package:flutter/material.dart';
import 'package:possodexo/home/homePage.dart';
import 'package:possodexo/home/widgets/ItemMenuWidget.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  String pageActive = 'Home';

  _pageView() {
    switch (pageActive) {
      case 'Home':
        return HomePage();
      case 'Menu':
        return Container();
      case 'History':
        return Container();

      default:
        return HomePage();
    }
  }

  _setPage(String page) {
    setState(() {
      pageActive = page;
    });
  }

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
                      // Container(
                      //   padding: EdgeInsets.all(8),
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(20),
                      //     color: Colors.deepOrangeAccent,
                      //   ),
                      //   child: Icon(
                      //     Icons.fastfood,
                      //     color: Colors.white,
                      //     size: 14,
                      //   ),
                      // ),
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
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(1),
                      topRight: Radius.circular(1)),
                  color: Color.fromARGB(255, 229, 230, 240),
                ),
                child: _pageView(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
