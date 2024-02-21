class ProDetail {
  final String promoCode;
  final String type;
  final String promotionName;
  final String details;
  final String StartDate;
  final String ExpirationDate;

  const ProDetail({
    required this.promoCode,
    required this.type,
    required this.promotionName,
    required this.details,
    required this.StartDate,
    required this.ExpirationDate,
  });
  ProDetail copy({
    String? promoCode,
    String? type,
    String? promotionName,
    String? details,
    String? StartDate,
    String? ExpirationDate,
  }) =>
      ProDetail(
        promoCode: promoCode ?? this.promoCode,
        type: type ?? this.type,
        promotionName: promotionName ?? this.promotionName,
        details: details ?? this.details,
        StartDate: StartDate ?? this.StartDate,
        ExpirationDate: ExpirationDate ?? this.ExpirationDate,
      );
}
