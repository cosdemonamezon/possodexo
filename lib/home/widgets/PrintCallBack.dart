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
    return Column(
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
            )),
      ],
    );
  }
}
