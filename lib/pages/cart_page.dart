import 'package:epicBid/cubits/basket_cubit/cart_storage.dart';
import 'package:epicBid/pages/check_out_page.dart';
import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
import '../widgets/cart_card.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});
  static String id = 'cart';

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    super.initState();
    // No need for addListener since ValueListenableBuilder handles it
  }

  @override
  void dispose() {
    // No need for removeListener since ValueListenableBuilder manages lifecycle
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context);
    final size = MediaQuery.of(context).size;
    final double padding = size.width * 0.019; // 8/420 ≈ 0.019
    final cartItems = CartStorage.getCartItems();

    // Calculate total price
    double totalPrice = 0.0;
    for (var item in cartItems) {
      totalPrice += (item['price'] as double) * (item['quantity'] as int);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: EdgeInsets.only(left: padding),
          child: Text(
            lang?.cart ?? '',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Inter',
              fontSize: size.width * 0.057, // 24/420 ≈ 0.057
              fontWeight: FontWeight.w500,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: padding),
            child: CircleAvatar(
              radius: size.width * 0.048, // ≈20px
              backgroundColor: const Color(0xff79B5B9),
              child: Text(
                cartItems.length.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Inter',
                  fontSize: size.width * 0.057, // 24/420 ≈ 0.057
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          )
        ],
      ),
      body: ValueListenableBuilder<List<Map<String, dynamic>>>(
        valueListenable: CartStorage.cartItemsNotifier,
        builder: (context, cartItems, child) {
          return cartItems.isEmpty
              ? const Center(
                  child: Text(
                    'Your cart is empty',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                )
              : ListView.builder(
                  padding: EdgeInsets.only(top: size.width * 0.095),
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    final item = cartItems[index];
                    return CartCard(
                      productName: item['productName'],
                      image: item['imagePath'],
                      price: '${item['price'].toStringAsFixed(2)} LE',
                      color: const Color(0xffCA9991), // Default color
                    );
                  },
                );
        },
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          bottom: size.width * 0.048, // 20/420 ≈ 0.048
          left: size.width * 0.038, // 16/420 ≈ 0.038
          right: size.width * 0.038,
        ),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(
              context,
              CheckOutPage.id,
              arguments: {'totalPrice': totalPrice},
            );
          },
          child: Container(
            width: size.width * 0.95, // 404/420 ≈ 0.95
            height: size.width * 0.138, // 58/420 ≈ 0.138
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius:
                  BorderRadius.circular(size.width * 0.076), // 32/420 ≈ 0.076
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  'assets/icons/circular_cart.png',
                  width: size.width * 0.06,
                ),
                Text(
                  lang?.checkOut ?? '',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Inter',
                    fontSize: size.width * 0.038, // 16/420 ≈ 0.038
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Image.asset(
                  'assets/icons/right_arrow.png',
                  width: size.width * 0.06,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
