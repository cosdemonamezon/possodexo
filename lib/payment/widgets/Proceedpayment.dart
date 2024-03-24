import 'package:flutter/material.dart';
import 'package:possodexo/constants.dart';
import 'package:possodexo/home/firstPage.dart';
import 'package:possodexo/models/order.dart';
import 'package:possodexo/models/paymentorder.dart';
import 'package:possodexo/payment/service/paymentApi.dart';
import 'package:possodexo/widgets/AlertDialogYesNo.dart';

class Proceedpayment extends StatefulWidget {
  Proceedpayment({Key? key, required this.order, required this.paymentOrder}) : super(key: key);
  PaymentOrder paymentOrder;
  Order order;

  @override
  State<Proceedpayment> createState() => _ProceedpaymentState();
}

class _ProceedpaymentState extends State<Proceedpayment> {
  bool _showAlternativeBody = false;

  @override
  void initState() {
    super.initState();
    // Future.delayed(Duration(seconds: 10), () {
    //   setState(() {
    //     _showAlternativeBody = true;
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Color(0xFF1B1B28),
        title: Image.asset(
          'assets/images/poslogo.png',
          scale: 7,
        ),
        centerTitle: true,
        leadingWidth: size.width * 0.3,
        leading: SizedBox(
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  size: 23,
                  color: Colors.white,
                ),
              ),
              Expanded(
                child: Text(
                  'กลับ',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        color: Color(0xFFF6F6F8),
        child: Center(
          child: AnimatedSwitcher(
            duration: Duration(seconds: 1),
            child: _showAlternativeBody ? _buildAlternativeBody() : _buildDefaultBody(),
          ),
        ),
      ),
    );
  }

  Widget _buildDefaultBody() {
    final size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        height: size.height * 0.65,
        width: size.width * 0.3,
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: size.height * 0.02,
              ),
              // Image.asset(
              //   'assets/icons/londing.png',
              //   scale: 10,
              // ),
              SizedBox(
                width: size.width * 0.05,
                height: size.height * 0.1,
                child: CircularProgressIndicator(),
              ),
              Text(
                'ดำเนินการชำระเงิน',
                style: TextStyle(color: ktextColr, fontSize: 30),
              ),
              Text(
                'ประเภท : เงินสด',
                style: TextStyle(color: Color.fromARGB(206, 66, 66, 66), fontSize: 20),
              ),
              Text(
                '${widget.paymentOrder.total}',
                style: TextStyle(color: Color.fromARGB(255, 18, 102, 227), fontSize: 52),
              ),
              Divider(
                color: Color(0xFF78909C),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'ราคารวมเงิน',
                    style: TextStyle(color: Color.fromARGB(206, 66, 66, 66), fontSize: 20),
                  ),
                  Text(
                    '${widget.paymentOrder.grandTotal} ฿',
                    style: TextStyle(color: ktextColr, fontSize: 30),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'เงินทอน',
                    style: TextStyle(color: Color.fromARGB(206, 66, 66, 66), fontSize: 20),
                  ),
                  Text(
                    '0.00 ฿',
                    style: TextStyle(color: ktextColr, fontSize: 30),
                  ),
                ],
              ),
              InkWell(
                onTap: () async {
                  try {
                    final _alternativePayment = await PaymentApi.alternativePayment(orderId: widget.order.id, orderPaymentId: widget.paymentOrder.id);
                    if (_alternativePayment != null) {
                      if (!mounted) return;
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialogYes(
                          title: 'ดำเนินการสำเร็จ',
                          description: 'เดี๋ยวค่อยทำหน้าต่อไป',
                          pressYes: () {
                            Navigator.pop(context, true);
                          },
                        ),
                      );
                    } else {
                      if (!mounted) return;
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialogYes(
                          title: 'แจ้งเตือน',
                          description: 'ค่าที่ตอบกลับมาเป็นเป็นข้อมูลที่ไม่ถูกต้อง',
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
                  width: size.width * 0.25,
                  height: size.height * 0.065,
                  decoration: BoxDecoration(color: Color(0xFF1264E3), borderRadius: BorderRadius.circular(8)),
                  child: Center(
                    child: Text(
                      textAlign: TextAlign.center,
                      'รับเงินสำเร็จ',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAlternativeBody() {
    final size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        height: size.height * 0.5,
        width: size.width * 0.3,
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/icons/CheckCircle.png',
                scale: 9,
              ),
              Text(
                'ชำระเงินสำเร็จ',
                style: TextStyle(color: ktextColr, fontSize: 30),
              ),
              Text(
                'ประเภท : เงินสด',
                style: TextStyle(color: Color.fromARGB(206, 66, 66, 66), fontSize: 20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'ใบเสร็จ : ',
                    style: TextStyle(color: Color.fromARGB(206, 66, 66, 66), fontSize: 20),
                  ),
                  Text(
                    'RM924022300002',
                    style: TextStyle(color: Color(0xFF1264E3), fontSize: 20),
                  ),
                ],
              ),
              Divider(
                color: Color(0xFF78909C),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'ยอดชำระ',
                    style: TextStyle(color: Color.fromARGB(206, 66, 66, 66), fontSize: 20),
                  ),
                  Text(
                    '243.00 ฿',
                    style: TextStyle(color: ktextColr, fontSize: 30),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: size.width * 0.13,
                      height: size.height * 0.065,
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8), border: Border.all(color: Color(0xFF1264E3))),
                      child: Center(
                        child: Text(
                          textAlign: TextAlign.center,
                          'พิมใบเสร็จ',
                          style: TextStyle(color: Color(0xFF1264E3), fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => FirstPage()));
                    },
                    child: Container(
                      width: size.width * 0.13,
                      height: size.height * 0.065,
                      decoration: BoxDecoration(color: Color(0xFF1264E3), borderRadius: BorderRadius.circular(8)),
                      child: Center(
                        child: Text(
                          textAlign: TextAlign.center,
                          'เสร็จ',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
