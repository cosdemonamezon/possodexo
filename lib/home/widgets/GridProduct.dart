import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:possodexo/home/widgets/OpenDialogDessert.dart';
import 'package:possodexo/home/widgets/Promotion.dart';

import 'OpenDialogProduct.dart';

class GridCoffee extends StatefulWidget {
  GridCoffee({
    super.key,
    required this.qty,
    required this.gridCoffee,
    required this.onChange,
  });

  int qty = 0;
  List<dynamic> gridCoffee = [];
  final ValueChanged onChange;
  @override
  State<GridCoffee> createState() => _GridCoffeeState();
}

class _GridCoffeeState extends State<GridCoffee> {
  int qty = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 10,
          mainAxisExtent: 150,
          mainAxisSpacing: 10,
        ),
        itemCount: widget.gridCoffee.length,
        itemBuilder: (_, index) {
          return InkWell(
            onTap: () async {
              if (widget.gridCoffee[index]['type'] == 'เครื่องดื่ม') {
                final item = await showDialog(
                    context: context,
                    builder: (context) => OpenDialogProduct(
                          gridCoffee: widget.gridCoffee[index],
                        ));
                if (item != null) {
                  inspect(item);
                  widget.onChange(item);
                }
              } else {
                final item = await showDialog(
                    context: context,
                    builder: (context) => OpenDialogDessert(
                          gridCoffee: widget.gridCoffee[index],
                        ));
                if (item != null) {
                  inspect(item);
                  widget.onChange(item);
                }
              }
            },
            child: Column(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Image.asset(
                        widget.gridCoffee[index]['image'],
                        width: size.width * 0.22,
                        height: size.height * 0.22,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4)),
                          child: Text(
                            widget.gridCoffee[index]['priceS']
                                .toStringAsFixed(2),
                            style: TextStyle(
                              fontFamily: 'IBMPlexSansThai',
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.18,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              height: size.height * 0.06,
                              width: double.maxFinite,
                              color: Color.fromARGB(60, 0, 0, 0),
                              child: Center(
                                  child: Text(
                                widget.gridCoffee[index]['name'],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'IBMPlexSansThai',
                                ),
                              )),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
