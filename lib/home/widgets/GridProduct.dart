import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:possodexo/home/service/productController.dart';
import 'package:possodexo/home/widgets/OpenDialogDessert.dart';
import 'package:possodexo/home/widgets/Promotion.dart';
import 'package:possodexo/home/widgets/inputNumberDialog.dart';
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
  final TextEditingController _myNumber = TextEditingController();
  int qty = 0;
  @override
  void initState() {
    super.initState();
    getproductMain(id: widget.gridCoffee[0].id);
  }

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
    return Consumer<ProductController>(builder: (context, productController, child) {
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

                      // await getproductMain(id: widget.gridCoffee[index].id);
                      // if (!mounted) return;

                      // ///////////////
                      // if (productmains?.name == "กาแฟ") {
                      //   final item = await showDialog(
                      //       context: context,
                      //       builder: (context) {
                      //         return OpenDialogProduct(
                      //             productmains: productmains!, gridCoffee: widget.gridCoffee[index]);
                      //       });
                      //   if (item != null) {
                      //     // inspect(item);
                      //     widget.onChange(item);
                      //   }
                      // } else {
                      //   final item = await showDialog(
                      //     context: context,
                      //     builder: (context) => OpenDialogDessert(gridCoffee: widget.gridCoffee[index]),
                      //   );
                      //   if (item != null) {
                      //     // inspect(item);
                      //     widget.onChange(item);
                      //   }
                      // }

                      final addQty = await showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0),
                          ),
                        ),
                        backgroundColor: Colors.white,
                        context: context,
                        isScrollControlled: true,
                        useRootNavigator: true,

                        /// add this line to show bottomsheet over navbar
                        builder: (BuildContext context) {
                          return Container(
                            height: size.height * 0.90,
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  SizedBox(height: 25),
                                  Padding(
                                    padding: EdgeInsets.all(5),
                                    child: SizedBox(
                                      height: size.height * 0.06,
                                      child: Center(
                                          child: TextField(
                                        controller: _myNumber,
                                        textAlign: TextAlign.center,
                                        showCursor: false,
                                        style: TextStyle(fontSize: 16.5),
                                        // Disable the default soft keybaord
                                        keyboardType: TextInputType.none,
                                      )),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  NumPad(
                                    buttonSize: 70,
                                    buttonColor: Colors.grey,
                                    iconColor: Colors.red,
                                    controller: _myNumber,
                                    // itemUnitPrices: products[index].itemUnitPrices!,
                                    delete: () {
                                      if (_myNumber.text.isNotEmpty) {
                                        _myNumber.text = _myNumber.text.substring(0, _myNumber.text.length - 1);
                                      }
                                    },
                                    // do something with the input numbers
                                    onSubmit: () {
                                      debugPrint('Your code: ${_myNumber.text}');
                                      Navigator.pop(context, _myNumber.text);
                                    },
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                      inspect(addQty);
                      if (addQty != '') {
                        widget.onChange(addQty);
                        _myNumber.clear();
                      }
                      // if (addQty != '') {
                      //   // setState(() {
                      //   //   //finalListProducts.clear();
                      //   //   try {
                      //   //     List<String> check = [];
                      //   //     for (var character in addQty.runes) {
                      //   //       String singleCharacter = String.fromCharCode(character);
                      //   //       // print(singleCharacter);
                      //   //       check.add(singleCharacter);
                      //   //     }
                      //   //     //inspect(check);

                      //   //     List<String> substrings = addQty.split('+');
                      //   //     for (var element in substrings) {
                      //   //       inspect(element);
                      //   //       widget.onChange(element);
                      //   //       // final out = {
                      //   //       //   'item': widget.gridCoffee,
                      //   //       //   'size': selectedIndex,
                      //   //       //   'pricesize': selectedPrice
                      //   //       // };
                      //   //       // Navigator.pop(context, out);
                      //   //       //products[index];
                      //   //       //final newProduct = Product.fromJson(products[index].toJson());
                      //   //       // final newProduct = Product(
                      //   //       //   products[index].item!.id!,
                      //   //       //   products[index].item!.atLeastStock,
                      //   //       //   products[index].item!.clientId,
                      //   //       //   products[index].item!.code,
                      //   //       //   products[index].item!.cost,
                      //   //       //   '', // products[index].createBy,
                      //   //       //   '', // products[index].details,
                      //   //       //   '', // products[index].image,
                      //   //       //   null, //  products[index].memberId,
                      //   //       //   products[index].item!.name,
                      //   //       //   products[index].item!.price,
                      //   //       //   products[index].item!.profit,
                      //   //       //   products[index].item!.status,
                      //   //       //   products[index].item!.stock,
                      //   //       //   products[index].item!.unit,
                      //   //       //   [], // products[index].itemUnitPrices,
                      //   //       //   products[index].item!.unitId,
                      //   //       //   '', // products[index].updateBy,
                      //   //       // );
                      //   //       // final newProduct = Product2(
                      //   //       //   products[index].item!.id!,
                      //   //       //   products[index].item!.atLeastStock,
                      //   //       //   products[index].item!.clientId,
                      //   //       //   products[index].item!.code,
                      //   //       //   products[index].item!.cost,
                      //   //       //   '', // products[index].createBy,
                      //   //       //   '', // products[index].details,
                      //   //       //   '', // products[index].image,
                      //   //       //   null, //  products[index].memberId,
                      //   //       //   products[index].item!.name,
                      //   //       //   products[index].price,
                      //   //       //   products[index].item!.profit,
                      //   //       //   products[index].item!.status,
                      //   //       //   products[index].item!.stock,
                      //   //       //   products[index].item!.unit,
                      //   //       //   [], // products[index].itemUnitPrices,
                      //   //       //   products[index].item!.unitId,
                      //   //       //   null, // products[index].updateBy,
                      //   //       //   null,
                      //   //       //   null,
                      //   //       //   null,
                      //   //       // );
                      //   //       // inspect(newProduct);
                      //   //       // // newProduct.qty = int.parse(substring2[0]);
                      //   //       // newProduct.qtyPack = double.parse(element);
                      //   //       // finalListProducts.add(newProduct);
                      //   //       _myNumber.clear();
                      //   //     }
                      //   //   } catch (e) {
                      //   //     // _myNumber.clear();
                      //   //     // showDialog(
                      //   //     //   context: context,
                      //   //     //   barrierDismissible: false,
                      //   //     //   builder: (BuildContext context) {
                      //   //     //     return AlertDialogYes(
                      //   //     //       title: 'แจ้งเตือน',
                      //   //     //       //description: 'รูปแบบข้อมูลไม่ถูกต้อง',
                      //   //     //       description: e.toString(),
                      //   //     //       pressYes: () {
                      //   //     //         Navigator.pop(context, true);
                      //   //     //       },
                      //   //     //     );
                      //   //     //   },
                      //   //     // );
                      //   //   }
                      //   // });
                      // } else {
                      //   setState(() {
                      //     _myNumber.clear();
                      //   });
                      // }
                    },
                    child: Column(
                      children: [
                        Expanded(
                          child: Stack(
                            children: [
                              Image.network(
                                'https://v4i.rweb-images.com/www.packnco.com/images/content/crop-1594181749784.png',
                                width: size.width * 0.22,
                                height: size.height * 0.4,
                                fit: BoxFit.fill,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  padding: EdgeInsets.all(4),
                                  decoration:
                                      BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(4)),
                                  child: widget.gridCoffee[index].sellprice != null
                                      ? Text(
                                          widget.gridCoffee[index].sellprice!.toString(),
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
                                          child: widget.gridCoffee[index].name != null
                                              ? Text(
                                                  widget.gridCoffee[index].name!,
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
