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
  final List<Product> gridCoffee;
  final ValueChanged onChange;
  @override
  State<GridCoffee> createState() => _GridCoffeeState();
}

class _GridCoffeeState extends State<GridCoffee> {
  int qty = 0;
  @override
  void initState() {
    super.initState();
    getlistproduct(categoryid: widget.gridCoffee[0].id);
    inspect(widget.gridCoffee);
  }

  Future<void> getlistproduct({required int categoryid}) async {
    try {
      await context.read<ProductController>().getProduct(categoryid: categoryid);
    } on Exception catch (e) {
      inspect(e);
    }
  }

  Future<void> getproductbyId({required int productId}) async {
    try {
      await context.read<ProductController>().getproductById(productId: productId);
    } on Exception catch (e) {
      inspect(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<ProductController>(builder: (context, productController, child) {
      final productmains = productController.products;
      return Padding(
        padding: const EdgeInsets.all(18.0),
        child: productmains.isNotEmpty
            ? GridView.builder(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 10,
                  mainAxisExtent: 150,
                  mainAxisSpacing: 10,
                ),
                itemCount: productmains.length,
                itemBuilder: (_, index) {
                  return GestureDetector(
                    onTap: () async {
                      /// หน้าเลือกขนาด////////
                      await getproductbyId(productId: productmains[index].id);
                      if (!mounted) return;
                      if (productController.product != null) {
                        final item = await showDialog(
                            context: context,
                            builder: (context) {
                              return OpenDialogProduct(
                                gridCoffee: productController.product!,
                              );
                            });
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
                              Image.network(
                                productmains[index].image ?? 'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg',
                                width: size.width * 0.22,
                                height: size.height * 0.22,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) => Image.network(
                                  'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg',
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  padding: EdgeInsets.all(4),
                                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(4)),
                                  child: productmains[index].price != null
                                      ? Text(
                                          productmains[index].price!.toString(),
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
                                          child: productmains[index].name != null
                                              ? Text(
                                                  productmains[index].name!,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: 'IBMPlexSansThai',
                                                  ),
                                                )
                                              : Text(
                                                  '',
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
              )
            : SizedBox(),
      );
    });
  }
}
