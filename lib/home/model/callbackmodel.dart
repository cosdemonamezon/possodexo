class Callback {
  final String receiptnumber;
  final String date;
  final String employee;
  final String salesperson;
  final String numberofproducts;
  final String tax;
  final String paymentmethod;
  final String netbalance;
  final String status;
  final String imageUrl;

  const Callback({
    required this.receiptnumber,
    required this.date,
    required this.employee,
    required this.salesperson,
    required this.numberofproducts,
    required this.tax,
    required this.paymentmethod,
    required this.netbalance,
    required this.status,
    required this.imageUrl,
  });
  Callback copy({
    String? promoCode,
    String? date,
    String? salesperson,
    String? numberofproducts,
    String? tax,
    String? paymentmethod,
    String? netbalance,
    String? imageUrl,
  }) =>
      Callback(
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
