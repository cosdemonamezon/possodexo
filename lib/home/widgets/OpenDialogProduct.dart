import 'package:flutter/material.dart';
import 'package:possodexo/models/product.dart';
import 'package:possodexo/models/productMain.dart';

import '../../constants.dart';

class OpenDialogProduct extends StatefulWidget {
  OpenDialogProduct({super.key, required this.gridCoffee, required this.productmains
      // required this.pressclose,
      // required this.pressaccept,
      // required this.presscancel,
      });
  final Product gridCoffee;
  final ProductMain productmains;
  // final VoidCallback pressclose;
  // final VoidCallback pressaccept;
  // final VoidCallback presscancel;

  @override
  State<OpenDialogProduct> createState() => _OpenDialogProductState();
}

class _OpenDialogProductState extends State<OpenDialogProduct> {
  int selectedIndex = 0;
  int? selectedPrice = 0;
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
                widget.productmains.name ?? '',
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
              widget.productmains.productAttribute.length,
              (index) => Row(
                children: [
                  Container(
                    width: size.width * 0.15,
                    height: size.height * 0.04,
                    child: Text(
                      "${widget.productmains.productAttribute[index].name}",
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'IBMPlexSansThai',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.25,
                    height: size.height * 0.065,
                    child: Row(
                      children: List.generate(
                        widget.productmains.productAttribute[index].attributeValues.length,
                        (index2) => widget.productmains.productAttribute[index].name != 'เพิ่มช็อต' &&
                                widget.productmains.productAttribute[index].name != 'Topping'
                            ? GestureDetector(
                                onTap: () {
                                  print(index2);
                                  selectSize(index2);
                                  selectedPrice = widget.productmains.productAttribute[index].attributeValues[index2].price;
                                  print(selectedPrice);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Container(
                                    height: size.height * 0.12,
                                    width: size.width * 0.03,
                                    decoration: BoxDecoration(
                                      color: selectedIndex == index2 ? Color(0xFFE8EAF6) : Colors.white,
                                      borderRadius: BorderRadius.circular(6),
                                      border: Border.all(color: Colors.blue),
                                    ),
                                    child: Center(
                                      child: Text(
                                        '${widget.productmains.productAttribute[index].attributeValues[index2].name}',
                                        style: TextStyle(
                                          fontFamily: 'IBMPlexSansThai',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : widget.productmains.productAttribute[index].name != 'Topping'
                                ? Container(
                                    height: 40,
                                    // height: size.height * 0.036,
                                    child: Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              if (qty > 0) {
                                                qty = qty - 1;
                                              }
                                            });
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
                                        Text("${qty}"),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            setState(() {
                                              qty = qty + 1;
                                            });
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
                                  )
                                : Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Container(
                                      height: size.height * 0.12,
                                      width: size.width * 0.04,
                                      decoration: BoxDecoration(
                                        // color: Color(0xFFE8EAF6),
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(6),
                                        border: Border.all(color: Colors.blue),
                                      ),
                                      child: Text(
                                        // ignore: unnecessary_string_interpolations
                                        '${widget.productmains.productAttribute[index].attributeValues[index2].name}',
                                        style: TextStyle(color: Colors.amber),
                                      ),
                                    ),
                                  ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
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
                    selectedPrice = widget.productmains.productAttribute[0].attributeValues[0].price;
                  });
                }
                final out = {'item': widget.gridCoffee, 'size': selectedIndex, 'pricesize': selectedPrice};
                Navigator.pop(context, out);
              },
              child: Container(
                  width: size.width * 0.08,
                  height: size.height * 0.05,
                  decoration: BoxDecoration(border: Border.all(color: Colors.blue), color: Colors.blue, borderRadius: BorderRadius.circular(6)),
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
