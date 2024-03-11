import 'package:flutter/material.dart';
import 'package:possodexo/home/data/detialdata.dart';
import 'package:possodexo/home/model/detialmodel.dart';

class TablePromotion extends StatefulWidget {
  const TablePromotion({super.key});

  @override
  State<TablePromotion> createState() => _TablePromotionState();
}

class _TablePromotionState extends State<TablePromotion> {
  late List<ProDetail> prodetails;
  int? sortColumnIndex;
  bool isAscending = false;
  @override
  void initState() {
    super.initState();

    prodetails = List.of(allDetails);
  }

  Widget build(BuildContext context) => AlertDialog(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(2))),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "โปรโมชั่นทั้งหมด",
              style: TextStyle(
                fontFamily: 'IBMPlexSansThai',
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Image.asset(
              "assets/icons/Subtract.png",
              scale: 15,
            )
          ],
        ),
        content: buildDatatable(),
      );

  Widget buildDatatable() {
    final columns = [
      'PromoCode',
      'Type',
      'PromotionName',
      'Details',
      'StartDate',
      'ExpirationDate',
    ];

    return DataTable(
      sortAscending: isAscending,
      sortColumnIndex: sortColumnIndex,
      columns: getColumns(columns),
      rows: getRows(prodetails),
    );
  }

  List<DataColumn> getColumns(List<String> columns) => columns
      .map((String column) => DataColumn(
            label: Text(column),
            onSort: onSort,
          ))
      .toList();

  List<DataRow> getRows(List<ProDetail> prodetails) => prodetails.map((ProDetail detail) {
        final cells = [detail.promoCode, detail.type, detail.promotionName, detail.details, detail.StartDate, detail.ExpirationDate];
        ;
        return DataRow(cells: getCells(cells));
      }).toList();
  List<DataCell> getCells(List<dynamic> cells) => cells.map((data) => DataCell(Text("$data"))).toList();
  void onSort(int columIndex, bool ascending) {
    if (columIndex == 0) {
      prodetails.sort((detail1, detail2) => compareString(ascending, detail1.promoCode, detail2.promoCode));
    } else if (columIndex == 1) {
      prodetails.sort((detail1, detail2) => compareString(ascending, detail1.type, detail2.type));
    } else if (columIndex == 2) {
      prodetails.sort((detail1, detail2) => compareString(ascending, detail1.promotionName, detail2.promotionName));
    } else if (columIndex == 3) {
      prodetails.sort((detail1, detail2) => compareString(ascending, detail1.details, detail2.details));
    } else if (columIndex == 4) {
      prodetails.sort((detail1, detail2) => compareString(ascending, detail1.StartDate, detail2.StartDate));
    } else if (columIndex == 5) {
      prodetails.sort((detail1, detail2) => compareString(ascending, detail1.ExpirationDate, detail2.ExpirationDate));
    }
    setState(() {
      this.sortColumnIndex = columIndex;
      this.isAscending = ascending;
    });
  }

  int compareString(bool ascending, String detail1, String detail2) => ascending ? detail1.compareTo(detail2) : detail2.compareTo(detail1);
}
