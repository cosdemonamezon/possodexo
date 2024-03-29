import 'package:flutter/material.dart';
import 'package:possodexo/constants.dart';

class Proceedsplitpayments extends StatefulWidget {
  const Proceedsplitpayments({super.key});

  @override
  State<Proceedsplitpayments> createState() => _ProceedsplitpaymentsState();
}

class _ProceedsplitpaymentsState extends State<Proceedsplitpayments> {
  bool _showAlternativeBody = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 10), () {
      setState(() {
        _showAlternativeBody = true;
      });
    });
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
            child: _showAlternativeBody
                ? _buildAlternativeBody()
                : _buildDefaultBody(),
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
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: size.height * 0.02,
              ),
              Image.asset(
                'assets/icons/londing.png',
                scale: 10,
              ),
              Text(
                'แบ่งจ่ายลำดับที่  #1',
                style: TextStyle(color: ktextColr, fontSize: 30),
              ),
              Text(
                'ประเภท : เงินสด',
                style: TextStyle(
                    color: Color.fromARGB(206, 66, 66, 66), fontSize: 20),
              ),
              Text(
                '100.00',
                style: TextStyle(
                    color: Color.fromARGB(255, 18, 102, 227), fontSize: 52),
              ),
              Divider(
                color: Color(0xFF78909C),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'จากยอดรวมทั้งหมด',
                    style: TextStyle(
                        color: Color.fromARGB(206, 66, 66, 66), fontSize: 20),
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
                  Text(
                    'ยอดคงเหลือ',
                    style: TextStyle(
                        color: Color.fromARGB(206, 66, 66, 66), fontSize: 20),
                  ),
                  Text(
                    '143.00 ฿',
                    style: TextStyle(color: ktextColr, fontSize: 30),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: size.width * 0.13,
                    height: size.height * 0.065,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Color(0xFF1264E3))),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/icons/penedit.png',
                            scale: 35,
                          ),
                          SizedBox(
                            width: size.width * 0.01,
                          ),
                          Text(
                            textAlign: TextAlign.center,
                            'แก้ไขวิธีการชำระเงิน',
                            style: TextStyle(
                                color: Color(0xFF1264E3), fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: size.width * 0.13,
                    height: size.height * 0.065,
                    decoration: BoxDecoration(
                        color: Color(0xFF1264E3),
                        borderRadius: BorderRadius.circular(8)),
                    child: Center(
                      child: Text(
                        textAlign: TextAlign.center,
                        'รับเงินเสร็จ',
                        style: TextStyle(color: Colors.white, fontSize: 16),
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

  Widget _buildAlternativeBody() {
    final size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        height: size.height * 0.5,
        width: size.width * 0.3,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
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
                style: TextStyle(
                    color: Color.fromARGB(206, 66, 66, 66), fontSize: 20),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'ใบเสร็จ : ',
                    style: TextStyle(
                        color: Color.fromARGB(206, 66, 66, 66), fontSize: 20),
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
                    style: TextStyle(
                        color: Color.fromARGB(206, 66, 66, 66), fontSize: 20),
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
                  Container(
                    width: size.width * 0.13,
                    height: size.height * 0.065,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Color(0xFF1264E3))),
                    child: Center(
                      child: Text(
                        textAlign: TextAlign.center,
                        'พิมใบเสร็จ',
                        style:
                            TextStyle(color: Color(0xFF1264E3), fontSize: 16),
                      ),
                    ),
                  ),
                  Container(
                    width: size.width * 0.13,
                    height: size.height * 0.065,
                    decoration: BoxDecoration(
                        color: Color(0xFF1264E3),
                        borderRadius: BorderRadius.circular(8)),
                    child: Center(
                      child: Text(
                        textAlign: TextAlign.center,
                        'เสร็จ',
                        style: TextStyle(color: Colors.white, fontSize: 16),
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
