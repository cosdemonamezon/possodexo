import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:possodexo/home/firstPage.dart';
import 'package:possodexo/home/homePage.dart';
import 'package:possodexo/home/service/productController.dart';
import 'package:possodexo/login/loginPage.dart';
import 'package:possodexo/payment/widgets/Proceedpayment.dart';
import 'package:possodexo/payment/widgets/paymentCash.dart';
import 'package:possodexo/print/printmain.dart';
import 'package:possodexo/seconDisplay/listpayment.dart';
import 'package:possodexo/seconDisplay/seconAds.dart';
import 'package:possodexo/seconDisplay/secondisplay.dart';
import 'package:provider/provider.dart';
import 'package:possodexo/payment/widgets/Discount.dart';
import 'package:possodexo/payment/widgets/paymentCash.dart';

// @pragma('vm:entry-point')
// void secondaryDisplayMain() {
//   debugPrint('second main');
//   runApp(MySecondApp());
// }

class MySecondApp extends StatelessWidget {
  MySecondApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: 'IBMPlexSansThai',
      ),
      home: Scaffold(
        body: SeconAds(),
      ),
    );
  }
}

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.immersiveSticky,
  );
  // await SystemChrome.setSystemUIChangeCallback(
  //     (systemOverlaysAreVisible) async {
  //   print("Chand:$systemOverlaysAreVisible");
  // });

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('th');

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductController()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          fontFamily: 'IBMPlexSansThai',
        ),
        debugShowCheckedModeBanner: false,
        home: Printter(),
        // home: Printter(
        //     // selectedItem: [],
        //     // sumPrice: '',
        //     // sumQTY: '',
        //     ),
      ),
    );
  }
}
