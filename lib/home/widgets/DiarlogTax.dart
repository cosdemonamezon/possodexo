import 'package:flutter/material.dart';

class DiarlogTax extends StatefulWidget {
  const DiarlogTax({super.key});

  @override
  State<DiarlogTax> createState() => _DiarlogTaxState();
}

class _DiarlogTaxState extends State<DiarlogTax> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AlertDialog(
        surfaceTintColor: Colors.white,
        title: SizedBox(
          height: size.height * 0.3,
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
                      "assets/icons/XCircle.png",
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
                  Text("โปรดตรวจสอบและเตรียมกระดาษพิมพ์ให้เรียบร้อย\nก่อนการเปิดใช้งานฟังก์ชันการพิมพ์ใบกำกับภาษี", style: TextStyle(fontSize: 16))
                ],
              )
            ],
          ),
        ));
  }
}
