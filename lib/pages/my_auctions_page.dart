import 'package:epicBid/pages/create_auction.dart';
import 'package:epicBid/pages/profile_page.dart';
import 'package:epicBid/widgets/offer_card.dart';
import 'package:flutter/material.dart';

class MyAuctionsPage extends StatelessWidget {
  const MyAuctionsPage({super.key});
  static String id = 'my auctions';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.pushNamed(context, ProfilePage.id);
          },
          child: Image.asset('assets/icons/arrow.png'),
        ),
        title: const Text(
          'My Auctions',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Inter',
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: AuctionData.auctions.isEmpty
          ? const Center(child: Text('No auctions created yet'))
          : ListView.builder(
              itemCount: AuctionData.auctions.length,
              itemBuilder: (context, index) {
                final auction = AuctionData.auctions[index];
                return OfferCard(
                  productName: auction.name,
                  image: auction.image,
                  price: auction.price,
                  color: auction.color,
                );
              },
            ),
    );
  }
}
