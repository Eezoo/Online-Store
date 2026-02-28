import 'provider/cart_provider.dart';
import '../../utility/extensions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../utility/animation/animated_switcher_wrapper.dart';
import 'components/buy_now_bottom_sheet.dart';
import 'components/cart_list_section.dart';
import 'components/empty_cart.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      context.cartProvider.getCartItems();
    });
    return Scaffold(
      appBar: AppBar(
        // title: const Text(
        //   "سلة المشتريات", //My Cart
        //   style: TextStyle(
        //       fontSize: 24,
        //       fontWeight: FontWeight.bold,
        //       color: AppColor.darkBlue),
        // ),
      ),
      body: Consumer<CartProvider>(
        builder: (context, cartProvider, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              cartProvider.myCartItems.isEmpty
                  ? const EmptyCart()
                  : Consumer<CartProvider>(
                      builder: (context, cartProvider, child) {
                        return CartListSection(
                            cartProducts: cartProvider.myCartItems);
                      },
                    ),

              //? total price section
              Container(
                margin: const EdgeInsets.only(bottom: 15),
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  textDirection: TextDirection.rtl,
                  children: [
                    const Text(
                      "المجموع", //Total
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
                    ),
                    AnimatedSwitcherWrapper(
                      child: Text(
                        textDirection: TextDirection.rtl,
                        "${context.cartProvider.getCartSubTotal()} د.ل",
                        // key: ValueKey<double>(cartProvider.getCartSubTotal()),
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFF1A4F8C),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              //? buy now button
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 30, right: 30, bottom: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(20)),
                    onPressed: context.cartProvider.myCartItems.isEmpty
                        ? null
                        : () {
                            showCustomBottomSheet(context);
                          },
                    child: const Text("شراء الان", //Buy Now
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
