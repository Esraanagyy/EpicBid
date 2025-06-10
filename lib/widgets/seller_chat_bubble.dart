import 'package:flutter/material.dart';

class SellerChatBubble extends StatelessWidget {
  SellerChatBubble({super.key, required this.text, required this.color});
  String text;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, bottom: 10),
      child: Align(
        alignment: Alignment.topLeft,
        child: Container(
          width: 120,
          height: 50,
          decoration: BoxDecoration(
            //color: const Color(0xff2D5356),
            color: color,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'Intel',
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
