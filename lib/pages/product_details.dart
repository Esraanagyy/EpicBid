import 'package:epicBid/pages/additional_information_page.dart';
import 'package:epicBid/pages/store_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/product_cubit/product_cubit.dart';
import '../cubits/product_cubit/product_states.dart';
import '../l10n/app_localizations.dart';
import '../widgets/details_card.dart';

class ProductDetails extends StatefulWidget {
  ProductDetails({super.key});
  static String id = 'details';

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
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
    final double imageHeight = size.width * 0.45;
    final double desiredCardHeight = size.width * 1.107; // 465/420 ≈ 1.107
    final double maxCardHeight = (size.height -
            appBarHeight -
            statusBarHeight -
            imageHeight -
            padding * 2)
        .clamp(
            0, desiredCardHeight); // Cap at desired height or available space

    return BlocProvider(
      create: (context) => ProductCubit()..getProductDetails(productId),
      child: BlocConsumer<ProductCubit, ProductStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: const Color(0xffDDCDC2),
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              leading: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, StorePage.id);
                },
                child: const ImageIcon(
                  AssetImage("assets/icons/arrow.png"),
                ),
              ),
              title: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  lang?.productDetails ?? '',
                  style: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                  ),
                ),
              ),
              centerTitle: true,
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                          context, AdditionalInformationPage.id);
                    },
                    child: const ImageIcon(
                      AssetImage("assets/icons/dots.png"),
                      size: 42,
                    ),
                  ),
                ),
              ],
            ),
            body: SafeArea(
              child: Builder(
                builder: (context) {
                  final state = context.watch<ProductCubit>().state;

                  if (state is GetProductDetailsSuccessState) {
                    final product = state.product;
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: padding * 2),
                          child: Image.asset(
                            imagePath,
                            width: size.width * 3,
                            height: imageHeight,
                            fit: BoxFit.contain,
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: padding * 0.7),
                          child: ConstrainedBox(
                            constraints:
                                BoxConstraints(maxHeight: maxCardHeight),
                            child: DetailsCard(
                              product: product,
                              imagePath: imagePath,
                            ),
                          ),
                        ),
                      ],
                    );
                  } else if (state is GetProductDetailsFailState) {
                    return const Center(child: Text("Failed to load product."));
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
