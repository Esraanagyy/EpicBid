import 'package:flutter/material.dart';

import '../pages/login_page.dart';

class OnboardingWidget extends StatelessWidget {
  OnboardingWidget({
    super.key,
    required this.photo,
    required this.title,
    required this.desc,
  });

  final String photo;
  final String title;
  final String desc;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              photo,
              fit: BoxFit.cover,
            ),
          ),

          // Dark overlay
          Positioned.fill(
            child: Opacity(
              opacity: 0.4,
              child: Container(
                color: const Color(0xFF000000),
              ),
            ),
          ),

          // Skip button (top-right)
          Positioned(
            top: screenHeight * 0.06, // Responsive position
            right: screenWidth * 0.08, // Responsive position
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, LoginPage.id);
              },
              child: Text(
                'Skip',
                style: TextStyle(
                  color: const Color(0xffCCCCCC),
                  fontSize: screenWidth * 0.045, // Responsive font
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),

          // Content Area
          Positioned(
            bottom: screenHeight * 0.15, // Responsive position
            left: screenWidth * 0.05, // Responsive position
            right: screenWidth * 0.05, // Responsive position
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth * 0.08, // Responsive font
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 16),

                // Description
                Text(
                  desc,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: screenWidth * 0.045, // Responsive font
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
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
