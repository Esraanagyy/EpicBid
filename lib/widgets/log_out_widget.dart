import 'package:epicBid/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LogOutWidget extends StatelessWidget {
  const LogOutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.70, // 404/420 ≈ 0.95
      height: size.width * 0.700, // 318/420 ≈ 0.757
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadius.circular(size.width * 0.029), // 12/420 ≈ 0.029
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -size.width * 0.236, // -99/420 ≈ -0.236
            left: size.width * 0.120, // 75/420 ≈ 0.179
            child: Lottie.asset(
              'assets/images/cry.json',
              width: size.width * 0.476, // 200/420 ≈ 0.476
              height: size.width * 0.476,
            ),
          ),
          Positioned(
            top: size.width * 0.238, // 100/420 ≈ 0.238
            left: size.width * 0.200, // 110/420 ≈ 0.262
            child: Text(
              'Are You Sure?',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Inter',
                fontSize: size.width * 0.052, // 22/420 ≈ 0.052
                fontWeight: FontWeight.w300,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Positioned(
            top: size.width * 0.310, // 130/420 ≈ 0.310
            left: size.width * 0.100, // 60/420 ≈ 0.143
            child: Text(
              'You are about to log out',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Inter',
                fontSize: size.width * 0.052, // 22/420 ≈ 0.052
                fontWeight: FontWeight.w300,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Positioned(
            top: size.width * 0.476, // 200/420 ≈ 0.476
            left: size.width * 0.200, // 115/420 ≈ 0.274
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, LoginPage.id);
              },
              child: Container(
                width: size.width * 0.329, // 138/420 ≈ 0.329
                height: size.width * 0.112, // 47/420 ≈ 0.112
                decoration: BoxDecoration(
                  color: const Color(0xffB3261E),
                  borderRadius: BorderRadius.circular(
                      size.width * 0.038), // 16/420 ≈ 0.038
                ),
                child: Center(
                  child: Text(
                    'Log Out',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Inter',
                      fontSize: size.width * 0.052, // 22/420 ≈ 0.052
                      fontWeight: FontWeight.w300,
                    ),
                    overflow: TextOverflow.ellipsis,
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
