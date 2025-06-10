import 'package:epicBid/pages/auction_page.dart';
import 'package:epicBid/widgets/auction_details_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/product_cubit/product_cubit.dart';
import '../cubits/product_cubit/product_states.dart';

class AuctionDetailsPage extends StatelessWidget {
  const AuctionDetailsPage({super.key});
  static String id = 'auction details';

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final int productId = args['id'];
    final String imagePath = args['image'];

    return BlocProvider(
        create: (context) => ProductCubit()..getProductDetails(productId),
        child: BlocConsumer<ProductCubit, ProductStates>(
            listener: (context, state) {},
            builder: (context, state) {
              return Scaffold(
                backgroundColor: const Color(0xffF9E899),
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  leading: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, AuctionPage.id);
                    },
                    child: const ImageIcon(
                      AssetImage("assets/icons/arrow.png"),
                    ),
                  ),
                  title: const Padding(
                    padding: EdgeInsets.only(top: 8),
                    child: Text(
                      "Auction Details",
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  centerTitle: true,
                ),
                body: Builder(builder: (context) {
                  final state = context.watch<ProductCubit>().state;

                  if (state is GetProductDetailsSuccessState) {
                    final product = state.product;
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 280, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 66,
                                height: 45,
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
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: 81,
                                height: 45,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    "22 Hours",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Image.asset(
                          imagePath,
                          width: 412,
                          height: 274,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 20,
                            right: 20,
                          ),
                          child: AuctionDetailsCard(
                            name: product.name ?? '',
                            price: '${product.price ?? 0}',
                            description: product.description ?? '',
                            rate: '${product.totalRatings ?? 0}',
                          ),
                        ),
                      ],
                    );
                  } else if (state is GetProductDetailsFailState) {
                    return const Center(child: Text("Failed to load product."));
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                }),
              );
            }));
  }
}
