import 'package:flutter/material.dart';

class InputCounterDropDownFormField extends StatefulWidget {
  InputCounterDropDownFormField({
    Key? key,
    required this.size,
    this.selected,
    this.onValueChanged,
  }) : super(key: key);

  final Size size;
  final Function(dynamic selected)? onValueChanged;
  Map<String, dynamic>? selected;

  @override
  _InputCounterDropDownFormFieldState createState() =>
      _InputCounterDropDownFormFieldState();
}

class _InputCounterDropDownFormFieldState
    extends State<InputCounterDropDownFormField> {
  List<Map<String, dynamic>> counter = [
    {
      'name': 'เคาร์เตอร์ 1',
      'id': 1,
    },
    {
      'name': 'เคาร์เตอร์ 2',
      'id': 2,
    },
    {
      'name': 'เคาร์เตอร์ 3',
      'id': 3,
    },
  ];
  Map<String, dynamic>? selected;
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
      child: DropdownButtonFormField<Map<String, dynamic>>(
        isExpanded: true,
        items: counter
            .map(
              (Map<String, dynamic> item) =>
                  DropdownMenuItem<Map<String, dynamic>>(
                value: item,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 1.0),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      item['name'],
                      style: TextStyle(
                        fontFamily: 'IBMPlexSansThai',
                        fontSize: 22,
                      ),
                    ),
                  ),
                ),
              ),
            )
            .toList(),
        value: selected,
        onChanged: (v) {
          setState(() {
            selected = v;
            widget.onValueChanged!(v!['id']);
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
