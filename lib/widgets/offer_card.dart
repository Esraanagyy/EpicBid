import 'dart:io';

import 'package:flutter/material.dart';

class OfferCard extends StatelessWidget {
  OfferCard({
    super.key,
    required this.productName,
    this.image,
    required this.price,
    required this.color,
  });

  String? image;
  String productName;
  String price;
  Color color;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double horizontalPadding = size.width * 0.05;
    final double verticalPadding = size.height * 0.03;

    return Padding(
      padding: EdgeInsets.only(
        top: verticalPadding,
        left: horizontalPadding,
        right: horizontalPadding,
      ),
      child: Container(
        width: size.width * 0.9,
        height: size.height * 0.12,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(32),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: size.height * -0.06,
              child: image != null && image!.isNotEmpty
                  ? File(image!).existsSync()
                      ? Image.file(
                          File(image!),
                          width: size.width * 0.35,
                          height: size.width * 0.35,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Image.asset(
                            'assets/images/placeholder.png',
                            width: size.width * 0.35,
                            height: size.width * 0.35,
                            fit: BoxFit.cover,
                          ),
                        )
                      : Image.asset(
                          image!,
                          width: size.width * 0.35,
                          height: size.width * 0.35,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Image.asset(
                            'assets/images/placeholder.png',
                            width: size.width * 0.35,
                            height: size.width * 0.35,
                            fit: BoxFit.cover,
                          ),
                        )
                  : Image.asset(
                      'assets/images/placeholder.png',
                      width: size.width * 0.35,
                      height: size.width * 0.35,
                      fit: BoxFit.cover,
                    ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: size.height * 0.02,
                left: size.width * 0.38,
              ),
              child: Text(
                productName,
                style: const TextStyle(
                  color: Colors.black,
                  fontFamily: 'Inter',
                  fontSize: 22,
                  fontWeight: FontWeight.w300,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: size.height * 0.06,
                left: size.width * 0.38,
              ),
              child: Text(
                price,
                style: const TextStyle(
                  color: Colors.black,
                  fontFamily: 'Inter',
                  fontSize: 20, // Slightly smaller to fit longer prices
                  fontWeight: FontWeight.w600,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: size.width * 0.82,
                top: size.height * 0.04,
              ),
              child: const ImageIcon(
                AssetImage("assets/icons/heart.png"),
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
