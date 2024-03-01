import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:possodexo/constants.dart';

class GiftVoucherwidgets extends StatefulWidget {
  GiftVoucherwidgets({
    super.key,
  });

  @override
  State<GiftVoucherwidgets> createState() => _GiftVoucherwidgetsState();
}

class _GiftVoucherwidgetsState extends State<GiftVoucherwidgets> {
  List<String> coupon = ["คูปองห้อง", "คูปองหน้าร้าน"];
  String? _selectedCoupon;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.2,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30, bottom: 30, top: 20),
            child: Row(
              children: [
                Text(
                  'การเลือกรูปแบบการลด',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFF424242),
                    fontFamily: 'IBMPlexSansThai',
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Container(
                  width: size.width * 0.2,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Color(0xFF78909C),
                      ),
                    ),
                    color: Color(0xFFFAFAFA),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      padding: EdgeInsets.only(left: 20),
                      hint: Text(
                        'ประเภทคูปอง',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF424242),
                          fontFamily: 'IBMPlexSansThai',
                        ),
                      ),
                      isExpanded: true,
                      items: coupon
                          .map((String item) => DropdownMenuItem<String>(
                                value: item,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 1.0),
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
                      value: _selectedCoupon,
                      onChanged: (v) {
                        setState(() {
                          _selectedCoupon = v ?? '';
                        });
                      },
                      underline: SizedBox(),
                      dropdownColor: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 30,
              ),
              Container(
                  width: size.width * 0.2,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Color(0xFF78909C),
                      ),
                    ),
                    color: Color(0xFFFAFAFA),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Gift Voucher',
                      prefixIcon: Icon(
                        Icons.search,
                        color: Color(0xFF616161),
                        size: 16,
                      ),
                    ),
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
