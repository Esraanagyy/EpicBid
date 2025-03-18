import 'package:epicBid/widgets/bottom_navigation_bar_widget.dart';
import 'package:epicBid/widgets/search_widget.dart';
import 'package:epicBid/widgets/store_card.dart';
import 'package:flutter/material.dart';

class StorePage extends StatelessWidget {
  const StorePage({super.key});
  static String id = 'store';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(children: [
          const Padding(
            padding: EdgeInsets.only(
              top: 50,
              left: 18,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "EpicStore",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Inter',
                    fontSize: 26,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: ImageIcon(
                    AssetImage("assets/icons/cart.png"),
                    color: Color(0xff2D5356),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
              left: 18,
              right: 18,
            ),
            child: SearchWidget(
              textColor: Colors.white,
              fillColor: const Color(0xff468286),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              top: 20,
              left: 5,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "All",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
                Text(
                  "  Chairs",
                  style: TextStyle(
                    color: Color(0xff4C4C4C),
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
                Text(
                  "  Tables",
                  style: TextStyle(
                    color: Color(0xff4C4C4C),
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
                Text(
                  "  Lamps",
                  style: TextStyle(
                    color: Color(0xff4C4C4C),
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
                Text(
                  "  Pillows",
                  style: TextStyle(
                    color: Color(0xff4C4C4C),
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 800,
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 15,
                    left: 18,
                    right: 18,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      StoreCard(
                        color: const Color(0xffF9E899),
                        productName: 'Modern chair',
                        image: 'assets/images/yellow chair.png',
                        price: '1200 LE',
                        height: 246,
                      ),
                      StoreCard(
                        color: const Color(0xff936B49),
                        productName: 'Modern Table',
                        image: 'assets/images/top table.png',
                        price: '800 LE',
                        height: 296,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 18,
                    right: 18,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      StoreCard(
                        color: const Color(0xffE98B44),
                        productName: 'Light Lamp',
                        image: 'assets/images/top lamp.png',
                        price: '1500 LE',
                        height: 296,
                      ),
                      StoreCard(
                        color: const Color(0xff946355),
                        productName: 'Modern chair',
                        image: 'assets/images/brown chair.png',
                        price: '1200 LE',
                        height: 246,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 15,
                    left: 18,
                    right: 18,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      StoreCard(
                        color: const Color(0xffCA9991),
                        productName: 'Modern chair',
                        image: 'assets/images/pink.png',
                        price: '1200 LE',
                        height: 246,
                      ),
                      StoreCard(
                        color: Colors.grey.shade100,
                        productName: 'Modern Pillow',
                        image: 'assets/images/big pillow.png',
                        price: '800 LE',
                        height: 296,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 18,
                    right: 18,
                    bottom: 120,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      StoreCard(
                        color: const Color(0xff936B49),
                        productName: 'Modern Table',
                        image: 'assets/images/top table.png',
                        price: '800 LE',
                        height: 296,
                      ),
                      StoreCard(
                        color: const Color(0xffF9E899),
                        productName: 'Modern chair',
                        image: 'assets/images/yellow chair.png',
                        price: '1200 LE',
                        height: 246,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(
        selectedIndex: 1,
      ),
    );
  }
}
