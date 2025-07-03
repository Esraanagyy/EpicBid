import 'package:epicBid/pages/address_page.dart';
import 'package:epicBid/pages/edit_profile_page.dart';
import 'package:epicBid/pages/favourites_page.dart';
import 'package:epicBid/pages/home_page.dart';
import 'package:epicBid/pages/my_auctions_page.dart';
import 'package:epicBid/pages/my_products_page.dart';
import 'package:epicBid/widgets/bottom_navigation_bar_widget.dart';
import 'package:epicBid/widgets/log_out_widget.dart';
import 'package:epicBid/widgets/profile_card.dart';
import 'package:flutter/material.dart';

import '../l10n/app_localizations.dart';
import 'language_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  static String id = 'profile';

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context);
    // Get the latest address, if any
    final address =
        AddressData.addresses.isNotEmpty ? AddressData.addresses.last : null;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Navigator.pushNamed(context, HomePage.id);
          },
          child: Image.asset('assets/icons/arrow.png'),
        ),
        title: Text(
          lang?.myProfile ?? '',
          style: const TextStyle(
            color: Colors.black,
            fontFamily: 'Inter',
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 18,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset('assets/images/profile.png'),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    lang?.saraNagy ?? '',
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'Inter',
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Text(
                    'saranagy@gmail.com',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Inter',
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  // Display address or fallback
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      address != null ? '${address.city}' : 'No address saved',
                      style: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'Inter',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, EditProfilePage.id);
                    },
                    child: Container(
                      width: 124,
                      height: 42,
                      decoration: BoxDecoration(
                        color: const Color(0xff2D5356),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          lang?.editProfile ?? '',
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'Inter',
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, FavouritesPage.id);
            },
            child: ProfileCard(
              text: lang?.favourites ?? '',
              photo: 'assets/icons/fav.png',
            ),
          ),
          const SizedBox(height: 10),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, AddressPage.id);
            },
            child: ProfileCard(
              text: lang?.address ?? '',
              photo: 'assets/icons/address.png',
            ),
          ),
          const SizedBox(height: 10),
          const Divider(
            color: Color(0xffCCCCCC),
          ),
          const SizedBox(height: 10),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, LanguagePage.id);
            },
            child: ProfileCard(
              text: lang?.language ?? '',
              photo: 'assets/icons/language.png',
            ),
          ),
          const SizedBox(height: 10),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, MyProductsPage.id);
            },
            child: ProfileCard(
              text: lang?.products ?? '',
              photo: 'assets/icons/products.png',
            ),
          ),
          const SizedBox(height: 10),
          ProfileCard(
            text: lang?.shipping ?? '',
            photo: 'assets/icons/shipping.png',
          ),
          const SizedBox(height: 10),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, MyAuctionsPage.id);
            },
            child: ProfileCard(
              text: lang?.auctions ?? '',
              photo: 'assets/icons/auctions.png',
            ),
          ),
          const SizedBox(height: 10),
          const Divider(
            color: Color(0xffCCCCCC),
          ),
          const SizedBox(height: 10),
          InkWell(
            onTap: () {
              _showLogoutDialog(context);
            },
            child: ProfileCard(
                text: lang?.logOut ?? '', photo: 'assets/icons/log_out.png'),
          )
        ],
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(
        selectedIndex: 3,
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: const LogOutWidget(),
        );
      },
    );
  }
}
