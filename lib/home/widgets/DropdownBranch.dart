import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:possodexo/constants.dart';
import 'package:possodexo/home/service/productController.dart';
import 'package:possodexo/models/branch.dart';
import 'package:provider/provider.dart';

class DropdownBranch extends StatefulWidget {
  DropdownBranch({
    super.key,
  });

  @override
  State<DropdownBranch> createState() => _DropdownBranchState();
}

class _DropdownBranchState extends State<DropdownBranch> {
  Branch? sizeValue;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<ProductController>(
        builder: (context, productController, child) {
      final branchs = productController.branchs;
      return Card(
        surfaceTintColor: Colors.white,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        elevation: 2,
        child: DropdownButtonHideUnderline(
          child: DropdownButton2<Branch>(
            isExpanded: true,
            hint: Text(
              'Select Item',
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'IBMPlexSansThai',
                color: Theme.of(context).hintColor,
              ),
            ),
            items: branchs
                .map((Branch item) => DropdownMenuItem<Branch>(
                      value: item,
                      child: Text(
                        item.name!,
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'IBMPlexSansThai',
                        ),
                      ),
                    ))
                .toList(),
            value: sizeValue,
            onChanged: (va) {
              setState(() {
                sizeValue = va;
              });
            },
            buttonStyleData: ButtonStyleData(
              padding: EdgeInsets.symmetric(horizontal: 8),
              height: size.height * 0.08,
            ),
            menuItemStyleData: MenuItemStyleData(
              height: size.height * 0.08,
            ),
          ),
        ),
      );
    });
  }
}
