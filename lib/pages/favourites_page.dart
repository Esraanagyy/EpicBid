import 'package:epicBid/pages/profile_page.dart';
import 'package:epicBid/widgets/offer_card.dart';
import 'package:flutter/material.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({super.key});
  static String id='fav';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: InkWell(
          onTap: (){
            Navigator.pushNamed(context, ProfilePage.id);
          },
          child: Image.asset('assets/icons/arrow.png'),
        ),
        title: const Text(
          'Favourites',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Inter',
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: ListView(
        children: [
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
        ],
      ),
    );
  }
}
