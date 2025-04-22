import 'package:epicBid/pages/cart_page.dart';
import 'package:epicBid/widgets/bottom_navigation_bar_widget.dart';
import 'package:epicBid/widgets/flash_offer_card.dart';
import 'package:epicBid/widgets/offer_card.dart';
import 'package:epicBid/widgets/popular_card.dart';
import 'package:epicBid/widgets/search_widget.dart';
import 'package:epicBid/widgets/top_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});
  static String id = 'home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, String>> categories = [
    {'name': 'Pillows', 'icon': 'assets/images/pillow.png'},
    {'name': 'Chairs', 'icon': 'assets/images/chair.png'},
    {'name': 'Circular Tables', 'icon': 'assets/images/round table.png'},
    {'name': 'Tables', 'icon': 'assets/images/table.png'},
    {'name': 'Lamps', 'icon': 'assets/images/lamp.png'},
    {'name': 'Couches', 'icon': 'assets/images/couch.png'},
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 480,
              height: 400,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xff2D5356),
                    Color(0xff738D8F),
                  ],
                  begin: Alignment.topLeft, // Gradient start point
                  end: Alignment.bottomRight, // Gradient end point
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: -50,
                    left: 311,
                    child: Container(
                      width: 270,
                      height: 270,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(400),
                        color: Colors.white.withOpacity(0.1),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 167,
                    left: 323,
                    child: Container(
                      width: 270,
                      height: 270,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(400),
                        color: Colors.white.withOpacity(0.1),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 70,
                      left: 18,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          "Welcome My Friend",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Inter',
                            fontSize: 18,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        const SizedBox(
                          width: 210,
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.pushNamed(context, CartPage.id);
                          },
                          child: const ImageIcon(
                            AssetImage("assets/icons/cart.png"),
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 92,
                      left: 18,
                    ),
                    child: Text(
                      "Sara Nagy",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Inter',
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 150,
                      left: 18,
                      right: 18,
                    ),
                    child: SearchWidget(
                      textColor: const Color(0xff4C4C4C),
                      fillColor: Colors.white,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 240,
                      left: 18,
                    ),
                    child: Text(
                      "All Categories",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 290,
                      left: 18,
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: categories.map((category) {
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Colors.grey[200],
                                  backgroundImage: AssetImage(
                                    category['icon']!,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(category['name']!,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                    )),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
                width: 469,
                height: 571,
                decoration: const BoxDecoration(
                  color: Color(0xffF5F5F5),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25), // Use Radius.circular
                    topRight: Radius.circular(25), // Use Radius.circular
                  ),
                ),
                child: ListView(
                  children: [
                    TopCardSlider(),
                    const Padding(
                      padding: EdgeInsets.only(
                        top: 20,
                        left: 18,
                        bottom: 10,
                        right: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Popular Products",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Inter',
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 150,
                            ),
                            child: Text(
                              "View All",
                              style: TextStyle(
                                color: Color(0xff4C4C4C),
                                fontFamily: 'Inter',
                                fontSize: 18,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      padding: const EdgeInsets.only(
                        top: 5,
                        left: 18,
                      ),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          PopularCard(
                            color: const Color(0xff7B5A46),
                            productName: 'sofa',
                            rate: '5.0',
                            price: '4000 LE',
                            image: 'assets/images/sofa.png',
                          ),
                          PopularCard(
                            color: const Color(0xff70524A),
                            productName: 'chair Arms',
                            rate: '5.0',
                            price: '2500 LE',
                            image: 'assets/images/brown chair.png',
                          ),
                          PopularCard(
                            color: const Color(0xff7B5A46),
                            productName: 'home chair',
                            rate: '5.0',
                            price: '1000 LE',
                            image: 'assets/images/sofa.png',
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        left: 18,
                        bottom: 10,
                        right: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Best offers",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Inter',
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "View All",
                            style: TextStyle(
                              color: Color(0xff4C4C4C),
                              fontFamily: 'Inter',
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                    OfferCard(
                      productName: 'Home chair',
                      image: 'assets/images/pink.png',
                      price: '1200 Le',
                      color: const Color(0xffCA9991),
                    ),
                    OfferCard(
                      productName: 'Home chair',
                      image: 'assets/images/yellow chair.png',
                      price: '1000 Le',
                      color: const Color(0xffF7E072),
                    ),
                    OfferCard(
                      productName: 'Room Bed',
                      image: 'assets/images/bed.png',
                      price: '3200 Le',
                      color: const Color(0xff0087A8),
                    ),
                    const FlashOfferCard(),
                    const Padding(
                      padding: EdgeInsets.only(
                        top: 20,
                        left: 18,
                        bottom: 10,
                        right: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Popular Auctions",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Inter',
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "View All",
                            style: TextStyle(
                              color: Color(0xff4C4C4C),
                              fontFamily: 'Inter',
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      padding: const EdgeInsets.only(
                        top: 5,
                        left: 18,
                      ),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          PopularCard(
                            color: const Color(0xff7B5A46),
                            productName: 'sofa',
                            rate: '5.0',
                            price: '4000 LE',
                            image: 'assets/images/sofa.png',
                          ),
                          PopularCard(
                            color: const Color(0xff70524A),
                            productName: 'chair Arms',
                            rate: '5.0',
                            price: '2500 LE',
                            image: 'assets/images/brown chair.png',
                          ),
                          PopularCard(
                            color: const Color(0xff7B5A46),
                            productName: 'home chair',
                            rate: '5.0',
                            price: '1000 LE',
                            image: 'assets/images/sofa.png',
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(
        selectedIndex: 0,
      ),
    );
  }
}
