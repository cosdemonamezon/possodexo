import 'package:flutter/material.dart';
import 'package:possodexo/models/productAttribute.dart';
import 'package:possodexo/models/productAttributeValue.dart';

class QuantityProduct extends StatefulWidget {
  const QuantityProduct({
    super.key,
    required this.productAttribute,
    // required this.qty,
  });

  final ProductAttribute productAttribute;
  // final int qty = 0;

  @override
  State<QuantityProduct> createState() => _QuantityProductState();
}

class _QuantityProductState extends State<QuantityProduct> {
  ProductAttributeValue? selected2;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      children: [
        Row(
          children: [Text(widget.productAttribute.name)],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                InkWell(
                  // onTap: () {
                  //   if (selectedItem[index].product.qty > 1) {
                  //     setState(() {
                  //       selectedItem[index].product.qty = selectedItem[index].product.qty - 1;
                  //       final price = double.parse((selectedItem[index].product.price! * selectedItem[index].product.qty).toString());
                  //     });
                  //   }
                  // },
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
                // Text("${selectedItem[index].product.qty}"),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  // onTap: () {
                  //   if (selectedItem[index].product.qty >= 1) {
                  //     setState(() {
                  //       selectedItem[index].product.qty = selectedItem[index].product.qty + 1;
                  //       final price = double.parse((selectedItem[index].product.price! * selectedItem[index].product.qty).toString());
                  //       totleqty = selectedItem[index].product.qty;
                  //     });
                  //   }
                  // },
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
          ],
        ),
      ],
    );
  }
}
