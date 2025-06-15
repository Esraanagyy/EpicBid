import 'package:epicBid/pages/auction_page.dart';
import 'package:epicBid/widgets/auction_details_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/product_cubit/product_cubit.dart';
import '../cubits/product_cubit/product_states.dart';
import '../l10n/app_localizations.dart';

class AuctionDetailsPage extends StatelessWidget {
  const AuctionDetailsPage({super.key});
  static String id = 'auction details';

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final int productId = args['id'];
    final String imagePath = args['image'];
    var lang = AppLocalizations.of(context);

    final size = MediaQuery.of(context).size;
    final double padding = size.width * 0.05;
    final double appBarHeight = AppBar().preferredSize.height;
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double timerHeight =
        size.width * 0.1 + padding * 0.5; // Timer height + reduced top padding
    final double imageHeight = size.width * 0.45; // Reduced from 0.5
    final double maxCardHeight = size.height -
        appBarHeight -
        statusBarHeight -
        timerHeight -
        imageHeight -
        padding * 2;

    return BlocProvider(
      create: (context) => ProductCubit()..getProductDetails(productId),
      child: BlocConsumer<ProductCubit, ProductStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: const Color(0xffF9E899),
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, AuctionPage.id);
                },
                child: const ImageIcon(
                  AssetImage("assets/icons/arrow.png"),
                ),
              ),
              title: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  lang?.auctionDetails ?? '',
                  style: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                ),
              ),
              centerTitle: true,
            ),
            body: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        right: padding,
                        top: padding * 0.5), // Reduced top padding
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: size.width * 0.15,
                          height: size.width * 0.1,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "4 days",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        SizedBox(width: padding),
                        Container(
                          width: size.width * 0.18,
                          height: size.width * 0.1,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "22 Hours",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    imagePath,
                    width: size.width * 0.95,
                    height: imageHeight, // Reduced to 0.45
                    fit: BoxFit.contain,
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal:
                              padding * 0.8), // Reduced horizontal padding
                      child: ConstrainedBox(
                        constraints: BoxConstraints(maxHeight: maxCardHeight),
                        child: AuctionDetailsCard(
                          name: state is GetProductDetailsSuccessState
                              ? state.product.name ?? ''
                              : '',
                          price: state is GetProductDetailsSuccessState
                              ? '${state.product.price ?? 0}'
                              : '',
                          description: state is GetProductDetailsSuccessState
                              ? state.product.description ?? ''
                              : '',
                          rate: state is GetProductDetailsSuccessState
                              ? '${state.product.totalRatings ?? 0}'
                              : '',
                          imagePath: imagePath,
                          productId: productId,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
