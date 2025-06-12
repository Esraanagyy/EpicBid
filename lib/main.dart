import 'package:bot_toast/bot_toast.dart';
import 'package:epicBid/pages/additional_information_page.dart';
import 'package:epicBid/pages/address_page.dart';
import 'package:epicBid/pages/auction_details_page.dart';
import 'package:epicBid/pages/auction_page.dart';
import 'package:epicBid/pages/cart_page.dart';
import 'package:epicBid/pages/chat_page.dart';
import 'package:epicBid/pages/chatbot_page.dart';
import 'package:epicBid/pages/check_out_page.dart';
import 'package:epicBid/pages/create_auction.dart';
import 'package:epicBid/pages/create_done.dart';
import 'package:epicBid/pages/edit_profile_page.dart';
import 'package:epicBid/pages/favourites_page.dart';
import 'package:epicBid/pages/forgot_password_page.dart';
import 'package:epicBid/pages/home_page.dart';
import 'package:epicBid/pages/language_page.dart';
import 'package:epicBid/pages/login_page.dart';
import 'package:epicBid/pages/my_auctions_page.dart';
import 'package:epicBid/pages/my_products_page.dart';
import 'package:epicBid/pages/offer_page.dart';
import 'package:epicBid/pages/onboarding_page.dart';
import 'package:epicBid/pages/payment_done.dart';
import 'package:epicBid/pages/place_bid_page.dart';
import 'package:epicBid/pages/product_details.dart';
import 'package:epicBid/pages/profile_page.dart';
import 'package:epicBid/pages/register_page.dart';
import 'package:epicBid/pages/reset_password_page.dart';
import 'package:epicBid/pages/review_page.dart';
import 'package:epicBid/pages/splash_screen.dart';
import 'package:epicBid/pages/store_page.dart';
import 'package:epicBid/pages/verify_code_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'cubits/auction_cubit/auction_cubit.dart';
import 'cubits/product_cubit/product_cubit.dart';

void main() {
  runApp(const EpicBid());
}

class EpicBid extends StatelessWidget {
  const EpicBid({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) {
        if (settings.name == AuctionDetailsPage.id) {
          final args = settings.arguments;
          return MaterialPageRoute(
            builder: (context) => AuctionDetailsPage(),
            settings: RouteSettings(arguments: args), // ✅ pass args properly
          );
        }

        // Add other routes here if needed
        return null;
      },
      routes: {
        SplashScreen.id: (context) => const SplashScreen(),
        LoginPage.id: (context) => const LoginPage(),
        RegisterPage.id: (context) => RegisterPage(),
        ForgotPasswordPage.id: (context) => const ForgotPasswordPage(),
        HomePage.id: (context) => HomePage(),
        StorePage.id: (context) => BlocProvider(
              create: (_) => ProductCubit()..getProducts(),
              child: StorePage(),
            ),
        AuctionPage.id: (context) => BlocProvider(
              create: (_) => ProductCubit()..getProducts(),
              child: AuctionPage(),
            ),
        ProfilePage.id: (context) => const ProfilePage(),
        ProductDetails.id: (context) => ProductDetails(),
        AdditionalInformationPage.id: (context) =>
            const AdditionalInformationPage(),
        ReviewPage.id: (context) => const ReviewPage(),
        //AuctionDetailsPage.id: (context) => const AuctionDetailsPage(),
        ChatPage.id: (context) => const ChatPage(),
        CreateAuction.id: (context) => const CreateAuction(),
        CreateDone.id: (context) => const CreateDone(),
        CartPage.id: (context) => const CartPage(),
        CheckOutPage.id: (context) => const CheckOutPage(),
        PaymentDone.id: (context) => const PaymentDone(),
        EditProfilePage.id: (context) => const EditProfilePage(),
        FavouritesPage.id: (context) => const FavouritesPage(),
        AddressPage.id: (context) => AddressPage(),
        LanguagePage.id: (context) => const LanguagePage(),
        MyProductsPage.id: (context) => const MyProductsPage(),
        MyAuctionsPage.id: (context) => const MyAuctionsPage(),
        OnboardingPage.id: (context) => const OnboardingPage(),
        VerifyCodePage.id: (context) => const VerifyCodePage(),
        ResetPasswordPage.id: (context) => const ResetPasswordPage(),
        ChatBotPage.id: (context) => const ChatBotPage(),
        PlaceBidPage.id: (context) => BlocProvider(
              create: (context) => AuctionCubit(),
              child: const PlaceBidPage(),
            ),
        OfferPage.id: (context) => OfferPage(),
      },
      initialRoute: SplashScreen.id,
      builder: EasyLoading.init(
        builder: BotToastInit(),
      ),
    );
  }
}
