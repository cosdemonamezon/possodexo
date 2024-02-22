import 'package:flutter/material.dart';
import 'package:possodexo/constants.dart';
import 'package:possodexo/login/widgets/InputAnnotationTextFormField.dart';
import 'package:possodexo/login/widgets/InputChangeTextFormField.dart';
import 'package:possodexo/login/widgets/InputTextFormField.dart';

import '../../login/widgets/InputCounterDropDownFormField.dart';

class OpenSalesShift extends StatelessWidget {
  const OpenSalesShift({
    super.key,
    required this.size,
    required this.pressOk,
    required this.pressCancel,
    required this.pressClose,
  });

  final Size size;
  final VoidCallback pressOk;
  final VoidCallback pressCancel;
  final VoidCallback pressClose;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      surfaceTintColor: Colors.white,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(2))),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('เปิดกะงานขาย'),
          IconButton(onPressed: pressClose, icon: Icon(Icons.close)),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: size.width * 0.2,
                child: Text(
                  'พนักงาน',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              InputTextFormField(size: size),
            ],
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: size.width * 0.2,
                child: Text(
                  'เคาเตอร์',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              InputCounterDropDownFormField(size: size),
            ],
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: size.width * 0.2,
                child: Text(
                  'เงินทอนเริ่มต้น (เงินสดยกมา)',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              InputChangeTextFormField(size: size),
            ],
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: size.width * 0.2,
                child: Text(
                  'ยอดนับเงินสด (Cash Drawer)',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              InputChangeTextFormField(size: size),
            ],
          ),
          SizedBox(
            height: size.height * 0.01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: size.width * 0.2,
                child: Text(
                  'หมายเหตุ',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              InputAnnotationTextFormField(size: size),
            ],
          ),
        ],
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: pressCancel,
              child: Card(
                surfaceTintColor: Colors.white,
                color: Colors.white,
                //color: Colors.blue,
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    side: BorderSide(color: kButtonColor)),

                child: Container(
                  width: size.width * 0.12,
                  height: size.height * 0.06,
                  child: Center(
                      child: Text(
                    'ยกเลิก',
                    style: TextStyle(
                        color: kButtonColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  )),
                ),
              ),
            ),
            SizedBox(
              width: 10,
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
                  width: size.width * 0.12,
                  height: size.height * 0.06,
                  child: Center(
                      child: Text(
                    'ยืนยัน',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
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
