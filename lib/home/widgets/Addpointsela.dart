import 'package:flutter/material.dart';
import 'package:possodexo/login/widgets/InputAnnotationTextFormField.dart';
import 'package:possodexo/login/widgets/InputCounterDropDownFormField.dart';
import 'package:possodexo/login/widgets/InputTextFormField.dart';

import '../../constants.dart';

class Addpointsela extends StatelessWidget {
  const Addpointsela({
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
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8))),
      surfaceTintColor: Colors.white,
      backgroundColor: Colors.white,
      title: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'เพิ่มจุดขาย POS',
                style: TextStyle(
                  fontSize: 22,
                  fontFamily: 'IBMPlexSansThai',
                ),
              ),
              Icon(
                Icons.close,
              )
            ],
          ),
          Divider(
            color: Color(0xFF78909C),
          )
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
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
          SizedBox(height: size.height * 0.023),
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
          SizedBox(height: size.height * 0.023),
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
