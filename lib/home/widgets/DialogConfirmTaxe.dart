import 'package:flutter/material.dart';

class DialogConfirmTaxe extends StatefulWidget {
  const DialogConfirmTaxe({super.key});

  @override
  State<DialogConfirmTaxe> createState() => _DiarlogTaxState();
}

class _DiarlogTaxState extends State<DialogConfirmTaxe> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AlertDialog(
        surfaceTintColor: Colors.white,
        title: SizedBox(
          height: size.height * 0.35,
          width: size.width * 0.3,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.close,
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  SizedBox(
                    child: Image.asset(
                      "assets/icons/Receipt.png",
                      scale: 10,
                    ),
                  ),
                  Text(
                    "ไม่พบข้อมูลเดียวกัน",
                    style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text("โปรดตรวจสอบและเตรียมกระดาษพิมพ์ให้เรียบร้อย\nก่อนการเปิดใช้งานฟังก์ชันการพิมพ์ใบกำกับภาษี", style: TextStyle(fontSize: 16)),
                  SizedBox(
                    height: size.height * 0.051,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: size.width * 0.09,
                        height: size.height * 0.05,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFF1264E3)),
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Text(
                            'ยกเลิก',
                            style: TextStyle(color: Color(0xFF1264E3), fontSize: 16),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.02,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: size.width * 0.09,
                          height: size.height * 0.05,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Color(0xFF1264E3),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'ยืนยัน',
                                style: TextStyle(color: Colors.white, fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
