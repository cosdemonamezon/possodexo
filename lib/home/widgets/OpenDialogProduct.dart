import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:possodexo/home/widgets/Multiplepeoduct.dart';
import 'package:possodexo/home/widgets/QuantityProduct.dart';
import 'package:possodexo/home/widgets/SingelProduct.dart';
import 'package:possodexo/models/attributesdto.dart';
import 'package:possodexo/models/attributevaluesdto.dart';
import 'package:possodexo/models/orderitemsdto.dart';
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
  List<AttributeValuesDto> singelProduct0 = [];
  List<AttributeValuesDto> quantityProduct = [];
  List<AttributeValuesDto> multiplepeoduct = [];
  int? quantityProduct1;
  ProductAttributeValue? singelProduct1;
  List<ProductAttributeValue>? multiplepeoduct2;
  List<AttributesDto> attributes = [];
  OrderItemsDto? orderitemsdto;

  int selectedIndex = 0;
  int? selectedPrice = 0;
  int? selectedIndex1;
  ProductAttributeValue? selectedSize;
  void selectSize(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  double sum(List<AttributeValuesDto> attributesValue) => attributesValue.fold(0, (p, o) => p + o.price);
  double sumAttributes(List<AttributesDto> attributes) => attributes.fold(0, (p, o) => p + o.total);

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
                        singelProduct1 = p0;
                        final _attributesvaluedto = AttributeValuesDto(p0.name, 1, p0.price, p0.price.toDouble());
                        singelProduct0.insert(0, _attributesvaluedto);
                        if (singelProduct0.length > 1) {
                          singelProduct0.removeAt(1);
                        }
                      });
                    },
                    productAttribute: widget.gridCoffee.productAttributes![index],
                  )
                : widget.gridCoffee.productAttributes![index].type == "QUANTITY"
                    ? QuantityProduct(
                        vicecall2: (p1) {
                          setState(() {
                            quantityProduct1 = p1;
                            final _attributesvaluedto = AttributeValuesDto(
                                widget.gridCoffee.productAttributes![index].name,
                                p1,
                                widget.gridCoffee.productAttributes![index].productAttributeValues[0].price,
                                widget.gridCoffee.productAttributes![index].productAttributeValues[0].price.toDouble());
                            quantityProduct.insert(0, _attributesvaluedto);
                            if (quantityProduct.length > 1) {
                              quantityProduct.removeAt(1);
                            }
                          });
                        },
                        productAttribute: widget.gridCoffee.productAttributes![index],
                      )
                    : widget.gridCoffee.productAttributes![index].type == "MULTIPLE"
                        ? Multiplepeoduct(
                            vicecall3: (p2) {
                              setState(() {
                                multiplepeoduct2 = p2;
                                for (var i = 0; i < multiplepeoduct2!.length; i++) {
                                  final multiple = AttributeValuesDto(
                                      multiplepeoduct2![i].name, 1, multiplepeoduct2![i].price, multiplepeoduct2![i].price.toDouble());
                                  multiplepeoduct.add(multiple);
                                }
                              });
                            },
                            productAttribute: widget.gridCoffee.productAttributes![index],
                          )
                        : SizedBox(),
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
                if (singelProduct1 != null) {
                  if (selectedPrice == 0) {
                    setState(() {
                      selectedPrice = widget.gridCoffee.productAttributes?[0].productAttributeValues[0].price;
                      selectedSize = widget.gridCoffee.productAttributes?[0].productAttributeValues[0];

                      //จัดรูปแบบก่อนนำไปใช้สร้าง ออร์เดอร์
                      for (var i = 0; i < widget.gridCoffee.productAttributes!.length; i++) {
                        final _attributesdto = AttributesDto(
                          widget.gridCoffee.productAttributes![i].name,
                          widget.gridCoffee.productAttributes![i].type == "SINGLE"
                              ? sum(singelProduct0)
                              : widget.gridCoffee.productAttributes![i].type == "QUANTITY"
                                  ? sum(quantityProduct)
                                  : sum(multiplepeoduct),
                          widget.gridCoffee.productAttributes![i].type == "SINGLE"
                              ? singelProduct0
                              : widget.gridCoffee.productAttributes![i].type == "QUANTITY"
                                  ? quantityProduct
                                  : multiplepeoduct,
                        );
                        attributes.add(_attributesdto);
                      }
                    });
                    //inspect(attributes);
                    orderitemsdto =
                        OrderItemsDto(widget.gridCoffee.id, widget.gridCoffee.price!.toDouble(), sumAttributes(attributes), 1, attributes);
                  }

                  final out = {
                    'item': widget.gridCoffee,
                    'pricesize': selectedPrice,
                    'selectedSize': selectedSize,
                    "p0": singelProduct1,
                    "p1": quantityProduct1,
                    "p2": multiplepeoduct2,
                    'orderItems': orderitemsdto
                  };
                  Navigator.pop(context, out);
                } else {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: Text("ผิดพลาด"),
                          ));
                }
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
