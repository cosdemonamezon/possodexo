import 'package:flutter/material.dart';

class GridCoffee extends StatefulWidget {
  const GridCoffee({super.key});

  @override
  State<GridCoffee> createState() => _GridCoffeeState();
}

class _GridCoffeeState extends State<GridCoffee> {
  final List<Map<String, dynamic>> gridCoffee = [
    {
      'image': 'assets/images/coffee2.png',
      'price': '฿ 165.00',
      'name': 'Matcha Latte',
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
            mainAxisExtent: 250,
            mainAxisSpacing: 10,
          ),
          itemCount: gridCoffee.length,
          itemBuilder: (_, index) {
            return Column(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Image.asset(
                        gridCoffee[index]['image'],
                        width: size.width * 0.25,
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
                          ),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.22,
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
                                style: TextStyle(color: Colors.white),
                              )),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }
}
