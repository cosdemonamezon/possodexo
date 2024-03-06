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
import 'package:provider/provider.dart';
import 'package:possodexo/payment/widgets/Discount.dart';
import 'package:possodexo/payment/widgets/paymentCash.dart';

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

  // This widget is the root of your application.
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
        home: LoginPage(
            // selectedItem: [],
            // sumPrice: '',
            // sumQTY: '',
            ),
      ),
    );
  }
}
