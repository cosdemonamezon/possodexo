class Receipt {
  final String receiptnumber;
  final String type;
  final String promotionName;
  final String details;
  final String StartDate;
  final String ExpirationDate;

  const Receipt({
    required this.receiptnumber,
    required this.type,
    required this.promotionName,
    required this.details,
    required this.StartDate,
    required this.ExpirationDate,
  });
  Receipt copy({
    String? promoCode,
    String? type,
    String? promotionName,
    String? details,
    String? StartDate,
    String? ExpirationDate,
  }) =>
      Receipt(
        receiptnumber: promoCode ?? this.receiptnumber,
        type: type ?? this.type,
        promotionName: promotionName ?? this.promotionName,
        details: details ?? this.details,
        StartDate: StartDate ?? this.StartDate,
        ExpirationDate: ExpirationDate ?? this.ExpirationDate,
      );
}
