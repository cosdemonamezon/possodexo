import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:possodexo/home/service/productController.dart';
import 'package:possodexo/models/payment.dart';
import 'package:possodexo/widgets/AlertDialogYesNo.dart';
import 'package:provider/provider.dart';

class PaymentMethod extends StatefulWidget {
  PaymentMethod({Key? key, required this.onPayment}) : super(key: key);
  final Function(Payment) onPayment;
  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  int selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    getListPayment();
  }

  void onItemTapped(int index) => setState(() {
        selectedIndex = index;
        widget.onPayment(context.read<ProductController>().payments[selectedIndex]);
      });
  Future<void> getListPayment() async {
    try {
      await context.read<ProductController>().getListPayment();
      widget.onPayment(context.read<ProductController>().payments[0]);
    } on Exception catch (e) {
      if (!mounted) return;
      showDialog(
        context: context,
        builder: (context) => AlertDialogYes(
          title: 'แจ้งเตือน',
          description: '${e}',
          pressYes: () {
            Navigator.pop(context, true);
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<ProductController>(
      builder: (context, productController, child) => GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 5,
          childAspectRatio: 5,
          crossAxisSpacing: 5,
        ),
        itemCount: productController.payments.length,
        itemBuilder: (BuildContext context, int index) => InkWell(
          onTap: () => onItemTapped(index),
          child: Container(
            decoration: BoxDecoration(
              color: selectedIndex == index ? const Color(0xfffE8EAF6) : Colors.white,
              border: Border.all(color: const Color(0xff1264E3)),
              borderRadius: BorderRadius.circular(8),
            ),
            height: size.height * 0.05,
            width: size.width * 0.11,
            child: Row(
              children: [
                productController.payments[index].icon == null
                    ? SizedBox()
                    : Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: SvgPicture.network(
                          productController.payments[index].icon!,
                        )
                        
                        ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(productController.payments[index].name!),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
