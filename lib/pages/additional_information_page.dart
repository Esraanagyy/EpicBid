import 'package:epicBid/pages/product_details.dart';
import 'package:flutter/material.dart';

class AdditionalInformationPage extends StatelessWidget {
  const AdditionalInformationPage({super.key});

  static String id = 'information';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
            "Additional Information",
            style: TextStyle(
              color: Colors.black,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              fontSize: 18,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 35, left: 18),
            child: Text(
              "Technical Details",
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Inter',
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 18,
              left: 18,
            ),
            child: Container(
              width: 412,
              height: 62,
              decoration: const BoxDecoration(
                color: Color(0xff2D5356),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16),
                  topLeft: Radius.circular(16),
                  bottomRight: Radius.circular(4),
                  bottomLeft: Radius.circular(4),
                ),
              ),
              child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Features",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Inter',
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "Details",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Inter',
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
              left: 18,
            ),
            child: Container(
              width: 412,
              height: 62,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: const Color(0xffCCCCCC),
                  )),
              child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Brand",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Inter',
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "KOLLIEE",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Inter',
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
              left: 18,
            ),
            child: Container(
              width: 412,
              height: 62,
              decoration: BoxDecoration(
                color: const Color(0xffCCCCCC),
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Color",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Inter',
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "Brown",
                      style: TextStyle(
                        color: Colors.brown,
                        fontFamily: 'Inter',
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
              left: 18,
            ),
            child: Container(
              width: 412,
              height: 62,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: const Color(0xffCCCCCC),
                  )),
              child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Product Dimensions",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Inter',
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "24”Dx24.4”Wx35.8”H",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Inter',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
              left: 18,
            ),
            child: Container(
              width: 412,
              height: 62,
              decoration: BoxDecoration(
                color: const Color(0xffCCCCCC),
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Size",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Inter',
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "Large",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Inter',
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
              left: 18,
            ),
            child: Container(
              width: 412,
              height: 62,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: const Color(0xffCCCCCC),
                  )),
              child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Back Style",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Inter',
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "Soild Back",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Inter',
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
              left: 18,
            ),
            child: Container(
              width: 412,
              height: 62,
              decoration: BoxDecoration(
                color: const Color(0xffCCCCCC),
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Style",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Inter',
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "Modern",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Inter',
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
              left: 18,
            ),
            child: Container(
              width: 412,
              height: 62,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: const Color(0xffCCCCCC),
                ),
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                  topRight: Radius.circular(4),
                  topLeft: Radius.circular(4),
                ),
              ),
              child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Unit Count",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Inter',
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "1.0 Count",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Inter',
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
