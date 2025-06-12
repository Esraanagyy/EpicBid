import 'package:flutter/material.dart';

class CartCard extends StatefulWidget {
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
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  late int quantity = 0;

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final size = MediaQuery.of(context).size;
    final double padding = size.width * 0.043; // 18/420 ≈ 0.043

    return Padding(
      padding: EdgeInsets.only(
        top: size.width * 0.095, // 40/420 ≈ 0.095
        left: padding,
        right: padding,
      ),
      child: Container(
        width: size.width * 0.95, // 404/420 ≈ 0.95
        height: size.width * 0.238, // 100/420 ≈ 0.238
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius:
              BorderRadius.circular(size.width * 0.076), // 32/420 ≈ 0.076
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: -size.width * 0.119, // -50/420 ≈ -0.119
              child: Image.asset(
                widget.image,
                width: size.width * 0.381, // 160/420 ≈ 0.381
                height: size.width * 0.381,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: size.width * 0.043, // 18/420 ≈ 0.043
                left: size.width * 0.369, // 155/420 ≈ 0.369
              ),
              child: Text(
                widget.productName,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Inter',
                  fontSize: size.width * 0.052, // 22/420 ≈ 0.052
                  fontWeight: FontWeight.w300,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: size.width * 0.119, // 50/420 ≈ 0.119
                left: size.width * 0.405, // 170/420 ≈ 0.405
              ),
              child: Text(
                widget.price,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Inter',
                  fontSize: size.width * 0.052, // 22/420 ≈ 0.052
                  fontWeight: FontWeight.w600,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: size.width * 0.719, // (0.95 - 0.188 - 0.043)
                top: size.width * 0.081, // 34/420 ≈ 0.081
              ),
              child: Container(
                width: size.width * 0.188, // 79/420 ≈ 0.188
                height: size.width * 0.079, // 33/420 ≈ 0.079
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(
                      size.width * 0.057), // 24/420 ≈ 0.057
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          quantity++;
                        });
                      },
                      child: Text(
                        '+',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Inter',
                          fontSize: size.width * 0.048, // 20/420 ≈ 0.048
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Text(
                      quantity.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Inter',
                        fontSize: size.width * 0.038, // 16/420 ≈ 0.038
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          if (quantity > 0) quantity--;
                        });
                      },
                      child: Text(
                        '-',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Inter',
                          fontSize: size.width * 0.048, // 20/420 ≈ 0.048
                          fontWeight: FontWeight.w400,
                        ),
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
