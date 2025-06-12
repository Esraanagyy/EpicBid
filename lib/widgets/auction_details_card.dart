import 'package:epicBid/pages/cart_page.dart';
import 'package:epicBid/pages/chat_page.dart';
import 'package:epicBid/pages/offer_page.dart';
import 'package:epicBid/pages/review_page.dart';
import 'package:flutter/material.dart';

class AuctionDetailsCard extends StatelessWidget {
  AuctionDetailsCard({
    super.key,
    required this.name,
    required this.price,
    required this.description,
    required this.rate,
    required this.imagePath,
    required this.productId,
  });
  String name;
  String price;
  String description;
  String rate;
  String imagePath;
  int productId;

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final size = MediaQuery.of(context).size;
    final double padding = size.width * 0.043; // 18/420 ≈ 0.043

    return Container(
      width: size.width * 0.95, // 400/420 ≈ 0.95
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
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  price,
                  style: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    fontSize: 22,
                  ),
                  overflow: TextOverflow.ellipsis,
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
          Padding(
            padding: const EdgeInsets.only(
              top: 8,
              left: 19,
              right: 19,
            ),
            child: Row(
              children: [
                const Text(
                  "Color",
                  style: TextStyle(
                    color: Color(0xff4C4C4C),
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
                const Spacer(),
                CircleAvatar(
                  backgroundColor: const Color(0xffD09423),
                  radius: size.width * 0.06, // 25/420 ≈ 0.06
                ),
                const Spacer(),
                const Text(
                  "Location:",
                  style: TextStyle(
                    color: Color(0xff4C4C4C),
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
                const Text(
                  "cairo",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const Spacer(),
                const Text(
                  "available:",
                  style: TextStyle(
                    color: Color(0xff4C4C4C),
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const Flexible(
                  child: Text(
                    "4",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                    overflow: TextOverflow.ellipsis,
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
          Padding(
            padding: const EdgeInsets.only(
              top: 8,
              left: 18,
              right: 18,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
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
                          "Sara Nagy",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                          overflow: TextOverflow.ellipsis,
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
                          overflow: TextOverflow.ellipsis,
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
                  backgroundImage: const AssetImage("assets/images/seller.png"),
                  backgroundColor: Colors.grey, // Fallback to debug visibility
                  radius: size.width * 0.06, // 25/420 ≈ 0.06
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 10,
              left: padding,
              right: padding,
            ),
            child: Container(
              width: size.width * 0.87, // 364/420 ≈ 0.87
              height: size.width * 0.067, // 28/420 ≈ 0.067
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
                      overflow: TextOverflow.ellipsis,
                    ),
                    InkWell(
                      onTap: () {
                        final productId = ModalRoute.of(context)
                                ?.settings
                                .arguments is Map<String, dynamic>
                            ? (ModalRoute.of(context)?.settings.arguments
                                    as Map<String, dynamic>)['id']
                                ?.toString()
                            : 'default_id';

                        Navigator.pushNamed(
                          context,
                          ChatPage.id,
                          arguments: {
                            'productId': productId,
                            'productName': name,
                            'sellerName': 'Sara Nagy',
                            'image': imagePath,
                          },
                        );
                      },
                      child: const ImageIcon(
                        AssetImage("assets/icons/chat.png"),
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 18,
              left: padding,
              right: padding,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: size.width * 0.33, // 140/420 ≈ 0.33
                  height: size.width * 0.107, // 45/420 ≈ 0.107
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadiusDirectional.circular(22),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset("assets/icons/-.png",
                          width: size.width * 0.05),
                      const Text(
                        "2",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Inter',
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Image.asset("assets/icons/+.png",
                          width: size.width * 0.05),
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
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 18,
              left: padding,
              right: padding,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, CartPage.id);
                  },
                  child: Container(
                    width: size.width * 0.15, // 63/420 ≈ 0.15
                    height: size.width * 0.15,
                    decoration: BoxDecoration(
                      color: const Color(0xffD09423),
                      borderRadius: BorderRadius.circular(43),
                    ),
                    child: Image.asset('assets/icons/cart2.png',
                        width: size.width * 0.08),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      OfferPage.id,
                      arguments: {
                        'productId': productId,
                        'imagePath': imagePath,
                      },
                    );
                  },
                  child: Container(
                    width:
                        size.width * 0.65, // 284/420 ≈ 0.68, adjusted to 0.65
                    height: size.width * 0.148, // 62/420 ≈ 0.148
                    decoration: BoxDecoration(
                      color: const Color(0xff2D5356),
                      borderRadius: BorderRadius.circular(62),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(top: 18),
                      child: Text(
                        "place your bid",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Inter',
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                        overflow: TextOverflow.ellipsis,
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
