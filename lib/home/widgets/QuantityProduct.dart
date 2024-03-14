import 'package:flutter/material.dart';
import 'package:possodexo/models/productAttribute.dart';
import 'package:possodexo/models/productAttributeValue.dart';

class QuantityProduct extends StatefulWidget {
  const QuantityProduct({Key? key, required this.productAttribute, required this.vicecall2}) : super(key: key);

  final ProductAttribute productAttribute;
  final Function(int) vicecall2;
  @override
  State<QuantityProduct> createState() => _QuantityProductState();
}

class _QuantityProductState extends State<QuantityProduct> {
  int qty2 = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      children: [
        Row(
          children: [Text(widget.productAttribute.name)],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 75, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    if (qty2 > 0) {
                      qty2--;
                    }
                  });
                  widget.vicecall2(qty2);
                },
                child: Container(
                  width: size.width * 0.02,
                  height: 30,
                  decoration: BoxDecoration(color: Color(0xFFCFD8DC), borderRadius: BorderRadius.circular(6)),
                  child: Icon(
                    Icons.remove,
                    size: 15,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text("$qty2"),
              SizedBox(
                width: 10,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    qty2++;
                  });
                  widget.vicecall2(qty2);
                },
                child: Container(
                  width: size.width * 0.02,
                  height: 30,
                  decoration: BoxDecoration(color: Color(0xFFCFD8DC), borderRadius: BorderRadius.circular(6)),
                  child: Icon(
                    Icons.add,
                    size: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
