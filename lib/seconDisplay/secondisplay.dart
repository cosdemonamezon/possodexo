import 'dart:io';
import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:presentation_displays/displays_manager.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('แสดงหน้าจอที่สอง'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ShowScreen2Button(),
                SizedBox(height: 20),
                CancelScreenButton(),
                SizedBox(height: 20),
                DeviceInfoWidget(),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ShowScreen2Button extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        bool? isDisplayed = await DisplayManager().showSecondaryDisplay(displayId: 2, routerName: "presentation");

        if (isDisplayed == true) {
          await DisplayManager().transferDataToPresentation("ข้อมูลที่ต้องการแสดง");
        } else {
          print("ไม่สามารถแสดงหน้าจอที่สองได้");
        }
      },
      child: Text('แสดงหน้าจอที่สองและข้อมูล'),
    );
  }
}

class CancelScreenButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        DisplayManager().hideSecondaryDisplay(displayId: 2);
      },
      child: Text('ยกเลิกการแสดงหน้าจอที่สอง'),
    );
  }
}

class DeviceInfoWidget extends StatelessWidget {
  final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  Future<String> _getDeviceId() async {
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
      // เลือกค่าที่จะแสดงเป็น id
      return androidInfo.id ?? '';
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfoPlugin.iosInfo;
      return iosInfo.identifierForVendor ?? '';
    } else {
      return 'ไม่สามารถดึงข้อมูลได้';
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _getDeviceId(),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else {
          if (snapshot.hasError) {
            return Text('เกิดข้อผิดพลาด: ${snapshot.error}');
          } else {
            return Text('หมายเลขเครื่อง: ${snapshot.data}');
          }
        }
      },
    );
  }
}
