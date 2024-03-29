import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:possodexo/constants.dart';
import 'package:possodexo/home/service/productController.dart';
import 'package:possodexo/home/widgets/ClosePrintDialog.dart';
import 'package:possodexo/home/widgets/DropdownBranch.dart';
import 'package:possodexo/home/widgets/OpenAndCloseSwitch.dart';
import 'package:possodexo/home/widgets/OpenPrintDialog.dart';
import 'package:possodexo/home/widgets/OpenSalesShift.dart';
import 'package:possodexo/home/widgets/PrintCallBack.dart';
import 'package:possodexo/home/widgets/ShowOpenShift.dart';
import 'package:possodexo/home/widgets/TablePromotion.dart';
import 'package:possodexo/home/widgets/membership.dart';
import 'package:possodexo/home/widgets/texFristPage.dart';
import 'package:possodexo/login/services/loginApi.dart';

import 'package:possodexo/models/listProduct.dart';
import 'package:possodexo/models/order.dart';
import 'package:possodexo/models/orderitemsdto.dart';
import 'package:possodexo/models/productAttributeValue.dart';
import 'package:possodexo/models/branch.dart';
import 'package:possodexo/models/category.dart';
import 'package:possodexo/models/product.dart';
import 'package:possodexo/payment/service/paymentApi.dart';
import 'package:possodexo/widgets/AlertDialogYesNo.dart';
import 'package:possodexo/widgets/LoadingDialog.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../payment/widgets/paymentCash.dart';
import 'widgets/Addpointsela.dart';
import 'widgets/GridProduct.dart';
import 'widgets/Promotion.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

final TextEditingController employeeNo = TextEditingController();
final TextEditingController remark = TextEditingController();
String? counter;

class _HomePageState extends State<HomePage> {
  List<String> filteredProducts = [];
  List<String> nationality = ["ไทย", "พม่า", "ลาว"];
  String lang = "ไทย";
  List<ListProduct> selectedItem = [];
  ProductAttributeValue? selected;
  List<OrderItemsDto> orderItemsDto = [];
  final GlobalKey<FormState> _controllFormKey = GlobalKey<FormState>();
  final TextEditingController change = TextEditingController();
  final TextEditingController cash = TextEditingController();
  final TextEditingController remark = TextEditingController();
  String? shiftId;
  late SharedPreferences prefs;

  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController email = TextEditingController();

  int selectedIndex = 0;
  int totleqty = 0;
  double totleprice = 0.00;
  int selectedPayback = 0;
  int? selectedPrice = 0;
  Order? order;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  List<String> general = ["ไม่ระบุ", "ชาย", "หญิง"];
  String sex = "ไม่ระบุ";
  void onItemTapped1(int index) {
    setState(() {});
  }

  List<Category> category = [];
  Category? sclectedProduct;
  List<Map<String, dynamic>> gridCoffees = [];
  int? menuSize;
  int? sizeprice;
  ProductAttributeValue? attributeValues;
  List<Widget> orders = [];
  ProductAttributeValue? p0;
  int? p1;
  List<ProductAttributeValue>? p2;
  void onTapProduct(int index) {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async{
      //getlistproduct();

      await getlistCategory();
      await getlistBranch();
    });

    orders = [
      Card(
        surfaceTintColor: Colors.white,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0), side: BorderSide(color: kButtonColor)),
        child: SizedBox(
          width: 150,
          height: 45,
          child: Center(
              child: Text(
            'Order${(orders.length + 1).toString().padLeft(2, '0')}',
            style: TextStyle(color: kButtonColor, fontFamily: 'IBMPlexSansThai', fontSize: 16, fontWeight: FontWeight.bold),
          )),
        ),
      ),
    ];
    Future.delayed(
      Duration(seconds: 1),
      () async => {
        await checkShift(),
      },
    );
  }

