import 'package:flutter/material.dart';

class OpenDialogDessert extends StatefulWidget {
  const OpenDialogDessert({
    super.key,
    required this.gridCoffee,
    required this.pressclose,
    required this.presscancel,
    required this.pressaccept,
  });
  final Map<String, dynamic> gridCoffee;
  final VoidCallback pressclose;
  final VoidCallback presscancel;
  final VoidCallback pressaccept;

  @override
  State<OpenDialogDessert> createState() => _OpenDialogDessertState();
}

class _OpenDialogDessertState extends State<OpenDialogDessert> {
  int selectedIndex = 0;
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
                  widget.gridCoffee['name'],
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'IBMPlexSansThai',
                  ),
                ),
                InkWell(
                  onTap: widget.pressclose,
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
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(2))),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Container(
                  width: size.width * 0.15,
                  height: size.height * 0.04,
                  child: Text(
                    "ซอส",
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'IBMPlexSansThai',
                    ),
                  ),
                ),
                Container(
                  width: size.width * 0.25,
                  height: size.height * 0.065,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          selectSize(0);
                        },
                        child: Container(
                          height: size.height * 0.12,
                          width: size.width * 0.03,
                          decoration: BoxDecoration(
                            color: selectedIndex == 0
                                ? Color(0xFFE8EAF6)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: Colors.blue),
                          ),
                          child: Center(
                            child: Text(
                              'Yes',
                              style: TextStyle(
                                fontFamily: 'IBMPlexSansThai',
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          selectSize(1);
                        },
                        child: Container(
                          height: size.height * 0.12,
                          width: size.width * 0.03,
                          decoration: BoxDecoration(
                            color: selectedIndex == 1
                                ? Color(0xFFE8EAF6)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: Colors.blue),
                          ),
                          child: Center(
                            child: Text(
                              'No',
                              style: TextStyle(
                                fontFamily: 'IBMPlexSansThai',
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Container(
                  width: size.width * 0.15,
                  height: size.height * 0.04,
                  child: Text(
                    'โปรโมชั่น',
                    style: TextStyle(
                      fontFamily: 'IBMPlexSansThai',
                      fontSize: 18,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                        width: size.width * 0.25,
                        height: size.height * 0.04,
                        child: Text('แถม นมสด 1 ขวด')),
                  ],
                )
              ],
            )
          ],
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: widget.presscancel,
                child: Container(
                    width: size.width * 0.08,
                    height: size.height * 0.05,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.circular(6)),
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
                onTap: widget.pressaccept,
                child: Container(
                    width: size.width * 0.08,
                    height: size.height * 0.05,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue),
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
        ]);
  }
}
