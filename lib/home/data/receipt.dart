import 'package:possodexo/home/model/detialmodel.dart';
import 'package:possodexo/home/model/receiptmodel.dart';

final allDetails = <Receipt>[
  Receipt(
    receiptnumber: "mainPRO5per",
    promotionName: "Discount",
    type: "Main Promotion",
    details: "แถมโค้ก 2 ขวด",
    StartDate: "01/01/2024",
    ExpirationDate: "30/04/2024",
  ),
  Receipt(
    receiptnumber: "Dec1Gat1",
    promotionName: "Discount",
    type: "Main Promotion",
    details: "ซื้อ 1 แถม 1 ชิ้น",
    StartDate: "01/09/2024",
    ExpirationDate: "30/12/2024",
  ),
  Receipt(
    receiptnumber: "DecDiscount129",
    promotionName: "Gift",
    type: "Promotion Set",
    details: "แถมโค้ก 1 ขวด",
    StartDate: "01/12/2025",
    ExpirationDate: "31/01/2025",
  ),
  Receipt(
    receiptnumber: "buy2pay100",
    promotionName: "Discount",
    type: "On Top Promotion",
    details: "สินค้าลดเหลือ 100",
    StartDate: "15/03/2025",
    ExpirationDate: "31/06/2025",
  ),
  Receipt(
    receiptnumber: "buy2pay90",
    promotionName: "Gift",
    type: "Promotion Set",
    details: "สินค้าลดเหลือ 90",
    StartDate: "01/11/2025",
    ExpirationDate: "31/12/2025",
  ),
];
