import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:possodexo/home/firstPage.dart';
import 'package:possodexo/login/services/loginApi.dart';
import 'package:possodexo/login/services/loginController.dart';
import 'package:possodexo/login/widgets/InputTextFormField.dart';
import 'package:possodexo/login/widgets/RegisTextFormField.dart';
import 'package:possodexo/widgets/AlertDialogYesNo.dart';
import 'package:possodexo/widgets/LoadingDialog.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<LoginController>(builder: (context, controller, child) {
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
              child: Form(
                key: _loginFormKey,
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
                            InputTextFormField(
                              size: size,
                              controller: username,
                            ),
                            SizedBox(
                              height: size.height * 0.01,
                            ),
                            RegisTextFormField(
                              size: size,
                              controller: password,
                            ),
                            SizedBox(
                              height: size.height * 0.04,
                            ),
                            GestureDetector(
                              onTap: () async {
                                await SystemChrome.setEnabledSystemUIMode(
                                  SystemUiMode.immersiveSticky,
                                );
                                if (_loginFormKey.currentState!.validate()) {
                                  try {
                                    LoadingDialog.open(context);
                                    final _login = await controller.signIn(username: username.text, password: password.text);
                                    if (_login != null) {
                                      if (!mounted) return;
                                      LoadingDialog.close(context);
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => FirstPage()));
                                    } else {
                                      if (!mounted) return;
                                      LoadingDialog.close(context);
                                    }
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
            ),
          ],
        ),
      );
    });
  }
}
