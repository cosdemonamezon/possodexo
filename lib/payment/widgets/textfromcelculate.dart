import 'package:flutter/material.dart';

class Textformfildcelculate extends StatefulWidget {
  Textformfildcelculate({super.key});

  @override
  State<Textformfildcelculate> createState() => _TextformfildcelculateState();
}

class _TextformfildcelculateState extends State<Textformfildcelculate> {
  TextEditingController ai = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color(0xfffB0BEC5)),
      ),
      width: double.infinity,
      height: size.height * 0.09,
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "฿",
              style: TextStyle(fontSize: 25),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: SizedBox(
                width: size.width * 0.45,
                child: TextFormField(
                  controller: ai,
                  readOnly: true,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                  validator: (selectedItem) {
                    if (selectedItem == '') {
                      return "โปรดใส่ข้อความให้ครบถ้วน";
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
