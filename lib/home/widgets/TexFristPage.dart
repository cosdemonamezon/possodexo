import 'package:flutter/material.dart';
import 'package:possodexo/home/firstPage.dart';
import 'package:possodexo/home/widgets/DialogConfirmTaxe.dart';
import 'package:possodexo/home/widgets/DiarlogTax.dart';
import 'package:possodexo/home/widgets/texPage.dart';

class TexFristPage extends StatefulWidget {
  const TexFristPage({Key? key}) : super(key: key);

  @override
  State<TexFristPage> createState() => _TexFristPageState();
}

class _TexFristPageState extends State<TexFristPage> {
  final TextEditingController _controller = TextEditingController();
  bool openBill = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.01,
          ),
          Container(
            height: size.height * 0.85,
            width: size.width * 0.9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
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
                        width: size.width * 0.35,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: _controller,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xFFFAFAFA),
                              hintText: "ค้นหาเลขที่ใบกำกับภาษี",
                              prefixIcon: Icon(Icons.search, color: Color(0xFF78909C)),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (_controller.text == '1') {
                            setState(() {
                              Container(
                                width: size.width * 0.35,
                                height: size.height * 0.51,
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
                              );
                            });
                          } else {
                            showDialog(
                              context: context,
                              builder: (context) => DiarlogTax(),
                            );
                          }
                        },
                        child: Container(
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
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.1,
                ),
                _controller.text != "1"
                    ? SizedBox(
                        child: Column(
                          children: [
                            Image.asset(
                              "assets/icons/FileSearch.png",
                              scale: 10,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text("ค้นหาเลขใบเสร็จ", style: TextStyle(fontSize: 16)),
                            SizedBox(
                              height: 10,
                            ),
                            Text("โปรดตรวจสอบและเตรียมกระดาษพิมพ์ให้เรียบร้อย\nก่อนการเปิดใช้งานฟังก์ชันการพิมพ์ใบกำกับภาษี",
                                style: TextStyle(fontSize: 13))
                          ],
                        ),
                      )
                    : Container(
                        width: size.width * 0.35,
                        height: size.height * 0.51,
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
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Color(0xFFFAFAFA),
                                      hintText: "ที่อยู่",
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
                                  InkWell(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (context) => DialogConfirmTaxe(),
                                      );
                                    },
                                    child: Container(
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
          ),
        ],
      ),
    );
  }
}
