import 'package:epicBid/pages/check_out_page.dart';
import 'package:epicBid/widgets/check_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/cart_card.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  static String id = 'cart';

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final size = MediaQuery.of(context).size;
    final double padding = size.width * 0.019; // 8/420 ≈ 0.019

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: EdgeInsets.only(left: padding),
          child: Text(
            'Cart',
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
                '3',
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
      body: ListView(
        children: [
          CartCard(
            productName: 'Home chair',
            image: 'assets/images/pink.png',
            price: '120 LE',
            color: const Color(0xffCA9991),
          ),
          CartCard(
            productName: 'Home chair',
            image: 'assets/images/yellow chair.png',
            price: '100 LE',
            color: const Color(0xffF7E072),
          ),
          CartCard(
            productName: 'Room Bed',
            image: 'assets/images/bed.png',
            price: '1000 LE',
            color: const Color(0xff0087A8),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: size.width * 0.048, // 20/420 ≈ 0.048
              left: size.width * 0.370,
            ),
            child: Row(
              children: [
                Icon(
                  CupertinoIcons.cart_fill,
                  color: Colors.black,
                  size: size.width * 0.06, // Scaled icon
                ),
                Text(
                  'Add More',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Inter',
                    fontSize: size.width * 0.038, // 16/420 ≈ 0.038
                    fontWeight: FontWeight.w400,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: size.width * 0.048,
            ),
            child: const CheckWidget(),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          bottom: size.width * 0.048, // 20/420 ≈ 0.048
          left: size.width * 0.038, // 16/420 ≈ 0.038
          right: size.width * 0.038,
        ),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, CheckOutPage.id);
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
                  'Check Out',
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
