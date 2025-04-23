import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
   ProfileCard({super.key,required this.text,required this.photo});
  String text;
  String photo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18),
      child: Row(
        children: [
          Image.asset(photo),
          const Spacer(flex: 1,),
           Text(
            text,
            style: const TextStyle(
              color: Color(0xff4C4C4C),
              fontFamily: 'Inter',
              fontSize: 22,
              fontWeight: FontWeight.w400,
            ),
          ),
          const Spacer(flex: 15,),
          Image.asset('assets/icons/arrow_right.png'),
        ],
      ),
    );
  }
}
