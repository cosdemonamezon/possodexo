import 'package:flutter/material.dart';

class MoneyDropDown extends StatefulWidget {
  const MoneyDropDown({super.key});

  @override
  State<MoneyDropDown> createState() => _MoneyDropDownState();
}

String money = "เงินสด";
List<String> general2 = [
  "เงินสด",
  "บัตรเครดิต/เดบิต",
  "QR Promptpay",
  "True Money",
  "LINE Pay",
  "Transfer",
  "Consignment",
  "บัตรพนักงาน  ",
  "แม่มณี",
  "อื่นๆ"
];

class _MoneyDropDownState extends State<MoneyDropDown> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: size.height * 0.1,
            width: size.width * 0.13,
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey)),
                borderRadius: BorderRadius.circular(2),
                color: Color(0xFFFFFAFAFA)),
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
                DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    items: general2
                        .map((String item) => DropdownMenuItem<String>(
                              value: item,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 1.0),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
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
                    value: money,
                    onChanged: (v) {
                      setState(() {
                        money = v!;
                      });
                    },
                    underline: SizedBox(),
                    dropdownColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: size.height * 0.1,
            width: size.width * 0.13,
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey)),
                borderRadius: BorderRadius.circular(2),
                color: Color(0xFFFFFAFAFA)),
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      Text(
                        "฿",
                        style: TextStyle(fontSize: 25),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: SizedBox(
                      width: size.width * 0.01,
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                        validator: (selectedItem) {
                          if (selectedItem == '') {
                            return "โปรดใส่ข้อความให้ครบถ้วน";
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: size.height * 0.1,
            width: size.width * 0.13,
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey)),
                borderRadius: BorderRadius.circular(2),
                color: Color(0xFFFFFAFAFA)),
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Opacity(
                        opacity: 0.5,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 3),
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
                    padding: const EdgeInsets.only(top: 5),
                    child: SizedBox(
                      width: size.width * 0.01,
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                        validator: (selectedItem) {
                          if (selectedItem == '') {
                            return "โปรดใส่ข้อความให้ครบถ้วน";
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
