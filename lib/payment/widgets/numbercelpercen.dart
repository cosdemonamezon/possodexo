import 'package:flutter/material.dart';

class Numbercelpercen extends StatefulWidget {
  Numbercelpercen({super.key, this.ai});
  TextEditingController? ai = TextEditingController();

  @override
  State<Numbercelpercen> createState() => _NumbercelpercenState();
}

class _NumbercelpercenState extends State<Numbercelpercen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Color(0xfffB0BEC5)),
          ),
          width: double.infinity,
          height: size.height * 0.09,
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "%",
                  style: TextStyle(fontSize: 25),
                ),
                SizedBox(
                  width: size.width * 0.45,
                  child: TextFormField(
                    controller: widget.ai,
                    readOnly: true,
                    decoration: InputDecoration(
                      hintText: ' 0',
                      border: InputBorder.none,
                    ),
                    validator: (selectedItem) {
                      if (selectedItem == '') {
                        return "โปรดใส่ข้อความให้ครบถ้วน";
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 1, right: 1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // implement the number keys (from 0 to 9) with the NumberButton widget
                    // the NumberButton widget is defined in the bottom of this file
                    children: [
                      SizedBox(
                        width: size.width * 0.1,
                        height: size.height * 0.08,
                        child: NumberButton(
                          number: '7',
                          size: 10,
                          color: Color(0xFFCFD8DC),
                          controller: widget.ai!,
                          onPressed: () {
                            widget.ai!.text += '7';
                          },
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      SizedBox(
                        width: size.width * 0.1,
                        height: size.height * 0.08,
                        child: NumberButton(
                          number: '8',
                          size: 10,
                          color: Color(0xFFCFD8DC),
                          controller: widget.ai!,
                          onPressed: () {
                            widget.ai!.text += '8';
                          },
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      SizedBox(
                        width: size.width * 0.1,
                        height: size.height * 0.08,
                        child: NumberButton(
                          number: '9',
                          size: 10,
                          color: Color(0xFFCFD8DC),
                          controller: widget.ai!,
                          onPressed: () {
                            widget.ai!.text += '9';
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: size.width * 0.1,
                        height: size.height * 0.08,
                        child: NumberButton(
                          number: '4',
                          size: 10,
                          color: Color(0xFFCFD8DC),
                          controller: widget.ai!,
                          onPressed: () {
                            widget.ai!.text += '4';
                          },
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      SizedBox(
                        width: size.width * 0.1,
                        height: size.height * 0.08,
                        child: NumberButton(
                          number: '5',
                          size: 10,
                          color: Color(0xFFCFD8DC),
                          controller: widget.ai!,
                          onPressed: () {
                            widget.ai!.text += '5';
                          },
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      SizedBox(
                        width: size.width * 0.1,
                        height: size.height * 0.08,
                        child: NumberButton(
                          number: '6',
                          size: 10,
                          color: Color(0xFFCFD8DC),
                          controller: widget.ai!,
                          onPressed: () {
                            widget.ai!.text += '6';
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: size.width * 0.1,
                        height: size.height * 0.08,
                        child: NumberButton(
                          number: '1',
                          size: 10,
                          color: Color(0xFFCFD8DC),
                          controller: widget.ai!,
                          onPressed: () {
                            widget.ai!.text += '1';
                          },
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      SizedBox(
                        width: size.width * 0.1,
                        height: size.height * 0.08,
                        child: NumberButton(
                          number: '2',
                          size: 10,
                          color: Color(0xFFCFD8DC),
                          controller: widget.ai!,
                          onPressed: () {
                            widget.ai!.text += '2';
                          },
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      SizedBox(
                        width: size.width * 0.1,
                        height: size.height * 0.08,
                        child: NumberButton(
                          number: '3',
                          size: 10,
                          color: Color(0xFFCFD8DC),
                          controller: widget.ai!,
                          onPressed: () {
                            widget.ai!.text += '3';
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      SizedBox(
                        width: size.width * 0.1,
                        height: size.height * 0.08,
                        child: NumberButton(
                          number: '00',
                          size: 10,
                          color: Color(0xFFCFD8DC),
                          controller: widget.ai!,
                          onPressed: () {
                            widget.ai!.text += '00';
                          },
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      SizedBox(
                        width: size.width * 0.1,
                        height: size.height * 0.08,
                        child: NumberButton(
                          number: '0',
                          size: 10,
                          color: Color(0xFFCFD8DC),
                          controller: widget.ai!,
                          onPressed: () {
                            widget.ai!.text += '0';
                          },
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.01,
                      ),
                      SizedBox(
                        width: size.width * 0.1,
                        height: size.height * 0.08,
                        child: NumberButton(
                          number: '.',
                          size: 10,
                          color: Color(0xFFCFD8DC),
                          controller: widget.ai!,
                          onPressed: () {
                            widget.ai!.text += '.';
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  SizedBox(height: 4),
                ],
              ),
              SizedBox(
                width: size.width * 0.01,
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: InkWell(
                      onTap: () {
                        // ตรวจสอบว่ามีตัวอักษรใน TextFormField หรือไม่
                        widget.ai!.text = widget.ai!.text.substring(0, widget.ai!.text.length - 1); // ลบตัวอักษรที่สุดท้ายออก
                      },
                      child: SizedBox(
                        width: size.width * 0.08,
                        height: size.height * 0.2,
                        child: NumberButton(
                          number: '<',
                          size: 10,
                          color: Color(0xFFCFD8DC),
                          controller: widget.ai!,
                          onPressed: () {
                            if (widget.ai!.text.isNotEmpty) {
                              widget.ai!.text = widget.ai!.text.substring(0, widget.ai!.text.length - 1);
                            }
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.08,
                    height: size.height * 0.2,
                    child: NumberButton(
                      number: 'C',
                      size: 10,
                      color: Color(0xFFCFD8DC),
                      controller: widget.ai!,
                      onPressed: () {
                        widget.ai!.text = '';
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class NumberButton extends StatelessWidget {
  final String number;
  final double size;
  final Color color;
  final TextEditingController controller;
  final Function() onPressed;

  const NumberButton({
    Key? key,
    required this.number,
    required this.size,
    required this.color,
    required this.controller,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(size / 2),
          ),
        ),
        onPressed: onPressed,
        child: Center(
          child: Text(
            number.toString(),
            style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25),
          ),
        ),
      ),
    );
  }
}
