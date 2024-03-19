import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:possodexo/home/firstPage.dart';
import 'package:possodexo/login/widgets/InputTextFormField.dart';
import 'package:possodexo/login/widgets/RegisTextFormField.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white60,
      body: Row(
        children: [
          Expanded(
              flex: 5,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/screen_login.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              )),
          Expanded(
            flex: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    //color: Colors.red,
                    height: size.height * 0.45,
                    width: size.width * 0.35,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'เข้าสู่ระบบ',
                          style: TextStyle(fontSize: 30),
                        ),
                        InputTextFormField(size: size),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        RegisTextFormField(
                          size: size,
                        ),
                        SizedBox(
                          height: size.height * 0.04,
                        ),
                        GestureDetector(
                          onTap: () async {
                            await SystemChrome.setEnabledSystemUIMode(
                              SystemUiMode.immersiveSticky,
                            );
                            if (!mounted) return;
                            Navigator.push(context, MaterialPageRoute(builder: (context) => FirstPage()));
                          },
                          child: Card(
                            color: Colors.blue,
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: SizedBox(
                              width: double.infinity,
                              height: size.height * 0.06,
                              child: Center(
                                  child: Text(
                                'เข้าสู่ระบบ',
                                style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                              )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
