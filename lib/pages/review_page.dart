import 'package:epicBid/pages/additional_information_page.dart';
import 'package:epicBid/pages/product_details.dart';
import 'package:epicBid/widgets/review_card.dart';
import 'package:flutter/material.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({super.key});
  static String id = 'review';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffDDCDC2),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () {
            Navigator.pushNamed(context, ProductDetails.id);
          },
          child: const ImageIcon(
            AssetImage("assets/icons/arrow.png"),
          ),
        ),
        title: const Padding(
          padding: EdgeInsets.only(top: 8),
          child: Text(
            "Product Details",
            style: TextStyle(
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
              "assets/images/room.png",
              width: 459,
              height: 459,
            ),
            const ReviewCard(),
          ],
        ),
      ),
    );
  }
}
