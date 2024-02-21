import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputChangeTextFormField extends StatelessWidget {
  const InputChangeTextFormField({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color.fromARGB(255, 241, 241, 241),
        width: size.width * 0.35,
        child: TextFormField(
          style: TextStyle(fontSize: 22),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 10),
            hintText: '฿ 0.00',
            hintStyle: TextStyle(fontSize: 22),
          ),
          validator: (value) {
            if (value == '') {}
            return null;
          },
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly,
          ],
        ));
  }
}
