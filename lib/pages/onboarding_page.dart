import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../l10n/app_localizations.dart';
import '../widgets/onboarding_widget.dart';
import 'login_page.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});
  static String id = 'onboarding';

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final controller = PageController(keepPage: true);
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        currentPage = controller.page?.round() ?? 0;
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void onNextPressed() {
    if (currentPage < 2) {
      controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushNamed(context, LoginPage.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              controller: controller,
              children: [
                OnboardingWidget(
                  photo: 'assets/images/onboarding_1.jpg',
                  title: lang?.furnitureECommerce ?? 'ops!',
                  desc: lang?.hereYouCanFindDifferentTypes ?? 'ops!',
                ),
                OnboardingWidget(
                  photo: 'assets/images/onboarding_2.jpg',
                  title: lang?.onlineAuctions ?? 'ops!',
                  desc: lang?.enjoyElectronicAuction ?? 'ops!',
                ),
                OnboardingWidget(
                  photo: 'assets/images/onboarding_3.jpg',
                  title: lang?.fastDelivery ?? '',
                  desc: lang?.discreetAndSecureDelivery ?? '',
                ),
              ],
            ),

            // Bottom controls container
            Positioned(
              bottom: screenHeight * 0.05, // Responsive bottom position
              left: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SmoothPageIndicator(
                      effect: const ExpandingDotsEffect(
                        activeDotColor: Color(0xff2D5356),
                        dotHeight: 8,
                      ),
                      controller: controller,
                      count: 3,
                    ),
                    GestureDetector(
                      onTap: onNextPressed,
                      child: Text(
                        currentPage < 2 ? 'Next' : 'Start',
                        style: const TextStyle(
                          color: Color(0xff1D6066),
                          fontSize: 20,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
import 'package:epicBid/pages/login_page.dart';
import 'package:epicBid/widgets/onboarding_widget.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});
  static String id = 'onboarding';

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final controller = PageController(keepPage: true);
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        currentPage = controller.page?.round() ?? 0;
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void onNextPressed() {
    if (currentPage < 2) {
      controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushNamed(
          context, LoginPage.id); // Replace with your login page route
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller,
            children: [
              OnboardingWidget(
                photo: 'assets/images/onboarding_1.jpg',
                title: 'Furniture E-Commerce',
                desc:
                    'Here You Can Find Different Types Of \n Furniture And Styles',
              ),
              OnboardingWidget(
                photo: 'assets/images/onboarding_2.jpg',
                title: 'Online Auctions',
                desc: 'Enjoy the electronic auction feature',
              ),
              OnboardingWidget(
                photo: 'assets/images/onboarding_3.jpg',
                title: 'Fast Delivery',
                desc:
                    'Discreet and secure delivery to your door\n with dedicated furniture delivery\n methods.',
              ),
            ],
          ),
          Positioned(
            top: 920,
            left: 30,
            child: SmoothPageIndicator(
              effect: const ExpandingDotsEffect(
                  activeDotColor: Color(0xff2D5356), dotHeight: 8),
              controller: controller,
              count: 3,
            ),
          ),
          Positioned(
            top: 910,
            left: 350,
            child: GestureDetector(
              onTap: onNextPressed,
              child: Text(
                currentPage < 2 ? 'Next' : 'Start',
                style: const TextStyle(
                  color: Color(0xff1D6066),
                  fontSize: 20,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
 */
