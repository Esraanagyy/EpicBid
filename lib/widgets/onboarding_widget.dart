import 'package:epicBid/pages/login_page.dart';
import 'package:flutter/material.dart';

class OnboardingWidget extends StatelessWidget {
  OnboardingWidget(
      {super.key,
      required this.photo,
      required this.title,
      required this.desc});
  String photo;
  String title;
  String desc;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          photo,
          width: 450,
          height: 1000,
          fit: BoxFit.cover,
        ),
        Positioned.fill(
          child: Opacity(
            opacity: 0.4,
            child: Container(
              color: const Color(0xFF000000),
            ),
          ),
        ),
        Positioned(
          top: 55,
          left: 370,
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, LoginPage.id);
            },
            child: const Text(
              'skip',
              style: TextStyle(
                color: Color(0xffCCCCCC),
                fontSize: 20,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Positioned(
          top: 760,
          left: 20,
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Positioned(
          top: 810,
          left: 20,
          child: Text(
            desc,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
