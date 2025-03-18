import 'package:flutter/material.dart';

class PopularCard extends StatelessWidget {
  PopularCard({
    super.key,
    required this.color,
    required this.productName,
    required this.rate,
    required this.price,
    required this.image,
  });
  Color color;
  String productName;
  String rate;
  String price;
  String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 10,
        bottom: 50,
      ),
      child: Container(
        width: 148,
        height: 193,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 7,
                left: 5,
                bottom: 5,
              ),
              child: Column(
                children: [
                  Container(
                    width: 138,
                    height: 127,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                    ),
                    child: Stack(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(
                            top: 10,
                            left: 107,
                          ),
                          child: ImageIcon(
                            AssetImage('assets/icons/heart.png'),
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                            left: 22,
                            right: 22,
                          ),
                          child: Image.asset(
                            image,
                            width: 94,
                            height: 94,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 5,
                      top: 2,
                    ),
                    child: Row(
                      children: [
                        Text(
                          productName,
                          style: const TextStyle(
                            color: Color(0xff4C4C4C),
                            fontFamily: 'Inter',
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Spacer(),
                        const ImageIcon(
                          AssetImage('assets/icons/star.png'),
                          color: Color(0xffD09423),
                        ),
                        Text(
                          rate,
                          style: const TextStyle(
                            color: Color(0xff4C4C4C),
                            fontFamily: 'Inter',
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 5,
                        ),
                        child: Text(
                          price,
                          style: const TextStyle(
                            color: Colors.black,
                            fontFamily: 'Inter',
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const Spacer(),
                      const Stack(
                        children: [
                          ImageIcon(
                            AssetImage('assets/icons/add.png'),
                            color: Color(0xff2D5356),
                          ),
                          ImageIcon(
                            AssetImage('assets/icons/plus.png'),
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
