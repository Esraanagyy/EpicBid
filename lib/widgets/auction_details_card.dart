import 'package:epicBid/pages/cart_page.dart';
import 'package:epicBid/pages/chat_page.dart';
import 'package:epicBid/pages/review_page.dart';
import 'package:flutter/material.dart';

class AuctionDetailsCard extends StatelessWidget {
  AuctionDetailsCard({
    super.key,
    required this.name,
    required this.price,
    required this.description,
    required this.rate,
  });
  String name;
  String price;
  String description;
  String rate;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 570,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(32),
          topLeft: Radius.circular(32),
        ),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(
              top: 10,
              left: 86,
              right: 86,
            ),
            child: Divider(
              height: 1,
              thickness: 0.1,
              color: Colors.black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                  ),
                ),
                Text(
                  price,
                  style: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    fontSize: 22,
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              top: 10,
              left: 19,
              right: 19,
            ),
            child: Divider(
              height: 1,
              thickness: 0.1,
              color: Colors.black,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              top: 10,
              left: 18,
            ),
            child: Text(
              "Description",
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                fontSize: 18,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 5,
              left: 18,
            ),
            child: Text(
              description,
              style: const TextStyle(
                color: Colors.black,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                fontSize: 13,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              top: 10,
              left: 19,
              right: 19,
            ),
            child: Divider(
              height: 1.2,
              thickness: 0.2,
              color: Colors.black,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              top: 8,
              left: 19,
              right: 19,
            ),
            child: Row(
              children: [
                Text(
                  "Color",
                  style: TextStyle(
                    color: Color(0xff4C4C4C),
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
                Spacer(),
                CircleAvatar(
                  backgroundColor: Color(0xffD09423),
                  radius: 25,
                ),
                Spacer(),
                Text(
                  "Location:",
                  style: TextStyle(
                    color: Color(0xff4C4C4C),
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
                Text(
                  "cairo",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
                Spacer(),
                Text(
                  "available:",
                  style: TextStyle(
                    color: Color(0xff4C4C4C),
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
                Text(
                  "4",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              top: 10,
              left: 19,
              right: 19,
            ),
            child: Divider(
              height: 1.5,
              thickness: 0.2,
              color: Colors.black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 19),
            child: Row(
              children: [
                const Text(
                  "Seller Rate",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(width: 8),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, ReviewPage.id);
                  },
                  child: const Text(
                    "Add Review",
                    style: TextStyle(
                      color: Color(0xff2D5356),
                      decoration: TextDecoration.underline,
                      decorationColor: Color(0xff2D5356),
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                ),
                const Spacer(),
                const ImageIcon(
                  AssetImage("assets/icons/star.png"),
                  color: Color(0xffD09423),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Text(
                    rate,
                    style: const TextStyle(
                      color: Color(0xff4C4C4C),
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              top: 8,
              left: 18,
              right: 18,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Seller Name: ",
                          style: TextStyle(
                            color: Color(0xff4C4C4C),
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "Ahmed Ehab",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Pno: ",
                          style: TextStyle(
                            color: Color(0xff4C4C4C),
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "01118935045",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "Report",
                      style: TextStyle(
                        color: Color(0xff2D5356),
                        decoration: TextDecoration.underline,
                        decorationColor: Color(0xff2D5356),
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                CircleAvatar(
                  backgroundImage: AssetImage("assets/images/seller.png"),
                  radius: 25,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
              left: 18,
              right: 18,
            ),
            child: Container(
              width: 364,
              height: 28,
              decoration: BoxDecoration(
                color: const Color(0xffCCCCCC),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "(Host): Hello My Friend",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, ChatPage.id);
                      },
                      child: const ImageIcon(
                        AssetImage("assets/icons/chat.png"),
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 18,
              left: 18,
              right: 18,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 140,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadiusDirectional.circular(22),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset("assets/icons/-.png"),
                      const Text(
                        "2",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Inter',
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Image.asset("assets/icons/+.png"),
                    ],
                  ),
                ),
                const Row(
                  children: [
                    Text(
                      "Total: ",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Inter',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "3600",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Inter',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 18,
              left: 18,
              right: 18,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, CartPage.id);
                  },
                  child: Container(
                    width: 63,
                    height: 63,
                    decoration: BoxDecoration(
                        color: const Color(0xffD09423),
                        borderRadius: BorderRadius.circular(43)),
                    child: Image.asset('assets/icons/cart2.png'),
                  ),
                ),
                Container(
                  width: 284,
                  height: 62,
                  decoration: BoxDecoration(
                      color: const Color(0xff2D5356),
                      borderRadius: BorderRadius.circular(62)),
                  child: const Padding(
                    padding: EdgeInsets.only(top: 18),
                    child: Text(
                      "Buy Now",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Inter',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
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
