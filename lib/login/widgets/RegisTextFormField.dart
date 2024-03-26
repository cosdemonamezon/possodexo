import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegisTextFormField extends StatefulWidget {
  RegisTextFormField({
    super.key,
    required this.size,
    this.controller,
    this.isPassword = false,
  });

  final Size size;
  TextEditingController? controller;
  final bool isPassword;

  @override
  State<RegisTextFormField> createState() => _RegisTextFormFieldState();
}

class _RegisTextFormFieldState extends State<RegisTextFormField> {
  late bool _show = true;
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color.fromARGB(255, 241, 241, 241),
        width: widget.size.width * 0.35,
        child: TextFormField(
          controller: widget.controller,
          onTap: () async {
            await SystemChrome.setEnabledSystemUIMode(
              SystemUiMode.immersiveSticky,
            );
          },
          style: TextStyle(fontSize: 22),
          obscureText: widget.isPassword ? _show : false,
          decoration: InputDecoration(
            hintText: 'รหัสผ่าน',
            hintStyle: TextStyle(fontSize: 22),
            prefixIcon: Icon(Icons.local_mall),
            suffixIcon: widget.isPassword
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        _show = !_show;
                      });
                    },
                    child: _show ? Image.asset('assets/icons/eye.png') : Image.asset('assets/icons/eye-slash.png'),
                  )
                : null,
          ),
        ));
  }
}
