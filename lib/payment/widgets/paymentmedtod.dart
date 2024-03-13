import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:possodexo/home/service/productController.dart';
import 'package:provider/provider.dart';

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({Key? key}) : super(key: key);

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

  void onItemTapped(int index) => setState(() => selectedIndex = index);
  Future<void> getListPayment() async {
    try {
      await context.read<ProductController>().getListPayment();
    } on Exception catch (e) {
      // inspect(e);
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
                        //   scale: 10,)
                        // Image.network(
                        //   productController.payments[index].icon!,
                        //   scale: 10,
                        // ),
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
