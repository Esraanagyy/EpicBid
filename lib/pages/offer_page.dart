import 'package:epicBid/pages/place_bid_page.dart';
import 'package:flutter/material.dart';

class OfferPage extends StatelessWidget {
  const OfferPage({super.key});
  static String id = 'offer';

  @override
  Widget build(BuildContext context) {
    // Extract productId from arguments
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    final productId = args?['productId'] as int? ?? 0;

    // Get screen dimensions for responsiveness
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBodyBehindAppBar: true, // Make app bar transparent over background
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: const ImageIcon(
            AssetImage("assets/icons/arrow.png"),
            color: Colors.white, // Ensure icon is visible on background
            size: 24, // Responsive icon size
          ),
        ),
      ),
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/bid.jpg',
              fit: BoxFit.cover, // Scale image to cover screen
              alignment: Alignment.center, // Center image to avoid distortion
            ),
          ),
          // Foreground content
          SafeArea(
            child: Column(
              children: [
                const Spacer(), // Push button to bottom
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.05, // 5% of screen width
                    vertical: screenHeight * 0.02, // 2% of screen height
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        PlaceBidPage.id,
                        arguments: {'productId': productId},
                      );
                    },
                    child: Container(
                      width: double.infinity, // Full width minus padding
                      height: screenHeight *
                          0.07, // 7% of screen height (approx. 50-60px)
                      constraints: const BoxConstraints(
                        minHeight: 45,
                        maxHeight: 60,
                      ), // Constrain height for small/large screens
                      decoration: BoxDecoration(
                        color: const Color(0xffD09423),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          "Add Offer",
                          style: TextStyle(
                            color: const Color(0xffFAFAFA),
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            fontSize: screenWidth *
                                0.06, // Responsive font size (approx. 20-24px)
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
