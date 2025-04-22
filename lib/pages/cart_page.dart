import 'package:epicBid/pages/check_out_page.dart';
import 'package:epicBid/widgets/check_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/cart_card.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  static String id='cart';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: const Padding(
          padding: EdgeInsets.only(left: 8),
          child: Text(
            'Cart',
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Inter',
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right:  8),
            child: CircleAvatar(
              backgroundColor: Color(0xff79B5B9),
              child:Text(
                '3',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Inter',
                  fontSize: 24,
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
            price: '1200 Le',
            color: const Color(0xffCA9991),
          ),
          CartCard(
            productName: 'Home chair',
            image: 'assets/images/yellow chair.png',
            price: '1000 Le',
            color: const Color(0xffF7E072),
          ),
          CartCard(
            productName: 'Room Bed',
            image: 'assets/images/bed.png',
            price: '3200 Le',
            color: const Color(0xff0087A8),
          ),
         const Padding(
           padding: EdgeInsets.only(top: 20,left: 170),
           child: Row(
                  children: [
                    Icon(CupertinoIcons.cart_fill,color: Colors.black),
                    Text(
                      'Add More',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Inter',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
              ),
         ),
          const CheckWidget(),

        ],

      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20,left: 16,right: 16),
        child: InkWell(
          onTap: (){
            Navigator.pushNamed(context, CheckOutPage.id);
          },
          child: Container(
            width: 404,
            height: 58,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(32),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset('assets/icons/circular_cart.png'),
                const Text(
                  'Check Out',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Inter',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Image.asset('assets/icons/right_arrow.png'),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
