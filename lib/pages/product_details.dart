import 'package:epicBid/pages/additional_information_page.dart';
import 'package:epicBid/pages/store_page.dart';
import 'package:epicBid/widgets/details_card.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});
  static String id = 'details';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffDDCDC2),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () {
            Navigator.pushNamed(context, StorePage.id);
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
      body: Column(
        children: [
          Image.asset(
            "assets/images/room.png",
            width: 450,
            height: 423,
          ),
          const DetailsCard(),
        ],
      ),
    );
  }
}
