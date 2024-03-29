class Receipt {
  final String receiptnumber;
  final String date;
  final String employee;
  final String salesperson;
  final String numberofproducts;
  final String tax;
  final String paymentmethod;
  final String netbalance;
  final String status;
  final String imageUrl; // เพิ่มฟิลด์ imageUrl เพื่อเก็บ URL ของรูปภาพ

  const Receipt({
    required this.receiptnumber,
    required this.date,
    required this.employee,
    required this.salesperson,
    required this.numberofproducts,
    required this.tax,
    required this.paymentmethod,
    required this.netbalance,
    required this.status,
    required this.imageUrl, // ปรับเปลี่ยนตามการเพิ่มฟิลด์
  });

  Receipt copy({
    String? promoCode,
    String? date,
    String? salesperson,
    String? numberofproducts,
    String? tax,
    String? paymentmethod,
    String? netbalance,
    String? imageUrl, // ปรับเปลี่ยนตามการเพิ่มฟิลด์
  }) =>
      Receipt(
        receiptnumber: promoCode ?? this.receiptnumber,
        date: date ?? this.date,
        salesperson: salesperson ?? this.salesperson,
        employee: employee ?? this.employee,
        numberofproducts: numberofproducts ?? this.numberofproducts,
        tax: tax ?? this.tax,
        paymentmethod: paymentmethod ?? this.paymentmethod,
        netbalance: netbalance ?? this.netbalance,
        status: status,
        imageUrl: imageUrl ?? this.imageUrl, // ปรับเปลี่ยนตามการเพิ่มฟิลด์
      );
}
