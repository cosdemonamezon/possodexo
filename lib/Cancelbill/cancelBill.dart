import 'package:flutter/material.dart';
import 'package:possodexo/home/widgets/TableCallback.dart';

class Cancelbill extends StatefulWidget {
  const Cancelbill({super.key});

  @override
  State<Cancelbill> createState() => _CancelbillState();
}

class _CancelbillState extends State<Cancelbill> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 15,
            child: Column(
              children: [
                Container(
                  height: size.height * 0.08,
                  width: double.infinity,
                  decoration: BoxDecoration(color: Color(0xFFECEFF1)),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Cancelbill"),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TableCallback(
                    closeblack: () {},
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
