import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisTextFormField extends StatelessWidget {
  RegisTextFormField({
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
          controller: controller,
          onTap: () async {
            await SystemChrome.setEnabledSystemUIMode(
              SystemUiMode.immersiveSticky,
            );
          },
          style: TextStyle(fontSize: 22),
          decoration: InputDecoration(
            hintText: 'รหัสผ่าน',
            hintStyle: TextStyle(fontSize: 22),
            prefixIcon: Icon(Icons.local_mall),
            suffixIcon: Icon(Icons.remove_red_eye),
          ),
        ));
  }
}
