import 'package:epicBid/pages/additional_information_page.dart';
import 'package:epicBid/widgets/review_card.dart';
import 'package:flutter/material.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({super.key});
  static String id = 'review';

  @override
  Widget build(BuildContext context) {
    // Safely retrieve arguments from Navigator
    final arguments = ModalRoute.of(context)?.settings.arguments;
    final Map<String, dynamic> args =
        arguments is Map<String, dynamic> ? arguments : {};
    final String imagePath = args['imagePath'] ?? 'assets/images/room.png';
    final String productName = args['productName'] ?? 'Unknown Product';
    final double? price = args['price'] is double ? args['price'] : null;
    final int productId =
        args['productId'] is int ? args['productId'] : 0; // Fallback to 0

    return Scaffold(
      backgroundColor: const Color(0xffDDCDC2),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context); // Changed to pop for back navigation
          },
          child: const ImageIcon(
            AssetImage("assets/icons/arrow.png"),
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            "Review for $productName",
            style: const TextStyle(
              color: Colors.black,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              fontSize: 18,
            ),
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, AdditionalInformationPage.id);
              },
              child: const ImageIcon(
                AssetImage("assets/icons/dots.png"),
                size: 42,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              imagePath,
              width: 459,
              height: 400,
              errorBuilder: (context, error, stackTrace) => Image.asset(
                'assets/images/room.png',
                width: 459,
                height: 459,
              ),
            ),
            ReviewCard(
              productName: productName,
              price: price,
              productId: productId, // Pass productId
            ),
          ],
        ),
      ),
    );
  }
}
