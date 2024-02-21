import 'package:flutter/material.dart';

class InputCounterDropDownFormField extends StatefulWidget {
  InputCounterDropDownFormField({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  _InputCounterDropDownFormFieldState createState() =>
      _InputCounterDropDownFormFieldState();
}

class _InputCounterDropDownFormFieldState
    extends State<InputCounterDropDownFormField> {
  List<String> counter = [
    "เคาเตอร์ 1",
    "เคาเตอร์ 2",
    "เคาเตอร์ 3",
  ];
  String? selected;
  void onTapProduct(int index) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 241, 241, 241),
      ),
      width: widget.size.width * 0.35,
      child: DropdownButtonFormField<String>(
        isExpanded: true,
        items: counter
            .map((String item) => DropdownMenuItem<String>(
                  value: item,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 1.0),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        item,
                        style: TextStyle(
                          fontFamily: 'IBMPlexSansThai',
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ),
                ))
            .toList(),
        value: selected,
        onChanged: (v) {
          setState(() {
            selected = v;
          });
        },
        hint: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(
            'เลือกเคาเตอร์',
            style: TextStyle(
              fontFamily: 'IBMPlexSansThai',
              fontSize: 20,
            ),
          ),
        ),
        dropdownColor: Colors.white,
      ),
    );
  }
}