// ดึงข้อมูล product
//   Future<void> getlistproduct() async {
//     try {
//       await context.read<ProductController>().getProduct();
//     } on Exception catch (e) {
//       inspect(e);
//     }
//   }

  //ดึงข้อมูล Category
  Future<void> getlistCategory() async {
    try {
      LoadingDialog.open(context);
      await context.read<ProductController>().getListCategory();
      final list = context.read<ProductController>().categorized;
      if (!mounted) return;
      LoadingDialog.close(context);
      setState(() {
        category = list;
        sclectedProduct = list[0];
      });
    } on Exception catch (e) {
      if (!mounted) return;
      LoadingDialog.close(context);
      showDialog(
        context: context,
        builder: (context) => AlertDialogYes(
          title: 'แจ้งเตือน',
          description: '${e}',
          pressYes: () {
            Navigator.pop(context, true);
          },
        ),
      );
    }
  }

  //ดึงข้อมูล Branch
  Future<void> getlistBranch() async {
    try {
      await context.read<ProductController>().getListBranch();
    } on Exception catch (e) {
      if (!mounted) return;

      showDialog(
        context: context,
        builder: (context) => AlertDialogYes(
          title: 'แจ้งเตือน',
          description: '${e}',
          pressYes: () {
            Navigator.pop(context, true);
          },
        ),
      );
    }
  }

  Future checkShift() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    shiftId = prefs.getString('shiftId');
    if (shiftId != null) {
      setState(() {
        openShift = true;
      });
    }
  }

