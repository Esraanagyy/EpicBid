import 'package:epicBid/pages/cart_page.dart';
import 'package:epicBid/pages/chatbot_page.dart';
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
    // Get screen dimensions
    final size = MediaQuery.of(context).size;
    final double horizontalPadding = size.width * 0.05; // 5% of screen width
    final double topContainerHeight =
        size.height * 0.45; // 45% of screen height

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: double.infinity, // Full width
                height: topContainerHeight,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xff2D5356),
                      Color(0xff738D8F),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: size.height * -0.05,
                      left: size.width * 0.65,
                      child: Container(
                        width: size.width * 0.56,
                        height: size.width * 0.56,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(size.width * 0.83),
                          color: Colors.white.withOpacity(0.1),
                        ),
                      ),
                    ),
                    Positioned(
                      top: size.height * 0.19,
                      left: size.width * 0.68,
                      child: Container(
                        width: size.width * 0.56,
                        height: size.width * 0.56,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(size.width * 0.83),
                          color: Colors.white.withOpacity(0.1),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: size.height * 0.06, // Moved up from 0.08
                        left: horizontalPadding,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          Padding(
                            padding: EdgeInsets.only(right: horizontalPadding),
                            child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, CartPage.id);
                              },
                              child: const ImageIcon(
                                AssetImage("assets/icons/cart.png"),
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: size.height * 0.09, // Moved up from 0.11
                        left: horizontalPadding,
                      ),
                      child: const Text(
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
                      padding: EdgeInsets.only(
                        top: size.height * 0.16, // Adjusted from 0.18
                        left: horizontalPadding,
                        right: horizontalPadding,
                      ),
                      child: SearchWidget(
                        textColor: const Color(0xff4C4C4C),
                        fillColor: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: size.height * 0.25, // Adjusted from 0.27
                        left: horizontalPadding,
                      ),
                      child: const Text(
                        "All Categories",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18, // Reduced from 22
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: size.height * 0.31, // Adjusted from 0.33
                        left: horizontalPadding,
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
                                    radius:
                                        size.width * 0.06, // Reduced from 0.08
                                    backgroundColor: Colors.grey[200],
                                    backgroundImage: AssetImage(
                                      category['icon']!,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    category['name']!,
                                    style: const TextStyle(
                                      fontSize: 10, // Reduced from 12
                                      color: Colors.white,
                                    ),
                                  ),
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
                width: double.infinity, // Full width
                decoration: const BoxDecoration(
                  color: Color(0xffF5F5F5),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                        height: size.height *
                            0.03), // Added space before TopCardSlider
                    TopCardSlider(),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 20,
                        left: horizontalPadding,
                        bottom: 10,
                        right: horizontalPadding,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Popular Products",
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
                              color: const Color(0xff4C4C4C),
                              fontFamily: 'Inter',
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      padding: EdgeInsets.only(
                        top: 5,
                        left: horizontalPadding,
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
                    Padding(
                      padding: EdgeInsets.only(
                        left: horizontalPadding,
                        bottom: 10,
                        right: horizontalPadding,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
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
                              color: const Color(0xff4C4C4C),
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
                    Padding(
                      padding: EdgeInsets.only(
                        top: 20,
                        left: horizontalPadding,
                        bottom: 10,
                        right: horizontalPadding,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
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
                              color: const Color(0xff4C4C4C),
                              fontFamily: 'Inter',
                              fontSize: 18,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      padding: EdgeInsets.only(
                        top: 5,
                        left: horizontalPadding,
                        bottom: 20,
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
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, ChatBotPage.id);
        },
        backgroundColor: const Color(0xff2D5356),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        elevation: 4,
        child: const Icon(
          Icons.contact_support,
          color: Colors.white,
          size: 28,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: const BottomNavigationBarWidget(
        selectedIndex: 0,
      ),
    );
  }
}
