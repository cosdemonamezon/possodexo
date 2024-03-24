import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:possodexo/home/service/productController.dart';
import 'package:possodexo/models/shift.dart';
import 'package:provider/provider.dart';

class InputChangeTextFormField extends StatefulWidget {
  InputChangeTextFormField({
    super.key,
    required this.size,
    this.controller,
  });

  final Size size;
  TextEditingController? controller;

  @override
  State<InputChangeTextFormField> createState() =>
      _InputChangeTextFormFieldState();
}

class _InputChangeTextFormFieldState extends State<InputChangeTextFormField> {
  int selectedIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductController>(
      builder: (context, productController, child) => Container(
          color: Color.fromARGB(255, 241, 241, 241),
          width: widget.size.width * 0.35,
          child: TextFormField(
            controller: widget.controller,
            style: TextStyle(fontSize: 22),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 10),
              hintText: productController.shift?.cash.toString() ?? '',
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
          )),
    );
  }
}
