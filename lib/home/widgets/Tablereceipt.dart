import 'package:flutter/material.dart';
import 'package:possodexo/home/data/receipt.dart';
import 'package:possodexo/home/model/receiptmodel.dart';

class Tablereceipt extends StatefulWidget {
  const Tablereceipt({
    Key? key,
    required this.closeblack,
  }) : super(key: key);

  final VoidCallback closeblack;

  @override
  State<Tablereceipt> createState() => _TablereceiptState();
}

class _TablereceiptState extends State<Tablereceipt> {
  late List<Receipt> redetails;
  int? sortColumnIndex;
  bool isAscending = false;

  @override
  void initState() {
    super.initState();
    redetails = List.of(receipts);
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
      rows: getRows(redetails),
    );
  }

  List<DataColumn> getColumns(List<String> columns) => columns
      .map((String column) => DataColumn(
            label: Text(column),
            onSort: onSort,
          ))
      .toList();

  List<DataRow> getRows(List<Receipt> redetails) => redetails.map((Receipt redetail) {
        final cells = [
          redetail.receiptnumber,
          redetail.date,
          redetail.employee,
          redetail.salesperson,
          redetail.numberofproducts,
          redetail.tax,
          redetail.paymentmethod,
          redetail.status,
          // เพิ่มรูปภาพในคอลัมน์ "empty"
          Image.asset(redetail.empty),
        ];
        return DataRow(cells: getCells(cells));
      }).toList();

  List<DataCell> getCells(List<dynamic> cells) => cells.map((data) => DataCell(data is String ? Text(data) : data)).toList();

  void onSort(int columIndex, bool ascending) {
    // Your sorting logic here
    setState(() {
      this.sortColumnIndex = columIndex;
      this.isAscending = ascending;
    });
  }
}
