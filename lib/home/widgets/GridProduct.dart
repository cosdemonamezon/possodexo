import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:possodexo/home/service/productController.dart';
import 'package:possodexo/home/widgets/OpenDialogDessert.dart';
import 'package:possodexo/home/widgets/Promotion.dart';
import 'package:possodexo/models/product.dart';
import 'package:provider/provider.dart';

import 'OpenDialogProduct.dart';

class GridCoffee extends StatefulWidget {
  GridCoffee({
    super.key,
    required this.qty,
    required this.gridCoffee,
    required this.onChange,
  });

  int qty = 0;
  List<Product> gridCoffee = [];
  final ValueChanged onChange;
  @override
  State<GridCoffee> createState() => _GridCoffeeState();
}

class _GridCoffeeState extends State<GridCoffee> {
  int qty = 0;

//ดึงขอมูล ProductMain
  Future<void> getproductMain({required int id}) async {
    try {
      await context.read<ProductController>().getproductMain(id: id);
    } on Exception catch (e) {
      inspect(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<ProductController>(
        builder: (context, productController, child) {
      final productmains = productController.productMain;
      return Padding(
        padding: const EdgeInsets.all(18.0),
        child: widget.gridCoffee.isNotEmpty
            ? GridView.builder(
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
                  return GestureDetector(
                    onTap: () async {
                      // if (widget.gridCoffee[index]['type'] == 'เครื่องดื่ม') {
                      //   final item = await showDialog(
                      //       context: context,
                      //       builder: (context) => OpenDialogProduct(
                      //             gridCoffee: widget.gridCoffee[index],
                      //           ));
                      //   if (item != null) {
                      //     inspect(item);
                      //     widget.onChange(item);
                      //   }
                      // } else {
                      //   final item = await showDialog(
                      //       context: context,
                      //       builder: (context) => OpenDialogDessert(
                      //             gridCoffee: widget.gridCoffee[index],
                      //           ));
                      //   if (item != null) {
                      //     inspect(item);
                      //     widget.onChange(item);
                      //   }
                      // }

                      getproductMain(id: widget.gridCoffee[index].id);

                      if (productmains?.name == "กาแฟ") {
                        final item = await showDialog(
                            context: context,
                            builder: (context) {
                              return OpenDialogProduct(
                                  productmains: productmains!,
                                  gridCoffee: widget.gridCoffee[index]);
                            });
                        if (item != null) {
                          // inspect(item);
                          widget.onChange(item);
                        }
                      } else {
                        final item = await showDialog(
                          context: context,
                          builder: (context) => OpenDialogDessert(
                              gridCoffee: widget.gridCoffee[index]),
                        );
                        if (item != null) {
                          // inspect(item);
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
                                'assets/images/coffee2.png',
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
                                  child: widget.gridCoffee[index].sellprice !=
                                          null
                                      ? Text(
                                          widget.gridCoffee[index].sellprice!
                                              .toString(),
                                          style: TextStyle(
                                            fontFamily: 'IBMPlexSansThai',
                                          ),
                                        )
                                      : Text(
                                          '0.00',
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
                                          child:
                                              widget.gridCoffee[index].name !=
                                                      null
                                                  ? Text(
                                                      widget.gridCoffee[index]
                                                          .name!,
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontFamily:
                                                            'IBMPlexSansThai',
                                                      ),
                                                    )
                                                  : Text(
                                                      '',
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontFamily:
                                                            'IBMPlexSansThai',
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
              )
            : SizedBox(),
      );
    });
  }
}
