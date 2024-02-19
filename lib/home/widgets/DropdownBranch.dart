import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:possodexo/constants.dart';

class DropdownBranch extends StatelessWidget {
  DropdownBranch({super.key, required this.sizeValue, required this.size, required this.onSelected});

  final String sizeValue;
  final Size size;
  Function(String?) onSelected;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      elevation: 2,
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          isExpanded: true,
          hint: Text(
            'Select Item',
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).hintColor,
            ),
          ),
          items: sizeDepartment
              .map((String item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ))
              .toList(),
          value: sizeValue,
          onChanged: onSelected,
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
  }
}
