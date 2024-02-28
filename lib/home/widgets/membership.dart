import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:possodexo/constants.dart';
import 'package:possodexo/extension/dateExtension.dart';
import 'package:possodexo/home/widgets/ClosePrintDialog.dart';
import 'package:possodexo/home/widgets/PolicyPage.dart';

class Membership extends StatefulWidget {
  const Membership({
    super.key,
    required this.closeblack,
  });
  final VoidCallback closeblack;
  @override
  State<Membership> createState() => _MembershipState();
}

class _MembershipState extends State<Membership> {
  var _hover = false;
  bool? Ichecked = false;
  DateTime? dateTime;
  List<String> antecedent = ["นาย", "นาง", "นางสาว"];
  String? name;
  void onItemTapped2(int index) {
    setState(() {});
  }

  List<String> nationality = ["ไทย", "พม๋า", "ลาว"];
  String lang = "ไทย";

  List<String> general = ["ไม่ระบุ", "ชาย", "หญิง"];
  String sex = "ไม่ระบุ";
  void onItemTapped1(int index) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AlertDialog(
      surfaceTintColor: Colors.white,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(2))),
      title: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'สมัครสมาชิก',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              InkWell(
                onTap: widget.closeblack,
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
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: size.width * 0.15,
                  height: size.height * 0.1,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      bottom: BorderSide(width: 2, color: Color(0xff78909C)),
                    ),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      hint: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Text("คำนำหน้า"),
                      ),
                      isExpanded: true,
                      items: antecedent
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
                      value: name,
                      onChanged: (v) {
                        setState(() {
                          name = v;
                        });
                      },
                      underline: SizedBox(),
                      dropdownColor: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  width: size.width * 0.009,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      bottom: BorderSide(width: 2, color: Color(0xff78909C)),
                    ),
                  ),
                  width: size.width * 0.15,
                  height: size.height * 0.1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "ชื่อ",
                      ),
                      validator: (value) {
                        if (value == '') {
                          return "โปรดใส่ข้อความให้ครบถ้วน";
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                SizedBox(
                  width: size.width * 0.009,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      bottom: BorderSide(width: 2, color: Color(0xff78909C)),
                    ),
                  ),
                  width: size.width * 0.15,
                  height: size.height * 0.1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "สกุล",
                      ),
                      validator: (value) {
                        if (value == '') {
                          return "โปรดใส่ข้อความให้ครบถ้วน";
                        }
                        return null;
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () async {
                    final date = await pickDate();
                    if (date == null) return;
                    setState(() => dateTime = date);
                  },
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          bottom:
                              BorderSide(width: 2, color: Color(0xff78909C)),
                        ),
                      ),
                      width: size.width * 0.15,
                      height: size.height * 0.1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                dateTime?.formatTo('dd/MM/y') ?? 'วันเกิด'),
                          ),
                          Image.asset(
                            "assets/icons/CalendarBlank.png",
                            scale: 25,
                          ),
                        ],
                      )),
                ),
                SizedBox(
                  width: size.width * 0.025,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      bottom: BorderSide(width: 2, color: Color(0xff78909C)),
                    ),
                  ),
                  width: size.width * 0.15,
                  height: size.height * 0.1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Opacity(
                        opacity: 0.9,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 5,
                          ),
                          child: Text(
                            'เพศ',
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            hint: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                            ),
                            isExpanded: true,
                            items: general
                                .map((String item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 1.0),
                                        child: Text(
                                          item,
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ))
                                .toList(),
                            value: sex,
                            onChanged: (v) {
                              setState(() {
                                sex = v!;
                              });
                            },
                            underline: SizedBox(),
                            dropdownColor: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: size.width * 0.02),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      bottom: BorderSide(width: 2, color: Color(0xff78909C)),
                    ),
                  ),
                  width: size.width * 0.15,
                  height: size.height * 0.1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Opacity(
                        opacity: 0.9,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5),
                          child: Text(
                            'สัญชาติ',
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            hint: Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                            ),
                            isExpanded: true,
                            items: nationality
                                .map((String item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 1.0),
                                        child: Text(
                                          item,
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ))
                                .toList(),
                            value: lang,
                            onChanged: (v) {
                              setState(() {
                                lang = v!;
                              });
                            },
                            underline: SizedBox(),
                            dropdownColor: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      bottom: BorderSide(width: 2, color: Color(0xff78909C)),
                    ),
                  ),
                  width: size.width * 0.15,
                  height: size.height * 0.1,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "เบอร์โทร",
                        ),
                        validator: (value) {
                          if (value == '') {}
                          return null;
                        },
                        keyboardType: TextInputType.number),
                  ),
                ),
                SizedBox(
                  width: size.width * 0.009,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        bottom: BorderSide(width: 2, color: Color(0xff78909C)),
                      ),
                    ),
                    width: size.width * 0.31,
                    height: size.height * 0.1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "อีเมล",
                          ),
                          validator: (value) {
                            if (value == '') {}
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Row(
              children: [
                Checkbox(
                  value: Ichecked,
                  activeColor: Colors.blue,
                  onChanged: (newBool) {
                    setState(() {
                      Ichecked = newBool;
                    });
                  },
                ),
                RichText(
                  text: TextSpan(
                    text:
                        " UPOS ให้ความสำคัญต่อข้อมูลส่วนบุคคลของท่านเพื่อเพิ่มประสิทธิภาพและความปลอดภัย\nในการจัดเก็บข้อมูลกรุณายินยอมให้เก็บข้อมูลส่วนตัวตามพระราชบัญญัติการป้องกันข้อมูลส่วนบุคคล\n(PDPA)ตาม",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontFamily: "DB Heavent"),
                    children: [
                      TextSpan(
                        text: 'นโยบายความเป็นส่วนตัว',
                        style: TextStyle(
                          decoration: _hover ? TextDecoration.underline : null,
                          color: Colors.blue, // เปลี่ยนสี
                        ),
                        mouseCursor: SystemMouseCursors.click,
                        onEnter: (event) => setState(() => _hover = true),
                        onExit: (event) => setState(() => _hover = false),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Policypage()));
                          },
                      ),
                      TextSpan(
                        text: 'และ',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: 'นโยบายคุกกี้',
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context, false);
              },
              child: Card(
                //color: Colors.blue,
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    side: BorderSide(color: kButtonColor)),

                child: Container(
                  color: Colors.white,
                  width: size.width * 0.08,
                  height: size.height * 0.05,
                  child: Center(
                      child: Text(
                    'ยกเลิก',
                    style: TextStyle(
                        color: kButtonColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  )),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context, true);
              },
              child: Card(
                color: Colors.blue,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Container(
                  width: size.width * 0.08,
                  height: size.height * 0.05,
                  child: Center(
                      child: Text(
                    'ยืนยัน',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  )),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future<DateTime?> pickDate() => showDatePicker(
        builder: (context, child) {
          return Theme(
            data: ThemeData.light().copyWith(
              datePickerTheme: DatePickerThemeData(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
              ),
              inputDecorationTheme: InputDecorationTheme(
                  border: OutlineInputBorder(borderRadius: BorderRadius.zero)),
              primaryColor: Colors.blue,
              colorScheme: ColorScheme.light(primary: Colors.blue),
              buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
            ),
            child: child!,
          );
        },
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2200),
      );
}
