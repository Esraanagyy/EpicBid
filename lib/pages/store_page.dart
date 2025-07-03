import 'package:epicBid/cubits/product_cubit/product_cubit.dart';
import 'package:epicBid/cubits/product_cubit/product_states.dart';
import 'package:epicBid/pages/cart_page.dart';
import 'package:epicBid/pages/product_details.dart';
import 'package:epicBid/widgets/bottom_navigation_bar_widget.dart';
import 'package:epicBid/widgets/store_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../l10n/app_localizations.dart';

class StorePage extends StatefulWidget {
  static String id = 'store';

  const StorePage({super.key});

  @override
  _StorePageState createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  final Map<String, String> imageMap = {
    'CloudSoft Pillow': 'assets/images/pillow2.webp',
    'ErgoComfort Chair': 'assets/images/yellow chair.png',
    'Luna Circular Table': 'assets/images/top table.png',
    'Oakwood Dining Table': 'assets/images/second table.png',
    'Starlight Desk Lamp': 'assets/images/top lamp.png',
    'VelvetLux Sofa': 'assets/images/store_sofa.jpg',
    'DreamCloud Pillow': 'assets/images/purble_pillow.jpg',
    'PosturePro Chair': 'assets/images/white chair.jpg',
    'MoonGlow Floor Lamp': 'assets/images/great lamp.jpg',
    'Rustic Bookshelf': 'assets/images/bookshelf.png',
  };

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 200 &&
          !BlocProvider.of<ProductCubit>(context).isLoadingMore &&
          BlocProvider.of<ProductCubit>(context).hasMore) {
        BlocProvider.of<ProductCubit>(context).getProducts(loadMore: true);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context);
    return BlocProvider(
      create: (context) => ProductCubit()..getProducts(),
      child: BlocConsumer<ProductCubit, ProductStates>(
        listener: (context, state) {
          if (state is GetProductFailState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Error loading products'),
              ),
            );
          }
        },
        builder: (context, state) {
          final cubit = BlocProvider.of<ProductCubit>(context);
          return Scaffold(
            backgroundColor: Colors.white,
            body: RefreshIndicator(
              onRefresh: () async {
                cubit.resetPagination();
              },
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 50, left: 18),
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
                      padding:
                          const EdgeInsets.only(top: 20, left: 18, right: 18),
                      child: TextFormField(
                        onChanged: (input) {
                          cubit.filterProducts(input: input);
                        },
                        style: const TextStyle(color: Colors.white),
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
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 5),
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
                    if (state is ProductLoadingState)
                      const SizedBox(
                        height: 800,
                        child: Center(child: CircularProgressIndicator()),
                      )
                    else
                      SizedBox(
                        height: 800,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: GridView.builder(
                            controller: _scrollController,
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemCount: (cubit.filteredProducts.isEmpty
                                    ? cubit.products.length
                                    : cubit.filteredProducts.length) +
                                (cubit.isLoadingMore ? 1 : 0),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 15,
                              childAspectRatio: 0.7,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              if (cubit.isLoadingMore &&
                                  index ==
                                      (cubit.filteredProducts.isEmpty
                                          ? cubit.products.length
                                          : cubit.filteredProducts.length)) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }

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
                  ],
                ),
              ),
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
