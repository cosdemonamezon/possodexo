import 'package:flutter/material.dart';

class Policypage extends StatefulWidget {
  const Policypage({super.key});

  @override
  State<Policypage> createState() => _PolicypageState();
}

class _PolicypageState extends State<Policypage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AlertDialog(
      surfaceTintColor: Colors.white,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(2))),
      title: Text("desofo"),
    );
  }
}
