import 'package:flutter/material.dart';

class Addpayment extends StatefulWidget {
  Addpayment({
    Key? key,
    required this.size,
    required this.general2,
    required this.money,
    required this.seclecpayment,
  }) : super(key: key);

  final Size size;
  final List<String> general2;
  final String money;
  final ValueChanged<String?> seclecpayment;

  @override
  State<Addpayment> createState() => _AddpaymentState();
}

class _AddpaymentState extends State<Addpayment> {
  List<Map<String, String>> dataadd = [];
  List<String?> selectedValues = [];
  List<TextEditingController> textControllers = [];

  @override
  void initState() {
    super.initState();
    addPaddingAndRow();
  }

  void addPaddingAndRow() {
    setState(() {
      dataadd.add({"addgeneral2": widget.money, "payCash": "", "notation": ""});
      textControllers.add(TextEditingController());
      selectedValues.add(widget.money);
    });
  }

  @override
  void dispose() {
    for (var controller in textControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: widget.size.height * 0.5,
          child: SingleChildScrollView(
            child: Column(
              children: List.generate(
                dataadd.length,
                (index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: widget.size.height * 0.1,
                        width: widget.size.width * 0.13,
                        decoration: BoxDecoration(
                          border:
                              Border(bottom: BorderSide(color: Colors.grey)),
                          borderRadius: BorderRadius.circular(2),
                          color: Color(0xFFFFFAFAFA),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Opacity(
                              opacity: 0.5,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 5, top: 3),
                                child: Text(
                                  'วิธีการชำระเงิน',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontFamily: 'IBMPlexSansThai',
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: widget.size.height * 0.06,
                              width: widget.size.width * 0.2,
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  isExpanded: true,
                                  items: widget.general2
                                      .map((String item) =>
                                          DropdownMenuItem<String>(
                                            value: item,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 1.0),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  item,
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ))
                                      .toList(),
                                  value: selectedValues[index],
                                  onChanged: (newValue) {
                                    setState(() {
                                      selectedValues[index] = newValue;
                                    });
                                    widget.seclecpayment(newValue);
                                  },
                                  underline: SizedBox(),
                                  dropdownColor: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: widget.size.height * 0.1,
                        width: widget.size.width * 0.13,
                        decoration: BoxDecoration(
                          border:
                              Border(bottom: BorderSide(color: Colors.grey)),
                          borderRadius: BorderRadius.circular(2),
                          color: Color(0xFFFFFAFAFA),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Opacity(
                                    opacity: 0.5,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 3),
                                      child: Text(
                                        'วิธีการชำระเงิน',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: 'IBMPlexSansThai',
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "฿",
                                    style: TextStyle(fontSize: 25),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: SizedBox(
                                      width: widget.size.width * 0.09,
                                      child: TextFormField(
                                        controller: textControllers[index],
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                        ),
                                        validator: (selectedItem) {
                                          if (selectedItem == '') {}
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: widget.size.height * 0.1,
                        width: widget.size.width * 0.13,
                        decoration: BoxDecoration(
                          border:
                              Border(bottom: BorderSide(color: Colors.grey)),
                          borderRadius: BorderRadius.circular(2),
                          color: Color(0xFFFFFAFAFA),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Opacity(
                                  opacity: 0.5,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.only(top: 3, left: 10),
                                    child: Text(
                                      'หมายเหตุ',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'IBMPlexSansThai',
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: SizedBox(
                                width: widget.size.width * 0.5,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                  validator: (selectedItem) {
                                    if (selectedItem == '') {}
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: widget.size.height * 0.02,
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff1264E3)),
                  borderRadius: BorderRadius.circular(8),
                ),
                height: widget.size.height * 0.05,
                width: widget.size.width * 0.1,
                child: Padding(
                  padding: const EdgeInsets.only(left: 35, top: 10),
                  child: Text(
                    "ชำระทั้งหมด",
                    style: TextStyle(color: Color(0xff1264E3)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: GestureDetector(
                onTap: addPaddingAndRow,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xff1264E3)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  height: widget.size.height * 0.05,
                  width: widget.size.width * 0.14,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 15,
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/icons/PlusCircle.png",
                          scale: 20,
                        ),
                        SizedBox(
                          width: widget.size.width * 0.01,
                        ),
                        Text(
                          "เพิ่มวิธีการชำระเงิน",
                          style: TextStyle(color: Color(0xff1264E3)),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}


// class ListData extends StatelessWidget {
//   const ListData({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
