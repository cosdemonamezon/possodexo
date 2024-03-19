import 'package:flutter/material.dart';
import 'package:possodexo/home/data/callbackdata.dart';
import 'package:possodexo/home/data/receipt.dart';
import 'package:possodexo/home/model/callbackmodel.dart';
import 'package:possodexo/home/model/receiptmodel.dart';

class TableCallback extends StatefulWidget {
  const TableCallback({
    Key? key,
    required this.closeblack,
  }) : super(key: key);

  final VoidCallback closeblack;

  @override
  State<TableCallback> createState() => _TableCallbackState();
}

class _TableCallbackState extends State<TableCallback> {
  late List<Callback> calldetails;
  int? sortColumnIndex;
  bool isAscending = false;

  @override
  void initState() {
    super.initState();
    calldetails = List.of(callbackallDetails);
  }

  @override
  Widget build(BuildContext context) {
    return buildDatatable();
  }

  Widget buildDatatable() {
    final columns = ['เลขใบเสร็จ', 'วันที่', 'พนักงานขาย', 'จำนวนสินค้า', 'ภาษี(%)', 'วิธีการชำระเงิน', 'ยอดสุทธิ(บาท)', 'สถานะ', 'รูปภาพ'];

    return DataTable(
      headingRowColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
        // Set the color for different states like hovered, pressed, etc.
        if (states.contains(MaterialState.hovered)) {
          return Color(0xffECEFF1); // Color when hovered
        }
        return Color(0xffECEFF1); // Default color
      }),
      sortAscending: isAscending,
      sortColumnIndex: sortColumnIndex,
      columns: getColumns(columns),
      rows: getRows(calldetails),
    );
  }

  List<DataColumn> getColumns(List<String> columns) {
    return columns
        .map((String column) => DataColumn(
              label: Text(column),
              onSort: onSort,
            ))
        .toList();
  }

  List<DataRow> getRows(List<Callback> calldetails) => calldetails.map((Callback calldetail) {
        final cells = [
          calldetail.receiptnumber,
          calldetail.date,
          calldetail.employee,
          calldetail.salesperson,
          calldetail.numberofproducts,
          calldetail.tax,
          calldetail.paymentmethod,
          calldetail.status,
          Image.asset(
            calldetail.imageUrl,
            scale: 20,
          ),
        ];
        final dataCells = getCells(cells);
        if (calldetail.status == 'Close') {
          dataCells[7] = DataCell(Text(calldetail.status, style: TextStyle(color: Colors.green)));
        }

        return DataRow(cells: dataCells);
      }).toList();
  List<DataCell> getCells(List<dynamic> cells) => cells.map((data) => DataCell(data is String ? Text(data) : data)).toList();

  void onSort(int columIndex, bool ascending) {
    // Your sorting logic here
    setState(() {
      sortColumnIndex = columIndex;
      isAscending = ascending;
    });
  }
}
