import 'package:flutter/material.dart';

class CartCard extends StatelessWidget {
  CartCard({
    super.key,
    required this.productName,
    required this.image,
    required this.price,
    required this.color,
  });
  String image;
  String productName;
  String price;
  Color color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 40,
        left: 18,
        right: 18,
      ),
      child: Container(
        width: 404,
        height: 100,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(32),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: -50,
              child: Image.asset(
                image,
                width: 160,
                height: 160,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 18,
                left: 155,
              ),
              child: Text(
                productName,
                style: const TextStyle(
                  color: Colors.black,
                  fontFamily: 'Inter',
                  fontSize: 22,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 50,
                left: 170,
              ),
              child: Text(
                price,
                style: const TextStyle(
                  color: Colors.black,
                  fontFamily: 'Inter',
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 310,
                top: 34,
              ),
              child: Container(
                width: 79,
                height: 33,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      '+',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Inter',
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      '1',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Inter',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      '-',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Inter',
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}