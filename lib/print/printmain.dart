import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:imin_printer/imin_printer.dart';
import 'package:imin_printer/enums.dart';
import 'package:imin_printer/imin_style.dart';
import 'package:imin_printer/column_maker.dart';
import 'package:permission_handler/permission_handler.dart';
// import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const Printter());
}

class Printter extends StatefulWidget {
  const Printter({super.key});

  @override
  State<Printter> createState() => _PrintterState();
}

class _PrintterState extends State<Printter> {
  bool permissionStatus = false;
  final iminPrinter = IminPrinter();
  @override
  void initState() {
    super.initState();
    getMediaFilePermission();
  }

  /// 获取媒体文件读写权限
  Future<void> getMediaFilePermission() async {
    Map<Permission, PermissionStatus> statuses = await [Permission.manageExternalStorage].request();
    if (!mounted) return;
    //granted 通过，denied 被拒绝，permanentlyDenied 拒绝且不在提示
    if (statuses[Permission.manageExternalStorage]!.isGranted) {
      setState(() {
        permissionStatus = true;
      });
    }
    setState(() {
      permissionStatus = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Imin Printer Example'),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                ElevatedButton(
                    child: const Text('init Printer'),
                    onPressed: () async {
                      await iminPrinter.initPrinter();
                    }),
                ElevatedButton(
                    onPressed: () async {
                      String? state = await iminPrinter.getPrinterStatus();
                      // Fluttertoast.showToast(
                      //     msg: state ?? '',
                      //     toastLength: Toast.LENGTH_LONG,
                      //     gravity: ToastGravity.BOTTOM, // 消息框弹出的位置
                      //     // timeInSecForIos: 1,  // 消息框持续的时间（目前的版本只有ios有效）
                      //     backgroundColor: Colors.red,
                      //     textColor: Colors.white,
                      //     fontSize: 16.0);
                    },
                    child: const Text('getPrinterStatus')),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                ElevatedButton(
                    onPressed: () async {
                      await iminPrinter.printText(
                          'iMin advocates the core values of "Integrity, Customer First, Invention&Creation, Patience”, using cloud-based technology to help businesses to get  access to the Internet and also increases their data base, by providing more solutions so that their business can take a step further. Through their efficiency enhancement, cost improvement, service innovation, and  better services for consumers, these aspect will drives the entire industry development.',
                          style: IminTextStyle(wordWrap: true));
                    },
                    child: const Text('Text in word wrap')),
                ElevatedButton(
                    onPressed: () async {
                      await iminPrinter.printText('居中', style: IminTextStyle(align: IminPrintAlign.center));
                    },
                    child: const Text('text alignment'))
              ]),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () async {
                        await iminPrinter.printText('测试字体大小', style: IminTextStyle(fontSize: 25));
                      },
                      child: const Text('Text fontSize')),
                  ElevatedButton(
                      onPressed: () async {
                        await iminPrinter.printText('测试打印字体', style: IminTextStyle(typeface: IminTypeface.typefaceMonospace));
                      },
                      child: const Text('Text typeface'))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () async {
                        await iminPrinter.printText('测试打印字体样式', style: IminTextStyle(fontStyle: IminFontStyle.boldItalic));
                      },
                      child: const Text('Text style')),
                  ElevatedButton(
                      onPressed: () async {
                        Uint8List byte = await _getImageFromAsset('assets/images/doraemon.jpg');
                        await iminPrinter.printSingleBitmap(byte);
                      },
                      child: const Text('print singleBitmap'))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () async {
                        await iminPrinter.printAndLineFeed();
                      },
                      child: const Text('print AndLineFeed')),
                  ElevatedButton(
                      onPressed: () async {
                        await iminPrinter.printAndFeedPaper(100);
                      },
                      child: const Text('print AndFeedPaper'))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () async {
                        await iminPrinter.printText(
                            '''ออดิทอเรียมเซนเซอร์เฮอร์ริเคนวิป คอมเมนท์ มอคค่าสตรอว์เบอร์รีไดเอ็ตคอนเซ็ปต์ บูติกกรอบรูปเซ็กส์ โปรเจ็คโบ้ย โหลยโท่ย คอนโดมิเนียมแทงโก้มลภาวะขั้นตอน ห่วยมาร์ชพุดดิ้ง โง่เขลาจังโก้สุริยยาตร มอลล์สติ๊กเกอร์ราสเบอร์รีออร์แกนิก นินจา ปาร์ตี้อันตรกิริยาแรลลี่ตัวตนภควัมบดี เอ๊าะซาบะบัตเตอร์บุ๋น ชาร์จโบ้ยวอลนัต โบว์บ็อกซ์ บู๊ไฟลท์รูบิกหลินจือโค้ช

ออสซี่แฟลชออร์แกนไชน่า แคทวอล์คยังไง เสกสรรค์แฟ้บ เอ๋อคอมเมนต์ปาสเตอร์ ยากูซ่าวโรกาสรัม ลีกเคลื่อนย้ายแทงโก้ เวณิกาวอลล์เทรนด์ อีสต์บุญคุณเปปเปอร์มินต์ไฮเอนด์พันธกิจ อาร์พีจีเวิร์คสติ๊กเกอร์เพียวกู๋ แทกติคเกจิเซรามิก แคร็กเกอร์เปเปอร์ คอลเล็กชั่น สามช่าเชฟนพมาศยาวีแฟนตาซี สี่แยก เนอะภควัทคีตาลอร์ด โทรอีสเตอร์สเกตช์เจ็ต

ด็อกเตอร์เป็นไง ﻿กรรมาชน ติ่มซำสเตริโอกรีน ยนตรกรรมวอลล์เซอร์วิส แฮนด์มาร์ตแจ๊กเก็ตเซลส์แมนฮาร์ด โกะเลสเบี้ยนนู้ด ดีพาร์ตเมนต์คาเฟ่ฉลุยแทคติค ไฟแนนซ์บาร์บีคิว วาซาบิ แดรี่เซฟตี้ฟลุค สตรอเบอรี สหัชญาณแฟนซี รีไทร์เอสเปรสโซ เวอร์ท็อปบูต ราเม็งวิลเลจหลวงตาอีสเตอร์ซันตาคลอส สคริปต์

แบด มลภาวะโมจิสตาร์ บูม สต็อคอ่วม เบอร์รีเอาท์ดอร์อพาร์ทเมนท์พลาซ่า คอลัมน์ ซาตานมหาอุปราชาชาร์จเอสเปรสโซโค้ช สถาปัตย์ออดิชั่นคาราโอเกะดีไซน์ ฮอตดอกฟาสต์ฟู้ดเลสเบี้ยน ซาบะโฮปสไปเดอร์แล็บโอเวอร์ วันเวย์พันธกิจคัตเอาต์เคส ยอมรับสป็อตนินจา เรซิ่น แพนดารีไซเคิลวิทย์เดบิตโอเปอเรเตอร์ ตาปรือสุริยยาตร อัลไซเมอร์เลดี้

แดนเซอร์ราชบัณฑิตยสถานโมเดิร์น โมเดิร์นคีตกวีวิดีโอ ฟรังก์แรงผลักมาราธอนแอนด์ทอล์ค เคลมปิยมิตรรุสโซเอ็นทรานซ์การันตี แล็บบริกรมยุราภิรมย์ ลิมิตอิเหนาช็อปอาว์ฮ็อตด็อก ครัวซองต์เบอร์รีติว ฟินิกซ์มอลล์ คอนเซ็ปต์กาญจน์ มยุราภิรมย์โปรเจ็กต์ ไบโอวอร์รูมดั๊มพ์กฤษณ์ ป่าไม้มาราธอนเยอบีร่าอาร์ติสต์ซะ ปัจฉิมนิเทศ สเตอริโอวอลนัต ไฮเวย์ซันตาคลอสรุสโซเทรดอีแต๋น สตาร์ทตรวจทานแทงโก้''');
                      },
                      child: const Text('print Text')),
                  ElevatedButton(
                      onPressed: () async {
                        Uint8List byte = await readFileBytes('assets/images/logo.png');
                        await iminPrinter.printSingleBitmap(byte, alignment: IminPrintAlign.center);
                      },
                      child: const Text('print singleBitmap in align'))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () async {
                        await iminPrinter.printQrCode('https://www.imin.sg',
                            qrCodeStyle:
                                IminQrCodeStyle(errorCorrectionLevel: IminQrcodeCorrectionLevel.levelH, qrSize: 4, align: IminPrintAlign.left));
                      },
                      child: const Text('print QrCode')),
                  ElevatedButton(
                      onPressed: () async {
                        await iminPrinter.printColumnsText(cols: [
                          ColumnMaker(text: '1', width: 1, fontSize: 26, align: IminPrintAlign.center),
                          ColumnMaker(text: 'iMin', width: 2, fontSize: 26, align: IminPrintAlign.left),
                          ColumnMaker(text: 'iMin', width: 1, fontSize: 26, align: IminPrintAlign.right)
                        ]);
                      },
                      child: const Text('print ColumnsText'))
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () async {
                        await iminPrinter.printBarCode(IminBarcodeType.jan13, "0123456789012",
                            style: IminBarCodeStyle(align: IminPrintAlign.center, position: IminBarcodeTextPos.textAbove));
                      },
                      child: const Text('print barCode')),
                  ElevatedButton(
                      onPressed: () async {
                        Uint8List byte1 = await _getImageFromAsset('assets/images/logo.png');
                        Uint8List byte2 = await _getImageFromAsset('assets/images/logo.png');

                        await iminPrinter.printMultiBitmap([byte1, byte2], alignment: IminPrintAlign.left);
                      },
                      child: const Text('print multiBitmap'))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                ElevatedButton(
                    onPressed: () async {
                      await iminPrinter.printAntiWhiteText(
                          'iMin is a service provider who focuses mainly on the field of business intelligence, bringing IoT, AI and cloud service to the business sector. We develop and provide a wide range of intelligent commercial hardware solutions which help businesses to run more cost effectively.');
                    },
                    child: const Text('print antiWhiteText')),
                ElevatedButton(
                    onPressed: () async {
                      await iminPrinter.printDoubleQR(
                          qrCode1: IminDoubleQRCodeStyle(
                            text: 'www.imin.sg',
                          ),
                          qrCode2: IminDoubleQRCodeStyle(
                            text: 'www.google.com',
                          ),
                          doubleQRSize: 5);
                    },
                    child: const Text('print DoubleQR'))
              ]),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                ElevatedButton(
                    onPressed: () async {
                      await iminPrinter.partialCut();
                    },
                    child: const Text('partialCut')),
              ]),
            ),
          ],
        )),
      ),
    );
  }
}

Future<Uint8List> readFileBytes(String path) async {
  ByteData fileData = await rootBundle.load(path);
  Uint8List fileUnit8List = fileData.buffer.asUint8List(fileData.offsetInBytes, fileData.lengthInBytes);
  return fileUnit8List;
}

Future<Uint8List> _getImageFromAsset(String iconPath) async {
  return await readFileBytes(iconPath);
}
