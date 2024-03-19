import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:imin_printer/column_maker.dart';
import 'package:imin_printer/imin_printer.dart';
import 'package:imin_printer/enums.dart';
import 'package:imin_printer/imin_style.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const Printter());
}

class Printter extends StatefulWidget {
  const Printter({Key? key}) : super(key: key);

  @override
  State<Printter> createState() => _PrintterState();
}

class _PrintterState extends State<Printter> {
  bool permissionStatus = false;
  bool printerInitialized = false;
  final iminPrinter = IminPrinter();

  @override
  void initState() {
    super.initState();
    getMediaFilePermission();
    initPrinter();
    printContent();
  }

  Future<void> getMediaFilePermission() async {
    Map<Permission, PermissionStatus> statuses = await [Permission.manageExternalStorage].request();
    if (!mounted) return;
    if (statuses[Permission.manageExternalStorage]!.isGranted) {
      setState(() {
        permissionStatus = true;
      });
    }
    setState(() {
      permissionStatus = false;
    });
  }

  Future<void> initPrinter() async {
    await iminPrinter.initPrinter();
    setState(() {
      printerInitialized = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Imin Printer Example'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: printerInitialized ? printContent : null,
                  child: Column(
                    children: [
                      Text('Print Content'),
                      SizedBox(),
                    ],
                  ),
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
            ),
          ),
        ),
      ),
    );
  }

  void printContent() async {
    String? state = await iminPrinter.getPrinterStatus();
    Fluttertoast.showToast(
      msg: state ?? '',
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
    // Print Image and Right Aligned Text
    Uint8List byte = await _getImageFromAsset('assets/images/logowhitemini.png');
    await iminPrinter.printSingleBitmap(
      byte,
      alignment: IminPrintAlign.center,
    );
    await iminPrinter.printAndLineFeed();
    // Print Text
    await iminPrinter.printText(
      'BPS-Top up - Cashier 2',
      style: IminTextStyle(
        wordWrap: true,
        fontSize: 22,
        space: 0,
        align: IminPrintAlign.left,
      ),
    );
    await iminPrinter.printAndLineFeed();
    await iminPrinter.printText(
      'Bangkok Patana School',
      style: IminTextStyle(
        wordWrap: true,
        fontSize: 22,
        space: 10,
        align: IminPrintAlign.left,
      ),
    );
    await iminPrinter.printAndLineFeed();
    await iminPrinter.printColumnsText(
      cols: [
        ColumnMaker(
          text: 'T ID# 17022109',
          width: 1,
          fontSize: 22,
          align: IminPrintAlign.left,
        ),
        ColumnMaker(
          text: 'MID# 0000000033',
          width: 1,
          fontSize: 22,
          align: IminPrintAlign.right,
        ),
      ],
    );
    await iminPrinter.printAndLineFeed();
    await iminPrinter.printColumnsText(
      cols: [
        ColumnMaker(
          text: 'BATCH# 001487',
          width: 1,
          fontSize: 22,
          align: IminPrintAlign.left,
        ),
        ColumnMaker(
          text: 'PTN#001CB',
          width: 1,
          fontSize: 22,
          align: IminPrintAlign.right,
        ),
      ],
    );
    await iminPrinter.printAndLineFeed();
    await iminPrinter.printColumnsText(
      cols: [
        ColumnMaker(
          text: 'Expiry date 08-2226',
          width: 1,
          fontSize: 22,
          align: IminPrintAlign.left,
        ),
        ColumnMaker(
          text: 'TRACE#013754',
          width: 1,
          fontSize: 22,
          align: IminPrintAlign.right,
        ),
      ],
    );

    await iminPrinter.printAndLineFeed();

    await iminPrinter.printColumnsText(
      cols: [
        ColumnMaker(
          text: 'BPSIDCARD',
          width: 1,
          fontSize: 22,
          align: IminPrintAlign.left,
        ),
        ColumnMaker(
          text: 'SVC#462287547521477401',
          width: 1,
          fontSize: 20,
          align: IminPrintAlign.right,
        ),
      ],
    );
    await iminPrinter.printAndLineFeed();

    await iminPrinter.printText(
      'Welcome',
      style: IminTextStyle(
        wordWrap: true,
        fontSize: 22,
        space: 10,
        align: IminPrintAlign.center,
      ),
    );
    await iminPrinter.printAndLineFeed();

    await iminPrinter.printText(
      '======Txn Ecpn reload ====== 02-02-24 10:01======',
      style: IminTextStyle(
        wordWrap: true,
        fontSize: 22,
        space: 10,
        align: IminPrintAlign.center,
      ),
    );
    await iminPrinter.printAndLineFeed();

    await iminPrinter.printColumnsText(
      cols: [
        ColumnMaker(
          text: 'Transction anount(Baht)',
          width: 1,
          fontSize: 22,
          align: IminPrintAlign.left,
        ),
        ColumnMaker(
          text: '0.00',
          width: 1,
          fontSize: 22,
          align: IminPrintAlign.right,
        ),
      ],
    );
    await iminPrinter.printAndLineFeed();

    await iminPrinter.printText(
      '============Total remain============',
      style: IminTextStyle(
        wordWrap: true,
        fontSize: 22,
        space: 10,
        align: IminPrintAlign.center,
      ),
    );
    await iminPrinter.printAndLineFeed();

    await iminPrinter.printColumnsText(
      cols: [
        ColumnMaker(
          text: 'Point',
          width: 1,
          fontSize: 22,
          align: IminPrintAlign.left,
        ),
        ColumnMaker(
          text: '0.00',
          width: 1,
          fontSize: 22,
          align: IminPrintAlign.right,
        ),
      ],
    );
    await iminPrinter.printAndLineFeed();

    await iminPrinter.printColumnsText(
      cols: [
        ColumnMaker(
          text: 'Purse anount(Baht)',
          width: 1,
          fontSize: 22,
          align: IminPrintAlign.left,
        ),
        ColumnMaker(
          text: '10.00',
          width: 1,
          fontSize: 22,
          align: IminPrintAlign.right,
        ),
      ],
    );
    await iminPrinter.printAndLineFeed();

    await iminPrinter.printText(
      '---------Ecpn--------Exp-date---------Get--Total--------',
      style: IminTextStyle(
        wordWrap: true,
        fontSize: 22,
        space: 10,
        align: IminPrintAlign.center,
      ),
    );
    await iminPrinter.printAndLineFeed();

    await iminPrinter.printText(
      '0000009545454651651: Daily 50 Baht',
      style: IminTextStyle(
        wordWrap: true,
        fontSize: 20,
        space: 10,
        align: IminPrintAlign.left,
      ),
    );
    await iminPrinter.printAndLineFeed();

    await iminPrinter.printColumnsText(
      cols: [
        ColumnMaker(
          text: 'Daily50Baht(Cpn)',
          width: 1,
          fontSize: 22,
          align: IminPrintAlign.left,
        ),
        ColumnMaker(
          text: '+10',
          width: 1,
          fontSize: 22,
          align: IminPrintAlign.center,
        ),
        ColumnMaker(
          text: '10',
          width: 1,
          fontSize: 22,
          align: IminPrintAlign.right,
        ),
      ],
    );
    await iminPrinter.printAndLineFeed();

    await iminPrinter.printText(
      '--------------------Werchant copy-----------------',
      style: IminTextStyle(
        wordWrap: true,
        fontSize: 22,
        space: 10,
        align: IminPrintAlign.center,
      ),
    );

    // Print QR Code
    await iminPrinter.printQrCode(
      'https://www.example.com',
      qrCodeStyle: IminQrCodeStyle(
        errorCorrectionLevel: IminQrcodeCorrectionLevel.levelH,
        qrSize: 5,
        align: IminPrintAlign.center,
      ),
    );
  }

  Future<Uint8List> _getImageFromAsset(String iconPath) async {
    ByteData fileData = await rootBundle.load(iconPath);
    Uint8List fileUnit8List = fileData.buffer.asUint8List(fileData.offsetInBytes, fileData.lengthInBytes);
    return fileUnit8List;
  }
}
