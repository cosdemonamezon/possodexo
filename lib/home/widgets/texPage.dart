import 'package:flutter/material.dart';
import 'package:possodexo/home/firstPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstPage(),
    );
  }
}

class TaxPage extends StatefulWidget {
  const TaxPage({Key? key}) : super(key: key);

  @override
  State<TaxPage> createState() => _TaxPageState();
}

class _TaxPageState extends State<TaxPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.8,
      width: size.width * 1,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
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
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFF1264E3)),
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                child: Center(
                  child: Text(
                    'ค้นหา',
                    style: TextStyle(color: Color(0xFF1264E3), fontSize: 20),
                  ),
                ),
              )
            ],
          ),
          Container(
            width: size.width * 0.35,
            height: size.height * 0.5,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Color(0xFFE8EAF6)),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'ใบเสร็จ :',
                        style: TextStyle(fontSize: 20, color: Color(0xFF424242)),
                      ),
                      Text(
                        ' RM924022300002',
                        style: TextStyle(color: Color(0xFF1264E3), fontSize: 20),
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.1,
                    width: size.width * 0.3,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xFFFAFAFA),
                          hintText: "เลขประจำตัวผู้เสียภาษี",
                        ),
                        validator: (value) {
                          if (value == '') {}
                          return null;
                        },
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.1,
                    width: size.width * 0.3,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xFFFAFAFA),
                          hintText: "ลูกค้า",
                        ),
                        validator: (value) {
                          if (value == '') {}
                          return null;
                        },
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.1,
                    width: size.width * 0.3,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: TextFormField(
                        textAlignVertical: TextAlignVertical.top,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xFFFAFAFA),
                          hintText: "ที่อยู่",
                          contentPadding: EdgeInsets.symmetric(vertical: 40.0),
                        ),
                        validator: (value) {
                          if (value == '') {}
                          return null;
                        },
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: size.height * 0.08,
                        width: size.width * 0.1,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFF1264E3)),
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Text(
                            'ยกเลิก',
                            style: TextStyle(color: Color(0xFF1264E3), fontSize: 20),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.02,
                      ),
                      Container(
                        height: size.height * 0.08,
                        width: size.width * 0.1,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color(0xFF1264E3),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.print,
                              color: Colors.white,
                            ),
                            Text(
                              'พิมใบเสร็จ',
                              style: TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
