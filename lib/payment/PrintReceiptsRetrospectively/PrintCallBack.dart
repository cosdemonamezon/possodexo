import 'package:flutter/material.dart';

class PrintCallBack extends StatefulWidget {
  const PrintCallBack({super.key});

  @override
  State<PrintCallBack> createState() => _PrintCallBackState();
}

class _PrintCallBackState extends State<PrintCallBack> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Tax Page'),
      ),
      body: Container(
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
                  decoration: BoxDecoration(border: Border.all(color: Color(0xFF1264E3)), borderRadius: BorderRadius.circular(8)),
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
              height: size.height * 0.45,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Color(0xFFE8EAF6)),
              child: Column(
                children: [],
              ),
            )
          ],
        ),
      ),
    );
  }
}
