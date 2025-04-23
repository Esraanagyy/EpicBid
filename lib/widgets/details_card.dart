import 'package:epicBid/pages/cart_page.dart';
import 'package:epicBid/pages/review_page.dart';
import 'package:flutter/material.dart';

class DetailsCard extends StatelessWidget {
  const DetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 465,
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
          const Padding(
            padding: EdgeInsets.only(
              top: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Luxe sofa Yellow",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                  ),
                ),
                Text(
                  "1800 LE",
                  style: TextStyle(
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
          const Padding(
            padding: EdgeInsets.only(
              top: 5,
              left: 18,
            ),
            child: Text(
              "Yorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per ....",
              style: TextStyle(
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
              top: 10,
              left: 18,
            ),
            child: Text(
              "Color",
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                fontSize: 18,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              top: 5,
              left: 80,
              right: 80,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  backgroundColor: Color(0xff947866),
                  radius: 25,
                ),
                CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 25,
                ),
                CircleAvatar(
                  backgroundColor: Color(0xffD09423),
                  radius: 25,
                ),
                CircleAvatar(
                  backgroundColor: Color(0xff263238),
                  radius: 25,
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              top: 15,
              left: 19,
              right: 19,
            ),
            child: Divider(
              height: 1,
              thickness: 0.2,
              color: Colors.black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 19),
            child: Row(
              children: [
                const Text(
                  "Review Rate",
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
                const Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Text(
                    "5.0",
                    style: TextStyle(
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
          Padding(
            padding: const EdgeInsets.only(
              top: 8,
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
              top: 10,
              left: 18,
              right: 18,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap:(){
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
