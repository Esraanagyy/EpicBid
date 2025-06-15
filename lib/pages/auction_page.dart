import 'package:epicBid/cubits/product_cubit/product_cubit.dart';
import 'package:epicBid/cubits/product_cubit/product_states.dart';
import 'package:epicBid/pages/auction_details_page.dart';
import 'package:epicBid/pages/create_auction.dart';
import 'package:epicBid/widgets/auction_card.dart';
import 'package:epicBid/widgets/bottom_navigation_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../l10n/app_localizations.dart';
import 'cart_page.dart';

class AuctionPage extends StatelessWidget {
  AuctionPage({super.key});
  static String id = 'auction';

  final List<String> assetImages = [
    'assets/images/pillow2.webp',
    'assets/images/yellow chair.png',
    'assets/images/top table.png',
    'assets/images/second table.png',
    'assets/images/top lamp.png',
  ];

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context);
    return BlocProvider(
      create: (context) => ProductCubit()..getProducts(),
      child: BlocConsumer<ProductCubit, ProductStates>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = BlocProvider.of<ProductCubit>(context);
          return Scaffold(
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 50,
                    left: 18,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        lang?.auctions ?? '',
                        style: const TextStyle(
                          color: Colors.black,
                          fontFamily: 'Inter',
                          fontSize: 26,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, CartPage.id);
                          },
                          child: const ImageIcon(
                            AssetImage("assets/icons/cart.png"),
                            color: Color(0xff2D5356),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 900,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20, left: 20),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: cubit.products.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 15,
                        childAspectRatio: 0.7,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        final product = cubit.products[index];
                        final imagePath =
                            assetImages[index % assetImages.length];
                        return InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                AuctionDetailsPage.id,
                                arguments: {
                                  'id': product.id,
                                  'image': imagePath,
                                },
                              );
                            },
                            child: AuctionCard(
                              productName: product.name ?? '',
                              image: imagePath,
                              price: '${product.price ?? 0} LE',
                              startTime: extractDate(product.auctionStartTime),
                              endTime: extractDate(product.auctionEndTime),
                            ));
                      },
                    ),
                  ),
                ),
              ]),
            ),
            floatingActionButton: InkWell(
              onTap: () {
                Navigator.pushNamed(context, CreateAuction.id);
              },
              child: Image.asset(
                'assets/icons/create.png',
                scale: 1.3,
              ),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
            bottomNavigationBar: const BottomNavigationBarWidget(
              selectedIndex: 2,
            ),
          );
        },
      ),
    );
  }

  String extractDate(String? dateTime) {
    if (dateTime == null || dateTime.isEmpty || !dateTime.contains('T')) {
      return '';
    }

    final parts = dateTime.split('T');
    return parts.isNotEmpty ? parts.first : '';
  }
}
