import 'package:flutter/material.dart';
import 'package:possodexo/models/productAttribute.dart';
import 'package:possodexo/models/productAttributeValue.dart';

class Multiplepeoduct extends StatefulWidget {
  const Multiplepeoduct({
    super.key,
    required this.productAttribute,
  });
  final ProductAttribute productAttribute;
  @override
  State<Multiplepeoduct> createState() => _MultiplepeoductState();
}

class _MultiplepeoductState extends State<Multiplepeoduct> {
  ProductAttributeValue? selected;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      children: [
        Row(
          children: [Text(widget.productAttribute.name)],
        ),
        Wrap(
          children: List.generate(
              widget.productAttribute.productAttributeValues.length,
              (index) => InkWell(
                    onTap: () {
                      selected = widget.productAttribute.productAttributeValues[index];
                    },
                    child: Container(
                      color: Color(0xffE8EAF6),
                      width: size.width * 0.06,
                      height: size.height * 0.06,
                    ),
                  )),
        )
      ],
    );
  }
}
