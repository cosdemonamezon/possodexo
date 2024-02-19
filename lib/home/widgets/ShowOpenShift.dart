import 'package:flutter/material.dart';

class ShowOpenShift extends StatelessWidget {
  const ShowOpenShift({
    super.key,
    required this.size,
    required this.press
  });

  final Size size;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: size.height * 0.2,
          ),
          Center(
            child: Image.asset('assets/icons/Clock.png'),
          ),
          Text('Shift is closed'),
          Text('เปิดกะงานเพื่อทำการขาย'),
          SizedBox(
            height: size.height * 0.02,
          ),
          GestureDetector(
            onTap: press,
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
                  'เปิดกะงาน',
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                )),
              ),
            ),
          ),
        ],
      );
  }
}
