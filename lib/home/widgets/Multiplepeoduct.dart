import 'package:flutter/material.dart';
import 'package:possodexo/models/productAttribute.dart';
import 'package:possodexo/models/productAttributeValue.dart';

class Multiplepeoduct extends StatefulWidget {
  const Multiplepeoduct({
    Key? key, // ปรับเปลี่ยนการรับ Key
    required this.productAttribute,
  }) : super(key: key); // แก้ไขการส่ง key ให้กับ super constructor
  final ProductAttribute productAttribute;
  @override
  State<Multiplepeoduct> createState() => _MultiplepeoductState();
}

class _MultiplepeoductState extends State<Multiplepeoduct> {
  // ลบตัวแปร _isSelected และ selected เนื่องจากเราต้องการเลือกได้มากกว่าหนึ่งตัว
  List<bool> _isSelectedList = []; // เก็บสถานะการเลือกของแต่ละ Choice Chip

  @override
  void initState() {
    super.initState();
    // กำหนดค่าเริ่มต้นให้ List ของสถานะการเลือก
    _isSelectedList = List<bool>.filled(
      widget.productAttribute.productAttributeValues.length,
      false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.productAttribute.name),
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 8),
          child: Wrap(
            children: List.generate(
              widget.productAttribute.productAttributeValues.length,
              (index) => InkWell(
                onTap: () {
                  setState(() {
                    _isSelectedList[index] = !_isSelectedList[index];
                  });
                },
                child: Container(
                  margin: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: _isSelectedList[index] ? Color(0xffE8EAF6) : Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.blue),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(widget.productAttribute.productAttributeValues[index].name),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
