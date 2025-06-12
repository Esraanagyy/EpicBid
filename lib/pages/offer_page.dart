import 'package:epicBid/pages/place_bid_page.dart';
import 'package:flutter/material.dart';

class OfferPage extends StatelessWidget {
  const OfferPage({super.key});
  static String id = 'offer';

  @override
  Widget build(BuildContext context) {
    late int productId;
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    productId = args?['productId'] as int? ?? 0;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/bid.jpg',
              fit: BoxFit.cover,
            ),
          ),

          // Scaffold content
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0, // Remove shadow
              leading: InkWell(
                onTap: () => Navigator.pop(context),
                child: const ImageIcon(
                  AssetImage("assets/icons/arrow.png"),
                ),
              ),
            ),
            body: Container(
              color: Colors.transparent,
              child: Stack(
                children: [
                  Positioned(
                    top: 800, // Adjust this position as needed
                    left: 25,
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          PlaceBidPage.id,
                          arguments: {'productId': productId},
                        );
                      },
                      child: Container(
                        width: 410,
                        height: 53,
                        decoration: BoxDecoration(
                          color: const Color(0xffD09423),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: Text(
                            "Add Offer",
                            style: TextStyle(
                              color: Color(0xffFAFAFA),
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              fontSize: 24,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
