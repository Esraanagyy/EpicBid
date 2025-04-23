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

import 'language_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  static String id = 'profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: InkWell(
          onTap: (){
            Navigator.pushNamed(context, HomePage.id);
          },
          child: Image.asset('assets/icons/arrow.png'),
        ),
        title: const Text(
              'My Profile',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Inter',
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 18,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset('assets/images/profile.png'),
              Column(
                children: [
                  const Text(
                    'Sara Nagy',
                    style: TextStyle(
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
                  const SizedBox(height: 10,),
                  InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, EditProfilePage.id);
                    },
                    child: Container(
                      width: 124,
                      height: 42,
                      decoration: BoxDecoration(
                        color: const Color(0xff2D5356),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Text(
                         'Edit Profile',
                          style: TextStyle(
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
          const SizedBox(height: 50,),
          InkWell(
            onTap: (){
              Navigator.pushNamed(context, FavouritesPage.id);
            },
            child: ProfileCard(
              text: 'Favourites',
              photo: 'assets/icons/fav.png',
            ),
          ),
          const SizedBox(height: 10),
          InkWell(
            onTap: (){
              Navigator.pushNamed(context, AddressPage.id);
            },
            child: ProfileCard(
                text: 'Address',
                photo: 'assets/icons/address.png',
            ),
          ),
          const SizedBox(height: 10),
          const Divider(color: Color(0xffCCCCCC),),
          const SizedBox(height: 10),
          InkWell(
            onTap: (){
              Navigator.pushNamed(context, LanguagePage.id);
            },
            child: ProfileCard(
                text: 'Language',
                photo: 'assets/icons/language.png',
            ),
          ),
          const SizedBox(height: 10),
          InkWell(
            onTap: (){
              Navigator.pushNamed(context, MyProductsPage.id);
            },
            child: ProfileCard(
                text: 'Products',
                photo:'assets/icons/products.png',
            ),
          ),
          const SizedBox(height: 10),
          ProfileCard(
              text: 'Shipping',
              photo: 'assets/icons/shipping.png',
          ),
          const SizedBox(height: 10),
          InkWell(
            onTap: (){
              Navigator.pushNamed(context, MyAuctionsPage.id);
            },
            child: ProfileCard(
                text: 'Auctions',
                photo: 'assets/icons/auctions.png',
            ),
          ),
          const SizedBox(height: 10),
          const Divider(color: Color(0xffCCCCCC),),
          const SizedBox(height: 10),
          InkWell(
            onTap: (){
              _showLogoutDialog(context);
            },
            child: ProfileCard(
                text: 'log Out',
                photo:'assets/icons/log_out.png'
            ),
          )
        ],
      ),
      bottomNavigationBar: const BottomNavigationBarWidget(
        selectedIndex: 3,
      ),
    );
  }

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
        child: LogOutWidget(),
      );
    },
  );
}