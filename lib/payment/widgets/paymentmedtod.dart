import 'package:flutter/material.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({Key? key}) : super(key: key);

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  int selectedIndex = 0;
  void onItemTapped(int index) => setState(() => selectedIndex = index);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 5,
        childAspectRatio: 5,
        crossAxisSpacing: 5,
      ),
      itemCount: 11,
      itemBuilder: (BuildContext context, int index) => InkWell(
        onTap: () => onItemTapped(index),
        child: Container(
          decoration: BoxDecoration(
            color: selectedIndex == index
                ? const Color(0xfffE8EAF6)
                : Colors.white,
            border: Border.all(color: const Color(0xff1264E3)),
            borderRadius: BorderRadius.circular(8),
          ),
          height: size.height * 0.05,
          width: size.width * 0.11,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Image.asset(_getPaymentMethodIcon(index), scale: 20),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(_getPaymentMethodName(index)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getPaymentMethodIcon(int index) {
    switch (index) {
      case 0:
        return "assets/icons/cash.png";
      case 1:
        return "assets/icons/Promptpay.png";
      case 2:
        return "assets/icons/TrueMoney.png";
      case 3:
        return "assets/icons/MaeManee.png";
      case 4:
        return "assets/icons/Linepay.png";
      case 5:
        return "assets/icons/moneyCard.png";
      case 6:
        return "assets/icons/MaeManee.png";
      case 7:
        return "assets/icons/EmCard.png";
      case 8:
        return "assets/icons/Wechart.png";
      case 9:
        return "assets/icons/Alipay.png";
      case 10:
        return "assets/icons/Wallet.png";
      default:
        return "assets/icons/cash.png";
    }
  }

  String _getPaymentMethodName(int index) {
    switch (index) {
      case 0:
        return "เงินสด";
      case 1:
        return "QR Promptpay";
      case 2:
        return "True Money";
      case 3:
        return "แม่มณี";
      case 4:
        return "LINE Pay";
      case 5:
        return "บัตรเครดิต/เดบิต";
      case 6:
        return "แม่มณี";
      case 7:
        return "บัตรพนักงาน";
      case 8:
        return "We Chart";
      case 9:
        return "Alipay";
      case 10:
        return "อื่นๆ";
      default:
        return "เงินสด";
    }
  }
}
