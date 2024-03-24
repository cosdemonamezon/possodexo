import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:possodexo/home/firstPage.dart';
import 'package:possodexo/home/service/productController.dart';
import 'package:possodexo/login/loginPage.dart';
import 'package:possodexo/login/services/loginController.dart';
import 'package:possodexo/seconDisplay/listpayment.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

@pragma('vm:entry-point')
void secondaryDisplayMain() {
  debugPrint('second main');
  runApp(MySecondApp());
}

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
        body: Listpayment(),
      ),
    );
  }
}

String? token;
late SharedPreferences prefs;

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.immersiveSticky,
  );
  // await SystemChrome.setSystemUIChangeCallback(
  //     (systemOverlaysAreVisible) async {
  //   print("Chand:$systemOverlaysAreVisible");
  // });
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  prefs = await SharedPreferences.getInstance();
  token = await prefs.getString('token');

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
        ChangeNotifierProvider(create: (context) => LoginController()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          fontFamily: 'IBMPlexSansThai',
        ),
        debugShowCheckedModeBanner: false,
        home: token == null ? LoginPage() : FirstPage(),
        // home: Printter(
        //     // selectedItem: [],
        //     // sumPrice: '',
        //     // sumQTY: '',
        //     ),
      ),
    );
  }
}
