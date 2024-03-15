import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:possodexo/home/widgets/Multiplepeoduct.dart';
import 'package:possodexo/home/widgets/QuantityProduct.dart';
import 'package:possodexo/home/widgets/SingelProduct.dart';
import 'package:possodexo/models/productAttributeValue.dart';
import 'package:possodexo/models/product.dart';

class OpenDialogProduct extends StatefulWidget {
  OpenDialogProduct({
    super.key,
    required this.gridCoffee,
    // required this.pressclose,
    // required this.pressaccept,
    // required this.presscancel,
  });
  final Product gridCoffee;

  // final VoidCallback pressclose;
  // final VoidCallback pressaccept;
  // final VoidCallback presscancel;

  @override
  State<OpenDialogProduct> createState() => _OpenDialogProductState();
}

class _OpenDialogProductState extends State<OpenDialogProduct> {
  ProductAttributeValue? selected;
  ProductAttributeValue? singelProduct0;
  int? quantityProduct1;
  List<ProductAttributeValue>? multiplepeoduct2;

  int selectedIndex = 0;
  int? selectedPrice = 0;
  int? selectedIndex1;
  ProductAttributeValue? selectedSize;
  void selectSize(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  int qty = 0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AlertDialog(
      title: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.gridCoffee.name ?? '',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'IBMPlexSansThai',
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.close,
                  color: Colors.grey,
                ),
              )
            ],
          ),
          Divider(),
        ],
      ),
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(2))),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
              children: List.generate(
            widget.gridCoffee.productAttributes?.length ?? 0,
            (index) => widget.gridCoffee.productAttributes![index].type == "SINGLE"
                ? SingelProduct(
                    vicecall: (p0) {
                      setState(() {
                        singelProduct0 = p0;
                      });
                    },
                    productAttribute: widget.gridCoffee.productAttributes![index],
                  )
                : widget.gridCoffee.productAttributes![index].type == "QUANTITY"
                    ? QuantityProduct(
                        vicecall2: (p1) {
                          setState(() {
                            quantityProduct1 = p1;
                          });
                        },
                        productAttribute: widget.gridCoffee.productAttributes![index],
                      )
                    : widget.gridCoffee.productAttributes![index].type == "MULTIPLE"
                        ? Multiplepeoduct(
                            vicecall3: (p2) {
                              setState(() {
                                multiplepeoduct2 = p2;
                              });
                            },
                            productAttribute: widget.gridCoffee.productAttributes![index],
                          )
                        : SizedBox(),
            // (index) => Row(
            //   children: [
            //     SizedBox(
            //       width: size.width * 0.15,
            //       height: size.height * 0.04,
            //       child: Text(
            //         widget.gridCoffee.productAttributes![index].name,
            //         style: TextStyle(
            //           fontSize: 18,
            //           fontFamily: 'IBMPlexSansThai',
            //         ),
            //       ),
            //     ),
            //     SizedBox(
            //       width: size.width * 0.25,
            //       height: size.height * 0.065,
            //       child: Row(
            //         children: List.generate(
            //             widget.gridCoffee.productAttributes![index].productAttributeValues.length,
            //             (index2) => GestureDetector(
            //                   onTap: () {
            //                     // print(index2);
            //                     selectSize(index2);
            //                     selectedPrice = widget.gridCoffee.productAttributes![index].productAttributeValues[index2].price;
            //                     selectedSize = widget.gridCoffee.productAttributes![index].productAttributeValues[index2];
            //                     // print(selectedPrice);
            //                   },
            //                   child: Padding(
            //                     padding: const EdgeInsets.only(right: 10),
            //                     child: Container(
            //                       height: size.height * 0.12,
            //                       width: size.width * 0.03,
            //                       decoration: BoxDecoration(
            //                         color: selectedIndex == index2 ? Color(0xFFE8EAF6) : Colors.white,
            //                         borderRadius: BorderRadius.circular(6),
            //                         border: Border.all(color: Colors.blue),
            //                       ),
            //                       child: Center(
            //                         child: Text(
            //                           // ignore: unnecessary_string_interpolations
            //                           '${widget.gridCoffee.productAttributes![index].productAttributeValues[index2].name}',
            //                           style: TextStyle(
            //                             fontFamily: 'IBMPlexSansThai',
            //                           ),
            //                         ),
            //                       ),
            //                     ),
            //                   ),
            //                 )
            //                 ),
            //       ),
            //     ),
            //   ],
            // ),
          )),
        ],
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                  width: size.width * 0.08,
                  height: size.height * 0.05,
                  decoration: BoxDecoration(border: Border.all(color: Colors.blue), borderRadius: BorderRadius.circular(6)),
                  child: Center(
                      child: Text(
                    'ยกเลิก',
                    style: TextStyle(color: Colors.blue),
                  ))),
            ),
            SizedBox(
              width: 20,
            ),
            InkWell(
              onTap: () {
                if (selectedPrice == 0) {
                  setState(() {
                    selectedPrice = widget.gridCoffee.productAttributes?[0].productAttributeValues[0].price;
                    selectedSize = widget.gridCoffee.productAttributes?[0].productAttributeValues[0];
                  });
                }
                final out = {
                  'item': widget.gridCoffee,
                  'pricesize': selectedPrice,
                  'selectedSize': selectedSize,
                  "p0": singelProduct0,
                  "p1": quantityProduct1,
                  "p2": multiplepeoduct2,
                };
                Navigator.pop(context, out);
              },
              child: Container(
                  width: size.width * 0.08,
                  height: size.height * 0.05,
                  decoration: BoxDecoration(
                      border: Border.all(color: const Color.fromARGB(255, 103, 106, 108)),
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(6)),
                  child: Center(
                    child: Text(
                      'ตกลง',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
            )
          ],
        )
      ],
    );
  }
}
