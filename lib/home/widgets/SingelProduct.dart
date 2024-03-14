import 'package:flutter/material.dart';
import 'package:possodexo/models/productAttribute.dart';
import 'package:possodexo/models/productAttributeValue.dart';

class SingelProduct extends StatefulWidget {
  const SingelProduct({
    Key? key, // เพิ่ม Key เป็น parameter ของ constructor
    required this.productAttribute,
  }) : super(key: key); // ส่ง Key ไปยัง super constructor
  final ProductAttribute productAttribute;

  @override
  State<SingelProduct> createState() => _SingelProductState();
}

class _SingelProductState extends State<SingelProduct> {
  ProductAttributeValue? selected;
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: 100,
            child: Row(
              children: [Text(widget.productAttribute.name)],
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Wrap(
              children: List.generate(
                widget.productAttribute.productAttributeValues.length,
                (index) {
                  final productAttributeValue = widget.productAttribute.productAttributeValues[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (selectedIndex == index) {
                          selectedIndex = null;
                          selected = null;
                        } else {
                          selectedIndex = index;
                          selected = productAttributeValue;
                        }
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue),
                          borderRadius: BorderRadius.circular(8),
                          color: selectedIndex == index ? Color(0xffE8EAF6) : Colors.white,
                        ),
                        height: size.height * 0.05,
                        width: size.width * 0.03,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(productAttributeValue.name),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
