import 'package:flutter/material.dart';
import 'package:possodexo/constants.dart';
import 'package:possodexo/login/widgets/InputTextFormField.dart';

class OpenSalesShift extends StatelessWidget {
  const OpenSalesShift({
    super.key,
    required this.size,
    required this.pressOk,
    required this.pressCancel,
  });

  final Size size;
  final VoidCallback pressOk;
  final VoidCallback pressCancel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(2))),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('เปิดใช้งานการพิมพ์ใบเสร็จ'),
          IconButton(onPressed: () {}, icon: Icon(Icons.close)),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  flex: 4,
                  child: Column(
                    children: [
                      Text('พนักงาน'),
                      Text('เคาเตอร์'),
                      Text('เงินทอนเริ่มต้น (เงินสดยกมา)'),
                      Text('ยอดนับเงินสด (Cash Drawer)'),
                      Text('หมายเหตุ'),
                    ],
                  )),
              Expanded(
                  flex: 6,
                  child: Column(
                    children: [
                      InputTextFormField(size: size),
                      InputTextFormField(size: size),
                      InputTextFormField(size: size),
                      InputTextFormField(size: size),
                      InputTextFormField(size: size),
                    ],
                  )),
            ],
          ),
        ],
      ),
      actions: [
        Row(
          children: [
            GestureDetector(
              onTap: pressCancel,
              child: Card(
                //color: Colors.blue,
                elevation: 5,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0), side: BorderSide(color: kButtonColor)),

                child: Container(
                  width: size.width * 0.18,
                  height: size.height * 0.06,
                  child: Center(
                      child: Text(
                    'ยกเลิก',
                    style: TextStyle(color: kButtonColor, fontSize: 16, fontWeight: FontWeight.bold),
                  )),
                ),
              ),
            ),
            GestureDetector(
              onTap: pressOk,
              child: Card(
                color: Colors.blue,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Container(
                  width: size.width * 0.18,
                  height: size.height * 0.06,
                  child: Center(
                      child: Text(
                    'ยืนยัน',
                    style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                  )),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
