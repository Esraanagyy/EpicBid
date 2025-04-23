import 'package:epicBid/pages/create_auction.dart';
import 'package:epicBid/widgets/auction_card.dart';
import 'package:epicBid/widgets/bottom_navigation_bar_widget.dart';
import 'package:flutter/material.dart';

import 'cart_page.dart';

class AuctionPage extends StatelessWidget {
  const AuctionPage({super.key});
  static String id = 'auction';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 50,
              left: 18,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Auctions",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Inter',
                    fontSize: 26,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, CartPage.id);
                    },
                    child: const ImageIcon(
                      AssetImage("assets/icons/cart.png"),
                      color: Color(0xff2D5356),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 900,
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 8,
                    left: 18,
                    right: 18,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(
                              bottom: 8,
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
                                  "  Private",
                                  style: TextStyle(
                                    color: Color(0xff4C4C4C),
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  "  open",
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
                          AuctionCard(
                            color: const Color(0xffF9E899),
                            productName: 'Modern chair',
                            image: 'assets/images/yellow chair.png',
                            price: '1200 LE',
                            height: 246,
                          ),
                        ],
                      ),
                      AuctionCard(
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
                      AuctionCard(
                        color: const Color(0xffE98B44),
                        productName: 'Light Lamp',
                        image: 'assets/images/top lamp.png',
                        price: '1500 LE',
                        height: 296,
                      ),
                      AuctionCard(
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
                      AuctionCard(
                        color: const Color(0xffCA9991),
                        productName: 'Modern chair',
                        image: 'assets/images/pink.png',
                        price: '1200 LE',
                        height: 246,
                      ),
                      AuctionCard(
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
                      AuctionCard(
                        color: const Color(0xff936B49),
                        productName: 'Modern Table',
                        image: 'assets/images/top table.png',
                        price: '800 LE',
                        height: 296,
                      ),
                      AuctionCard(
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
      floatingActionButton: InkWell(
        onTap: (){
          Navigator.pushNamed(context, CreateAuction.id);
        },
          child: Image.asset('assets/icons/create.png',scale: 1.3,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: const BottomNavigationBarWidget(
        selectedIndex: 2,
      ),
    );
  }
}
