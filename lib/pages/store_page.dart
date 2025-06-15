import 'package:epicBid/cubits/product_cubit/product_cubit.dart';
import 'package:epicBid/pages/cart_page.dart';
import 'package:epicBid/pages/product_details.dart';
import 'package:epicBid/widgets/bottom_navigation_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/product_cubit/product_states.dart';
import '../l10n/app_localizations.dart';
import '../widgets/store_card.dart';

class StorePage extends StatelessWidget {
  StorePage({super.key});
  static String id = 'store';

  final Map<String, String> imageMap = {
    'CloudSoft Pillow': 'assets/images/pillow2.webp',
    'ErgoComfort Chair': 'assets/images/yellow chair.png',
    'Luna Circular Table': 'assets/images/top table.png',
    'Oakwood Dining Table': 'assets/images/second table.png',
    'Starlight Desk Lamp': 'assets/images/top lamp.png',
  };

  late ProductCubit productCubit;

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
                        lang?.epicStore ?? '',
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
                Padding(
                    padding: const EdgeInsets.only(
                      top: 20,
                      left: 18,
                      right: 18,
                    ),
                    child: TextFormField(
                      onChanged: (input) {
                        cubit.filterProducts(input: input);
                      },
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      cursorColor: const Color(0xff468286),
                      decoration: InputDecoration(
                        fillColor: const Color(0xff468286),
                        focusColor: const Color(0xff468286),
                        filled: true,
                        prefixIcon: const ImageIcon(
                          AssetImage("assets/icons/search.png"),
                          color: Colors.white,
                        ),
                        hintText: lang?.searchInStore,
                        hintStyle: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w300,
                          fontSize: 18,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              18), // Same radius as focusedBorder
                        ),
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    left: 5,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        lang?.all ?? '',
                        style: const TextStyle(
                          color: Colors.black,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        lang?.chairs ?? '',
                        style: const TextStyle(
                          color: Color(0xff4C4C4C),
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        lang?.tables ?? '',
                        style: const TextStyle(
                          color: Color(0xff4C4C4C),
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        lang?.lamps ?? '',
                        style: const TextStyle(
                          color: Color(0xff4C4C4C),
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        lang?.pillows ?? '',
                        style: const TextStyle(
                          color: Color(0xff4C4C4C),
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 800,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: cubit.filteredProducts.isEmpty
                          ? cubit.products.length
                          : cubit.filteredProducts.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 15,
                        childAspectRatio: 0.7,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        final productList = cubit.filteredProducts.isEmpty
                            ? cubit.products
                            : cubit.filteredProducts;

                        final product = productList[index];
                        final imagePath = imageMap[product.name ?? ''] ??
                            'assets/images/default.png';
                        return InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              ProductDetails.id,
                              arguments: {
                                'id': product.id,
                                'image': imagePath,
                              },
                            );
                          },
                          child: StoreCard(
                            color: Colors.grey.shade200,
                            productName: product.name ?? '',
                            image: imagePath,
                            price: '${product.price ?? 0} LE',
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ]),
            ),
            bottomNavigationBar: const BottomNavigationBarWidget(
              selectedIndex: 1,
            ),
          );
        },
      ),
    );
  }
}
