import 'dart:html';

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
    return Container(
      width: size.width * 0.02,
      height: size.height * 0.1,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Colors.white),
    );
  }
}
