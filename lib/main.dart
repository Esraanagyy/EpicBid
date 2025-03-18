import 'package:epicBid/pages/additional_information_page.dart';
import 'package:epicBid/pages/auction_details_page.dart';
import 'package:epicBid/pages/auction_page.dart';
import 'package:epicBid/pages/forgot_password_page.dart';
import 'package:epicBid/pages/home_page.dart';
import 'package:epicBid/pages/login_page.dart';
import 'package:epicBid/pages/product_details.dart';
import 'package:epicBid/pages/profile_page.dart';
import 'package:epicBid/pages/register_page.dart';
import 'package:epicBid/pages/review_page.dart';
import 'package:epicBid/pages/splash_screen.dart';
import 'package:epicBid/pages/store_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const EpicBid());
}

class EpicBid extends StatelessWidget {
  const EpicBid({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        SplashScreen.id: (context) => const SplashScreen(),
        LoginPage.id: (context) => const LoginPage(),
        RegisterPage.id: (context) => const RegisterPage(),
        ForgotPasswordPage.id: (context) => const ForgotPasswordPage(),
        HomePage.id: (context) => HomePage(),
        StorePage.id: (context) => const StorePage(),
        AuctionPage.id: (context) => const AuctionPage(),
        ProfilePage.id: (context) => const ProfilePage(),
        ProductDetails.id: (context) => const ProductDetails(),
        AdditionalInformationPage.id: (context) =>
            const AdditionalInformationPage(),
        ReviewPage.id: (context) => const ReviewPage(),
        AuctionDetailsPage.id: (context) => const AuctionDetailsPage(),
      },
      initialRoute: SplashScreen.id,
    );
  }
}
