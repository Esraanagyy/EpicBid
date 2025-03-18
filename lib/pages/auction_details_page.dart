import 'package:epicBid/pages/auction_page.dart';
import 'package:epicBid/widgets/auction_details_card.dart';
import 'package:flutter/material.dart';

class AuctionDetailsPage extends StatelessWidget {
  const AuctionDetailsPage({super.key});
  static String id = 'auction details';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF9E899),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () {
            Navigator.pushNamed(context, AuctionPage.id);
          },
          child: const ImageIcon(
            AssetImage("assets/icons/arrow.png"),
          ),
        ),
        title: const Padding(
          padding: EdgeInsets.only(top: 8),
          child: Text(
            "Auction Details",
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              fontSize: 18,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 280, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 66,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "4 days",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 81,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      textAlign: TextAlign.center,
                      "22 Hours",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Image.asset(
            "assets/images/big chair.png",
            width: 412,
            height: 274,
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: AuctionDetailsCard(),
          ),
        ],
      ),
    );
  }
}
