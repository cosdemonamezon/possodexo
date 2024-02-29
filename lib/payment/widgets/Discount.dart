import 'package:flutter/material.dart';

class DiscountWidgets extends StatefulWidget {
  const DiscountWidgets({super.key});

  @override
  State<DiscountWidgets> createState() => _DiscountWidgetsState();
}

class _DiscountWidgetsState extends State<DiscountWidgets> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [Text('การเลือกรูปแบบการลด')],
      ),
    );
  }
}
