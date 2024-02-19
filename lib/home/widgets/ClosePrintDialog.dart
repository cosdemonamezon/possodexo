import 'package:flutter/material.dart';
import 'package:possodexo/constants.dart';

class ClosePrintDialog extends StatelessWidget {
  const ClosePrintDialog({
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
      title: Column(
        children: [
          Image.asset('assets/icons/ReceiptX.png'),
          Text('ปิดใช้งานการพิมพ์ใบเสร็จ'),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('การปิดฟังก์ชันจะทำให้ระบบหยุดการพิมพ์ใบเสร็จ'),
          Text('สำหรับการชำระเงินของลูกค้า'),
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