import 'package:flutter/material.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 432,
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
              height: 1.5,
              thickness: 0.2,
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
            padding: EdgeInsets.only(left: 20, top: 10),
            child: Text(
              "Add Customer Review",
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
              left: 18,
              right: 18,
            ),
            child: TextFormField(
              style: const TextStyle(
                color: Color(0xff4C4C4C),
              ),
              cursorColor: const Color(0xff4C4C4C),
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.always,
                floatingLabelAlignment: FloatingLabelAlignment.start,
                labelText: "Your Name",
                labelStyle: const TextStyle(
                  color: Color(0xff4C4C4C),
                  fontFamily: 'Inter',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: Color(0xff4C4C4C),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: Color(0xff4C4C4C),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
              left: 18,
              right: 18,
            ),
            child: TextFormField(
              style: const TextStyle(
                color: Color(0xff4C4C4C),
              ),
              maxLines: 4,
              cursorColor: const Color(0xff4C4C4C),
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.always,
                floatingLabelAlignment: FloatingLabelAlignment.start,
                labelText: "Review",
                labelStyle: const TextStyle(
                  color: Color(0xff4C4C4C),
                  fontFamily: 'Inter',
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: Color(0xff4C4C4C),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: Color(0xff4C4C4C),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18, left: 60),
            child: Container(
              width: 284,
              height: 62,
              decoration: BoxDecoration(
                  color: const Color(0xffD09423),
                  borderRadius: BorderRadius.circular(62)),
              child: const Padding(
                padding: EdgeInsets.only(top: 18),
                child: Text(
                  "Add Review",
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
          ),
        ],
      ),
    );
  }
}
