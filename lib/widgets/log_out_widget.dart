import 'package:epicBid/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LogOutWidget extends StatelessWidget {
  const LogOutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 404,
      height: 318,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
         Positioned(
           top: -99,
             left: 75,
             child: Lottie.asset('assets/images/cry.json',
                 width: 200,
                 height: 200),
         ),
          const Positioned(
            top: 100,
            left: 110,
            child: Text(
              'Are You Sure?',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Inter',
                fontSize: 22,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          const Positioned(
            top: 130,
            left: 60,
            child: Text(
              'You are about to log out',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Inter',
                fontSize: 22,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          Positioned(
            top: 200,
            left: 115,
            child: InkWell(
              onTap: (){
                Navigator.pushNamed(context, LoginPage.id);
              },
              child: Container(
                  width: 138,
                  height: 47,
                  decoration: BoxDecoration(
                    color: const Color(0xffB3261E),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Center(
                    child: Text(
                      'Log Out',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Inter',
                        fontSize: 22,
                        fontWeight: FontWeight.w300,
                      ),
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
