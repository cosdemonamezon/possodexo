import 'package:flutter/material.dart';
import 'package:possodexo/models/productAttribute.dart';
import 'package:possodexo/models/productAttributeValue.dart';

class SingelProduct extends StatefulWidget {
  const SingelProduct({
    super.key,
    required this.productAttribute,
  });
  final ProductAttribute productAttribute;

  @override
  State<SingelProduct> createState() => _SingelProductState();
}

class _SingelProductState extends State<SingelProduct> {
  ProductAttributeValue? selected;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      children: [
        Row(
          children: [Text(widget.productAttribute.name)],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Wrap(
            children: List.generate(
                widget.productAttribute.productAttributeValues.length,
                (index) => GestureDetector(
                      onTap: () {
                        selected = widget.productAttribute.productAttributeValues[index];
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Color(0xffE8EAF6),
                          ),
                          height: size.height * 0.05,
                          width: size.width * 0.02,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(widget.productAttribute.productAttributeValues[index].name),
                          ),
                        ),
                      ),
                    )),
          ),
        )
      ],
    );
  }
}
