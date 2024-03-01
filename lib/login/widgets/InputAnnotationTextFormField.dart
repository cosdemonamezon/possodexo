import 'package:flutter/material.dart';

class InputAnnotationTextFormField extends StatelessWidget {
  InputAnnotationTextFormField({
    super.key,
    required this.size,
    this.controller,
  });

  final Size size;
  TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color.fromARGB(255, 241, 241, 241),
        width: size.width * 0.35,
        child: TextFormField(
          style: TextStyle(fontSize: 22),
          controller: controller,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 10),
            hintText: 'หมายเหตุ',
            hintStyle: TextStyle(fontSize: 22),
          ),
        ));
  }
}
