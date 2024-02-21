import 'package:flutter/material.dart';
import 'package:possodexo/home/widgets/Promotion.dart';

import 'OpenDialogProduct.dart';

class GridCoffee extends StatefulWidget {
  GridCoffee({super.key, required this.qty});

  int qty = 0;
  @override
  State<GridCoffee> createState() => _GridCoffeeState();
}

class _GridCoffeeState extends State<GridCoffee> {
  int qty = 0;
  final List<Map<String, dynamic>> gridCoffee = [
    {
      'image': 'assets/images/coffee2.png',
      'price': '฿ 165.00',
      'name': 'Matcha Latte',
      'type': 'drink'
    },
    {
      'image': 'assets/images/coffee3.png',
      'price': '฿ 65.00',
      'name': 'Americano',
    },
    {
      'image': 'assets/images/coffee4.png',
      'price': '฿ 165.00',
      'name': 'Matcha Latte',
    },
    {
      'image': 'assets/images/coffee5.png',
      'price': '฿ 65.00',
      'name': 'Americano',
    },
    {
      'image': 'assets/images/coffee6.png',
      'price': '฿ 165.00',
      'name': 'Americano',
    },
    {
      'image': 'assets/images/coffee7.png',
      'price': '฿ 65.00',
      'name': 'Matcha Latte',
    },
    {
      'image': 'assets/images/coffee8.png',
      'price': '฿ 165.00',
      'name': 'Americano',
    },
    {
      'image': 'assets/images/coffee9.png',
      'price': '฿ 65.00',
      'name': 'Matcha Latte',
    },
    {
      'image': 'assets/images/coddee10.png',
      'price': '฿ 165.00',
      'name': 'Americano',
    },
    {
      'image': 'assets/images/coffee9.png',
      'price': '฿ 65.00',
      'name': 'Matcha Latte',
    },
    {
      'image': 'assets/images/coffee9.png',
      'price': '฿ 165.00',
      'name': 'Americano',
    },
    {
      'image': 'assets/images/coffee9.png',
      'price': '฿ 65.00',
      'name': 'Matcha Latte',
    },
    {
      'image': 'assets/images/coffee9.png',
      'price': '฿ 165.00',
      'name': 'Americano',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 10,
          mainAxisExtent: 180,
          mainAxisSpacing: 10,
        ),
        itemCount: gridCoffee.length,
        itemBuilder: (_, index) {
          return InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => OpenDialogProduct(
                  gridCoffee: gridCoffee[index],
                  pressaccept: () {
                    Navigator.pop(context, true);
                  },
                  presscancel: () {
                    Navigator.pop(context, false);
                  },
                  pressclose: () {
                    Navigator.pop(context, false);
                  },
                ),
              );
            },
            child: Column(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Image.asset(
                        gridCoffee[index]['image'],
                        width: size.width * 0.25,
                        height: size.height * 0.26,
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
                            gridCoffee[index]['price'],
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
                              height: size.height * 0.1,
                              width: double.maxFinite,
                              color: Color.fromARGB(60, 0, 0, 0),
                              child: Center(
                                  child: Text(
                                gridCoffee[index]['name'],
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