//ดึงข้อมูล Payment
  Future<void> getListPayment() async {
    try {
      await context.read<ProductController>().getListPayment();
    } on Exception catch (e) {
      if (!mounted) return;

      showDialog(
        context: context,
        builder: (context) => AlertDialogYes(
          title: 'แจ้งเตือน',
          description: '${e}',
          pressYes: () {
            Navigator.pop(context, true);
          },
        ),
      );
    }
  }

  //ฟังก์ชั่นคำนวน ราคา และ qty
  double sum(List<ListProduct> orders) => orders.fold(0, (previous, o) => previous + (o.product.qty * o.product.price!));
  int newQty(List<Product> orders) => orders.fold(0, (previousValue, e) => previousValue + e.qty);

  double sumOrderItem(List<OrderItemsDto> attributesValue) => attributesValue.fold(0, (p, o) => p + (o.price + o.total));

  Branch? sizeValue;
  String printValue = 'พิมพ์ใบกำกับภาษี';
  bool open = true;
  bool printxx = false;
  bool openShift = false;
  bool opentax = false;
  bool openCallback = false;
  int qty = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<ProductController>(builder: (context, productController, child) {
      final products = productController.products;
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 15,
              child: SingleChildScrollView(
                child: Column(children: [
                  Container(
                    decoration: BoxDecoration(color: Color(0xFFECEFF1)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(2),
                          height: size.height * 0.08,
                          width: size.width * 0.16,
                          // color: Colors.grey,
                          child: DropdownBranch(),
                        ),
                        SizedBox(
                          height: size.height * 0.08,
                          width: size.width * 0.38,
                          //color: Colors.grey,
                          child: Row(
                            children: [
                              OpenAndCloseSwitch(
                                size: size,
                                open: open,
                                showTextOpen: 'เปิดเมนู',
                                showTextClose: 'ปิดเมนู',
                                onChanged: (value) {
                                  setState(() {
                                    open = value;
                                  });
                                },
                              ),
                              OpenAndCloseSwitch(
                                size: size,
                                open: printxx,
                                showTextOpen: 'พิมพ์ใบเสร็จ',
                                showTextClose: 'พิมพ์ใบเสร็จ',
                                onChanged: (value) async {
                                  setState(() {
                                    printxx = value;
                                  });
                                  if (value == true) {
                                    showDialog(
                                      context: context,
                                      builder: (context) => OpenPrintDialog(
                                        size: size,
                                        pressOk: () {
                                          Navigator.pop(context, true);
                                        },
                                        pressCancel: () {
                                          Navigator.pop(context, false);
                                        },
                                      ),
                                    );
                                  } else {
                                    showDialog(
                                      context: context,
                                      builder: (context) => ClosePrintDialog(
                                        size: size,
                                        pressOk: () {
                                          Navigator.pop(context, true);
                                        },
                                        pressCancel: () {
                                          Navigator.pop(context, false);
                                        },
                                      ),
                                    );
                                  }
                                },
                              ),
                              SizedBox(
                                height: size.height * 0.06,
                                width: size.width * 0.04,
                                child: Container(
                                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8), border: Border.all(color: Color(0xFF1264E3))),
                                  child: PopupMenuButton(
                                    color: Colors.white,
                                    surfaceTintColor: Colors.white,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                                    icon: Icon(Icons.more_horiz),
                                    itemBuilder: (ctx) => [
                                      PopupMenuItem(
                                        child: Row(
                                          children: [
                                            Icon(Icons.sticky_note_2),
                                            Text(
                                              'พิมพ์ใบกำกับภาษี',
                                              style: TextStyle(
                                                fontFamily: 'IBMPlexSansThai',
                                              ),
                                            ),
                                          ],
                                        ),
                                        onTap: () {
                                          opentax = true;
                                          setState(() {});
                                        },
                                      ),
                                      PopupMenuItem(
                                        child: Row(
                                          children: [
                                            Icon(Icons.receipt),
                                            Text(
                                              'พิมพ์ใบเสร็จย้อนหลัง',
                                              style: TextStyle(
                                                fontFamily: 'IBMPlexSansThai',
                                              ),
                                            ),
                                          ],
                                        ),
                                        onTap: () {
                                          openCallback = true;
                                          setState(() {});
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFECEFF1),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 1,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                  ),
                  openCallback
                      ? PrintCallBack()
                      : opentax
                          ? TexFristPage()
                          : openShift == true
                              ? Container(
                                  color: Colors.white,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        dragStartBehavior: DragStartBehavior.start,
                                        physics: AlwaysScrollableScrollPhysics(),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            ...orders,
                                            GestureDetector(
                                              onTap: () {
                                                showDialog(
                                                  context: context,
                                                  builder: (context) => Addpointsela(
                                                    size: size,
                                                    pressCancel: () {
                                                      Navigator.pop(context, false);
                                                    },
                                                    pressOk: () {
                                                      Navigator.pop(context, true);
                                                      orders.add(
                                                        Card(
                                                          surfaceTintColor: Colors.white,
                                                          elevation: 2,
                                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0), side: BorderSide(color: kButtonColor)),
                                                          child: SizedBox(
                                                            width: size.width * 0.1,
                                                            height: size.height * 0.06,
                                                            child: Center(
                                                                child: Text(
                                                              'Order${(orders.length + 1).toString().padLeft(2, '0')}',
                                                              style: TextStyle(color: kButtonColor, fontFamily: 'IBMPlexSansThai', fontSize: 16, fontWeight: FontWeight.bold),
                                                            )),
                                                          ),
                                                        ),
                                                      );
                                                      orders = orders..toList();
                                                      setState(() {});
                                                    },
                                                    onValueChanged: (value) {
                                                      counter = value.toString();
                                                    },
                                                    pressClose: () {
                                                      Navigator.pop(context, false);
                                                    },
                                                    employeeNo: employeeNo,
                                                    remark: remark,
                                                    counter: {},
                                                  ),
                                                );
                                              },
                                              child: Card(
                                                surfaceTintColor: Colors.white,
                                                elevation: 5,
                                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0), side: BorderSide(color: kButtonColor)),
                                                color: Colors.white,
                                                child: SizedBox(
                                                  width: size.width * 0.07,
                                                  height: size.height * 0.06,
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Image.asset(
                                                        'assets/icons/add.png',
                                                        scale: 25,
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(
                                                        'เพิ่ม',
                                                        style: TextStyle(color: kButtonColor, fontFamily: 'IBMPlexSansThai', fontSize: 16, fontWeight: FontWeight.bold),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: size.height * 0.01,
                                      ),
                                      Container(
                                        height: size.height * 0.08,
                                        width: double.infinity,
                                        color: kTabColor,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: 20,
                                            ),
                                            DropdownButton<Category>(
                                              selectedItemBuilder: (e) => category.map<Widget>((item) {
                                                return Center(
                                                  child: Text(
                                                    item.name!,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                );
                                              }).toList(),
                                              icon: Icon(
                                                Icons.arrow_drop_down,
                                                color: Colors.white,
                                              ),
                                              underline: SizedBox(),
                                              items: category.map<DropdownMenuItem<Category>>((item) {
                                                return DropdownMenuItem<Category>(
                                                  value: item,
                                                  child: Text(
                                                    item.name!,
                                                    style: TextStyle(
                                                      fontFamily: 'IBMPlexSansThai',
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                );
                                              }).toList(),
                                              value: sclectedProduct,
                                              onChanged: (v) async {
                                                setState(() {
                                                  sclectedProduct = v;
                                                });
                                                await context.read<ProductController>().getProduct(categoryid: sclectedProduct!.id!);
                                              },
                                            ),
                                            SizedBox(
                                              width: size.width * 0.38,
                                            ),
                                            IconButton(
                                              icon: Icon(Icons.search),
                                              onPressed: () {
                                                showSearch(context: context, delegate: MySearch());
                                              },
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Image.asset(
                                                "assets/icons/Frame (5).png",
                                                scale: 20,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Image.asset(
                                                "assets/icons/Frame (6).png",
                                                scale: 20,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: size.height * 0.01,
                                      ),
                                      products.isNotEmpty
                                          ? SizedBox(
                                              height: size.height * 0.536,
                                              child: SingleChildScrollView(
                                                child: SizedBox(
                                                  child: GridCoffee(
                                                    qty: qty,
                                                    gridCoffee: products,
                                                    categoryid: sclectedProduct!.id!,
                                                    onChange: (value) {
                                                      // inspect(value);
                                                      // final Product item = value["item"];
                                                      // menuSize = value["size"];
                                                      // // inspect(menuSize);
                                                      // sizeprice = value["pricesize"];
                                                      // inspect(sizeprice);
                                                      // attributeValues = value["selectedSize"];

                                                      //ได้รับ ลิส ออร์เดอร์ ที่เลือกเอาไว้
                                                      orderItemsDto.add(value["orderItems"]);

                                                      final item = ListProduct(
                                                        value["item"],
                                                        value["selectedSize"],
                                                        value["p0"],
                                                        value["p1"],
                                                        value["p2"],
                                                      );
                                                      totleprice = item.product.price!.toDouble();
                                                      totleqty = item.product.qty;
                                                      item.product.priceQTY = item.product.price!.toDouble();

                                                      selectedItem.add(item);
                                                      setState(() {});
                                                    },
                                                  ),
                                                ),
                                              ),
                                            )
                                          : SizedBox(),
                                      SizedBox(
                                        height: size.height * 0.14,
                                        child: GridProMotion(),
                                      )
                                    ],
                                  ),
                                )
                              : ShowOpenShift(
                                  size: size,
                                  press: () async {
                                    final ok = await showDialog(
                                      context: context,
                                      builder: (context) => OpenSalesShift(
                                        size: size,
                                        controllerchange: change,
                                        controllercash: cash,
                                        controllerRemark: remark,
                                        pressCancel: () {
                                          Navigator.pop(context, false);
                                        },
                                        pressOk: () {
                                          Navigator.pop(context, true);
                                        },
                                        pressClose: () {
                                          Navigator.pop(context, false);
                                        },
                                      ),
                                    );
                                    if (ok == true) {
                                      if (change.text != "" && cash.text != "") {
                                        await productController.openShift(change: int.parse(change.text), cash: int.parse(cash.text), remark: remark.text);
                                        final SharedPreferences prefs = await SharedPreferences.getInstance();
                                        shiftId = prefs.getString('shiftId');
                                        if (shiftId != null) {
                                          setState(() {
                                            openShift = true;
                                          });
                                        } else {}
                                      } else {
                                        if (!mounted) return;
                                        showDialog(
                                          context: context,
                                          builder: (context) => AlertDialogYes(
                                            title: 'แจ้งเตือน',
                                            description: 'กรุณากรอกข้อมูลให้ครบ',
                                            pressYes: () {
                                              Navigator.pop(context, true);
                                            },
                                          ),
                                        );
                                      }
                                    }
                                  },
                                ),
                  // ส่วนแสดงสินค้า
                ]),
              )),
          //Expanded(flex: 1, child: Container()),
          //ส่วนสำหรับแสดง รายการคิดเงิน
          openCallback
              ? SizedBox.shrink()
              : opentax == false
                  ? Expanded(
                      flex: 8,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: size.height * 0.08,
                              width: size.width * 0.38,
                              color: Colors.black,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'รายการชำระ',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 23,
                                        fontFamily: 'IBMPlexSansThai',
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: size.width * 0.11,
                                    height: size.height * 0.06,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.white),
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              onItemTapped(0);
                                            },
                                            child: Container(
                                              width: size.width * 0.05,
                                              height: size.height * 0.05,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(8),
                                                color: selectedIndex == 0 ? Colors.blue : Color.fromARGB(255, 255, 255, 255),
                                              ),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "ทั่วไป",
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontFamily: 'IBMPlexSansThai',
                                                      color: selectedIndex == 0 ? Color.fromARGB(255, 255, 255, 255) : Colors.black,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              onItemTapped(1);
                                            },
                                            child: Container(
                                              width: size.width * 0.05,
                                              height: size.height * 0.05,
                                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: selectedIndex == 1 ? Colors.blue : Color.fromARGB(255, 255, 255, 255)),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "สมาชิก",
                                                    style: TextStyle(fontSize: 16, fontFamily: 'IBMPlexSansThai', color: selectedIndex == 1 ? Color.fromARGB(255, 255, 255, 255) : Colors.black),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            // Column(
                            //   children: [
                            //     Container(
                            //       decoration: BoxDecoration(
                            //         color: Color.fromARGB(255, 241, 241, 241),
                            //         border: Border(
                            //           bottom: BorderSide(color: Colors.black),
                            //         ),
                            //       ),
                            //       width: size.width * 0.35,
                            //       child: TextFormField(
                            //         style: TextStyle(fontSize: 22),
                            //         decoration: InputDecoration(
                            //           hintText: '',
                            //           hintStyle: TextStyle(fontSize: 22),
                            //           prefixIcon: Icon(Icons.search),
                            //           border: UnderlineInputBorder(
                            //             borderSide: BorderSide.none,
                            //           ),
                            //         ),
                            //       ),
                            //     ),
                            //     Container(
                            //       decoration: BoxDecoration(
                            //         color: Color.fromARGB(255, 241, 241, 241),
                            //       ),
                            //       height: size.height * 0.08,
                            //       width: size.width * 0.35,
                            //     )
                            //   ],
                            // ),
                            Column(
                              children: [
                                Container(
                                  color: Colors.white,
                                  height: size.height * 0.56,
                                  width: size.width * 1,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: size.height * 0.02,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: SizedBox(
                                              height: size.height * 0.12,
                                              child: Padding(
                                                padding: const EdgeInsets.all(6.0),
                                                child: Container(
                                                  decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey)), borderRadius: BorderRadius.circular(2), color: Color(0xFFFFFAFAFA)),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Opacity(
                                                        opacity: 0.5,
                                                        child: Padding(
                                                          padding: const EdgeInsets.only(left: 5, top: 3),
                                                          child: Text(
                                                            'สัญชาติ',
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
                                                          items: nationality
                                                              .map((String item) => DropdownMenuItem<String>(
                                                                    value: item,
                                                                    child: Padding(
                                                                      padding: const EdgeInsets.symmetric(horizontal: 1.0),
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
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: SizedBox(
                                              height: size.height * 0.12,
                                              child: Padding(
                                                padding: const EdgeInsets.all(6.0),
                                                child: Container(
                                                  decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey)), borderRadius: BorderRadius.circular(2), color: Color(0xfffffafafa)),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Opacity(
                                                        opacity: 0.5,
                                                        child: Padding(
                                                          padding: const EdgeInsets.only(left: 5, top: 3),
                                                          child: Text(
                                                            'เพศ',
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
                                                          items: general
                                                              .map((String item) => DropdownMenuItem<String>(
                                                                    value: item,
                                                                    child: Padding(
                                                                      padding: const EdgeInsets.symmetric(horizontal: 1.0),
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
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                          color: Color(0xffE8EAF6),
                                          width: size.width * 0.5,
                                          height: size.height * 0.06,
                                          child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  selectedItem.clear();
                                                });
                                              },
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Text("Order"),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Icon(Icons.cancel),
                                                  ),
                                                ],
                                              ))),

                                      SizedBox(
                                        height: size.height * 0.01,
                                      ),
                                      //ฟังชั่นกดเเล้วเเสดงผล ////
                                      selectedItem.isEmpty
                                          ? SizedBox.shrink()
                                          : SizedBox(
                                              height: size.height * 0.3,
                                              child: ListView.builder(
                                                itemCount: selectedItem.length,
                                                itemBuilder: (context, index) {
                                                  final item = selectedItem[index];
                                                  // inspect(item);

                                                  return Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Slidable(
                                                      key: Key("$item"),
                                                      endActionPane: ActionPane(
                                                        motion: const ScrollMotion(),
                                                        children: [
                                                          SlidableAction(
                                                            onPressed: (context) {
                                                              setState(() {
                                                                selectedItem.removeAt(index);
                                                              });
                                                            },
                                                            backgroundColor: Colors.red,
                                                            icon: Icons.delete,
                                                          )
                                                        ],
                                                      ),
                                                      child: SizedBox(
                                                        child: Column(
                                                          children: [
                                                            SizedBox(
                                                              height: size.height * 0.01,
                                                            ),
                                                            Row(
                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                              children: [
                                                                Text(selectedItem[index].product.name ?? ''),
                                                                Row(
                                                                  children: [
                                                                    InkWell(
                                                                      onTap: () {
                                                                        if (selectedItem[index].product.qty > 1) {
                                                                          setState(() {
                                                                            selectedItem[index].product.qty = selectedItem[index].product.qty - 1;
                                                                            final price = double.parse((selectedItem[index].product.price! * selectedItem[index].product.qty).toString());

                                                                            totleqty = selectedItem[index].product.qty;
                                                                            selectedItem[index].product.priceQTY = price;
                                                                            totleprice = selectedItem[index].product.priceQTY;
                                                                          });
                                                                        }
                                                                      },
                                                                      child: Container(
                                                                        width: size.width * 0.02,
                                                                        height: 30,
                                                                        decoration: BoxDecoration(color: Color(0xFFCFD8DC), borderRadius: BorderRadius.circular(6)),
                                                                        child: Icon(
                                                                          Icons.remove,
                                                                          size: 15,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      width: 10,
                                                                    ),
                                                                    Text("${selectedItem[index].product.qty}"),
                                                                    SizedBox(
                                                                      width: 10,
                                                                    ),
                                                                    InkWell(
                                                                      onTap: () {
                                                                        if (selectedItem[index].product.qty >= 1) {
                                                                          setState(() {
                                                                            selectedItem[index].product.qty = selectedItem[index].product.qty + 1;
                                                                            final price = double.parse((selectedItem[index].product.price! * selectedItem[index].product.qty).toString());
                                                                            totleqty = selectedItem[index].product.qty;

                                                                            selectedItem[index].product.priceQTY = price;
                                                                            totleprice = selectedItem[index].product.priceQTY;
                                                                          });
                                                                        }
                                                                      },
                                                                      child: Container(
                                                                        width: size.width * 0.02,
                                                                        height: 30,
                                                                        decoration: BoxDecoration(color: Color(0xFFCFD8DC), borderRadius: BorderRadius.circular(6)),
                                                                        child: Icon(
                                                                          Icons.add,
                                                                          size: 15,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                            Row(
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsets.only(
                                                                    right: 5,
                                                                  ),
                                                                  child: Text(
                                                                    selectedItem[index].p0.name == 'No' || selectedItem[index].p0.name == 'Yes'
                                                                        ? selectedItem[index].p0.name == 'No'
                                                                            ? 'ไม่ปั่น'
                                                                            : 'ปั่น'
                                                                        : 'ขนาด',
                                                                    style: TextStyle(fontSize: 14, fontFamily: 'IBMPlexSansThai', color: Color(0xFF455A64)),
                                                                  ),
                                                                ),
                                                                selectedItem[index].p0.name == 'No' || selectedItem[index].p0.name == 'Yes' ? SizedBox.shrink() : Text(selectedItem[index].p0.name)
                                                              ],
                                                            ),
                                                            Padding(
                                                              padding: const EdgeInsets.only(right: 5, top: 5),
                                                              child: Row(
                                                                children: [Text(selectedItem[index].p1?.toString() ?? '-')],
                                                              ),
                                                            ),
                                                            Row(
                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                              children: [
                                                                Padding(
                                                                  padding: const EdgeInsets.only(right: 5, top: 5),
                                                                  child: Text(
                                                                    (selectedItem[index].product.price ?? 0 + attributeValues!.price).toStringAsFixed(2),
                                                                  ),
                                                                ),
                                                                Text(selectedItem[index].product.priceQTY.toStringAsFixed(2)),
                                                              ],
                                                            ),
                                                            Row(
                                                              children:
                                                                  List.generate(selectedItem[index].p2?.length ?? 0, (index2) => Wrap(children: [Text("${selectedItem[index].p2?[index2].name}, ")])),
                                                              //children: [Text("${selectedItem[index].p2}")],
                                                            ),
                                                            Divider()
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                              )),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SingleChildScrollView(
                              child: Column(
                                children: [
                                  Container(
                                    color: Color.fromARGB(15, 0, 0, 0),
                                    height: size.height * 0.01,
                                    width: size.width * 1,
                                  ),
                                  // ผลรวมจำนวนสินค้า/////
                                  Column(
                                    children: [
                                      Container(
                                        color: Colors.white,
                                        height: size.height * 0.30,
                                        width: size.width * 1,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: size.height * 0.01,
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    "จำนวนสินค้า",
                                                    style: TextStyle(fontFamily: 'IBMPlexSansThai', color: Color(0xFF424242)),
                                                  ),
                                                  Text(
                                                    selectedItem.length.toString(),
                                                    // '${sumQTY(selectedItem)} ชิ้น',
                                                    style: TextStyle(
                                                      fontFamily: 'IBMPlexSansThai',
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    "รวม",
                                                    style: TextStyle(fontFamily: 'IBMPlexSansThai', color: Color(0xFF424242)),
                                                  ),
                                                  Text(
                                                    sum(selectedItem).toStringAsFixed(2),
                                                    // '${sumPrice(selectedItem)} ฿',
                                                    style: TextStyle(
                                                      fontFamily: 'IBMPlexSansThai',
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    "ส่วนลด",
                                                    style: TextStyle(fontFamily: 'IBMPlexSansThai', color: Color(0xFF424242)),
                                                  ),
                                                  Text(
                                                    '0 ฿',
                                                    style: TextStyle(
                                                      fontFamily: 'IBMPlexSansThai',
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Divider(),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    "ชำระทั้งหมด",
                                                    style: TextStyle(fontFamily: 'IBMPlexSansThai', color: Color(0xFF424242)),
                                                  ),
                                                  Text(
                                                    "",
                                                    style: TextStyle(
                                                      fontFamily: 'IBMPlexSansThai',
                                                    ),
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: size.height * 0.02,
                                              ),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children: [
                                                  InkWell(
                                                    onTap: () async {
                                                      final statusD = await showDialog(
                                                          context: context,
                                                          builder: (context) => TablePromotion(
                                                                closeblack: () {
                                                                  Navigator.pop(context);
                                                                },
                                                              ));
                                                      if (statusD == true) {}
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.black)),
                                                      height: size.height * 0.05,
                                                      width: size.width * 0.13,
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            Text(
                                                              "ดูโปรโมชั่น",
                                                              style: TextStyle(
                                                                fontFamily: 'IBMPlexSansThai',
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            Image.asset(
                                                              "assets/icons/Subtract.png",
                                                              scale: 15,
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap: () async {
                                                      final statusD = await showDialog(
                                                          context: context,
                                                          builder: (context) => Membership(
                                                                emal: email,
                                                                firstName: firstName,
                                                                lastName: lastName,
                                                                username: username,
                                                                password: password,
                                                                phoneNumber: phoneNumber,
                                                                closeblack: () {Navigator.pop(context, false);},
                                                                close: (){Navigator.pop(context, false);},
                                                                confirm: (){Navigator.pop(context, true);},
                                                              ));
                                                      if (statusD == true) {
                                                        print(statusD);
                                                        //final regis = await LoginApi.register(phoneNumber.text, username.text, password.text, '01', firstName.text, lastName.text);
                                                        // if (regis != null) {
                                                        //   if (!mounted) return;
                                                        //   showDialog(
                                                        //     context: context,
                                                        //     builder: (context) => AlertDialogYes(
                                                        //       title: 'แจ้งเตือน',
                                                        //       description: 'สมัครสำเร็จ',
                                                        //       pressYes: () {
                                                        //         Navigator.pop(context, true);
                                                        //       },
                                                        //     ),
                                                        //   );
                                                        // }
                                                      }
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.black)),
                                                      height: size.height * 0.05,
                                                      width: size.width * 0.13,
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          Text("สมัครสมาชิก"),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 6,
                                              ),
                                              InkWell(
                                                onTap: () async {
                                                  try {
                                                    final _order = await PaymentApi.ceateOrders(shiftId: 1, total: sumOrderItem(orderItemsDto), orderItems: orderItemsDto);
                                                    if (_order != null) {
                                                      setState(() {
                                                        order = _order;
                                                      });
                                                      if (!mounted) return;
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                              builder: (context) => PaymentCash(
                                                                    selectedItem: selectedItem,
                                                                    sumPrice: sum(selectedItem).toStringAsFixed(2),
                                                                    sumQTY: selectedItem.length.toString(),
                                                                    order: order!,
                                                                  )));
                                                    } else {
                                                      if (!mounted) return;
                                                      showDialog(
                                                        context: context,
                                                        builder: (context) => AlertDialogYes(
                                                          title: 'แจ้งเตือน',
                                                          description: 'ค่าที่ตอบกลับมาไม่ถูกต้อง',
                                                          pressYes: () {
                                                            Navigator.pop(context, true);
                                                          },
                                                        ),
                                                      );
                                                    }
                                                  } on Exception catch (e) {
                                                    if (!mounted) return;
                                                    showDialog(
                                                      context: context,
                                                      builder: (context) => AlertDialogYes(
                                                        title: 'แจ้งเตือน',
                                                        description: '{$e}',
                                                        pressYes: () {
                                                          Navigator.pop(context, true);
                                                        },
                                                      ),
                                                    );
                                                  }
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: selectedItem.isNotEmpty ? Colors.blue : Colors.grey),
                                                  height: size.height * 0.05,
                                                  width: size.width * 0.28,
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Opacity(
                                                          opacity: 0.8,
                                                          child: Padding(
                                                            padding: const EdgeInsets.only(left: 5, top: 3),
                                                            child: Text(
                                                              'ชำระเงิน ',
                                                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, fontFamily: 'IBMPlexSansThai', color: Colors.white),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  : SizedBox.shrink()
        ],
      );
    });
  }
}

class ItemSelect {
  String? image;

  int? priceS;
  int? priceM;
  int? priceL;
  int? priceQTY;
  int? size;
  String? name;
  String? type;
  int? qty;

  ItemSelect({
    this.image,
    this.priceS,
    this.priceM,
    this.priceL,
    this.priceQTY = 0,
    this.size,
    this.name,
    this.type,
    this.qty = 1,
  });
}

class MySearch extends SearchDelegate {
  List<String> searchResults = [
    "กาเเฟ",
    "ขนม",
    "นม",
    "เนย",
  ];

  @override
  Widget buildLeading(BuildContext context) => IconButton(onPressed: () => close(context, null), icon: const Icon(Icons.arrow_back));

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
            onPressed: () {
              if (query.isEmpty) {
                close(context, null);
              } else {
                query = "";
              }
            },
            icon: const Icon(Icons.clear))
      ];

  @override
  Widget buildResults(BuildContext context) {
    throw Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = searchResults.where((searchResult) {
      final result = searchResult.toLowerCase();
      final input = query.toLowerCase();

      return result.contains(input);
    }).toList();
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];
        return ListTile(
          title: Text(suggestion),
          onTap: () {
            query = suggestion;
            showResults(context);
          },
        );
      },
    );
  }
}
