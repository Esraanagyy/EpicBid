import 'package:epicBid/pages/additional_information_page.dart';
import 'package:epicBid/pages/store_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/product_cubit/product_cubit.dart';
import '../cubits/product_cubit/product_states.dart';
import '../widgets/details_card.dart';

class ProductDetails extends StatefulWidget {
  ProductDetails({super.key});
  static String id = 'details';

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  //final ProductModel product;
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
              title: const Padding(
                padding: EdgeInsets.only(top: 8),
                child: Text(
                  "Product Details",
                  style: TextStyle(
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
            body: Builder(
              builder: (context) {
                final state = context.watch<ProductCubit>().state;

                if (state is GetProductDetailsSuccessState) {
                  final product = state.product;

                  return Column(
                    children: [
                      Image.asset(
                        imagePath,
                        width: 450,
                        height: 423,
                        fit: BoxFit.cover,
                      ),
                      DetailsCard(
                        product: product,
                        imagePath: imagePath,
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
          );
        },
      ),
    );
  }
}
/*
    DetailsCard(
                        name: product.name ?? '',
                        description: product.description ?? '',
                        price: '${product.price ?? 0}',
                        rate: '${product.totalRatings ?? 0}',
                      ),
 */
