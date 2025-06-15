import 'package:epicBid/cubits/basket_cubit/basket_cubit.dart';
import 'package:epicBid/models/product_details_model.dart';
import 'package:epicBid/pages/check_out_page.dart';
import 'package:epicBid/pages/review_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../l10n/app_localizations.dart';

class DetailsCard extends StatefulWidget {
  DetailsCard({
    super.key,
    required this.product,
    required this.imagePath,
  });
  final ProductDetailsModel product;
  String imagePath;

  @override
  State<DetailsCard> createState() => _DetailsCardState();
}

class _DetailsCardState extends State<DetailsCard> {
  late int quantity = 0;

  @override
  Widget build(BuildContext context) {
    var lang = AppLocalizations.of(context);
    final size = MediaQuery.of(context).size;
    final double padding = size.width * 0.043; // 18/420 ≈ 0.043

    String generateBasketId() {
      return 'basket_${DateTime.now().millisecondsSinceEpoch}';
    }

    final basketId = generateBasketId();
    return BlocProvider(
      create: (context) => BasketCubit(),
      child: BlocConsumer<BasketCubit, BasketStates>(
        listener: (context, state) {
          if (state is BasketSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          } else if (state is BasketError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage)),
            );
          }
        },
        builder: (context, state) {
          return Container(
            width: size.width * 0.95, // 400/420 ≈ 0.95
            height: size.width * 1.107, // 465/420 ≈ 1.107
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(32),
                topLeft: Radius.circular(32),
              ),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    left: 86,
                    right: 86,
                  ),
                  child: Divider(
                    height: 1,
                    thickness: 0.1,
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        widget.product.name!,
                        style: const TextStyle(
                          color: Colors.black,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        '${widget.product.price?.toStringAsFixed(2) ?? '0.00'} LE',
                        style: const TextStyle(
                          color: Colors.black,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          fontSize: 22,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    left: 19,
                    right: 19,
                  ),
                  child: Divider(
                    height: 1,
                    thickness: 0.1,
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 18),
                  child: Text(
                    lang?.description ?? '',
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, left: 18),
                  child: Text(
                    widget.product.description!,
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    left: 19,
                    right: 19,
                  ),
                  child: Divider(
                    height: 1.2,
                    thickness: 0.2,
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 18),
                  child: Text(
                    lang?.color ?? '',
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 5,
                    left: size.width * 0.19, // 80/420 ≈ 0.19
                    right: size.width * 0.19,
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircleAvatar(
                          backgroundColor: const Color(0xff947866),
                          radius: size.width * 0.06, // 25/420 ≈ 0.06
                        ),
                        SizedBox(width: size.width * 0.02),
                        CircleAvatar(
                          backgroundColor: Colors.black,
                          radius: size.width * 0.06,
                        ),
                        SizedBox(width: size.width * 0.02),
                        CircleAvatar(
                          backgroundColor: const Color(0xffD09423),
                          radius: size.width * 0.06,
                        ),
                        SizedBox(width: size.width * 0.02),
                        CircleAvatar(
                          backgroundColor: const Color(0xff263238),
                          radius: size.width * 0.06,
                        ),
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    top: 15,
                    left: 19,
                    right: 19,
                  ),
                  child: Divider(
                    height: 1,
                    thickness: 0.2,
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 19),
                  child: Row(
                    children: [
                      Text(
                        lang?.reviewRate ?? '',
                        style: const TextStyle(
                          color: Colors.black,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(width: 8),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            ReviewPage.id,
                            arguments: {
                              "imagePath": widget.imagePath,
                              "productName":
                                  widget.product.name ?? 'Unknown Product',
                              "price": widget.product.price ?? 0.0,
                              "productId": widget.product.id,
                            },
                          );
                        },
                        child: Text(
                          lang?.addReview ?? '',
                          style: const TextStyle(
                            color: Color(0xff2D5356),
                            decoration: TextDecoration.underline,
                            decorationColor: Color(0xff2D5356),
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const Spacer(),
                      const ImageIcon(
                        AssetImage("assets/icons/star.png"),
                        color: Color(0xffD09423),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Text(
                          '${widget.product.totalRatings ?? 0}',
                          style: const TextStyle(
                            color: Color(0xff4C4C4C),
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 8,
                    left: padding,
                    right: padding,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: size.width * 0.33, // 140/420 ≈ 0.33
                        height: size.width * 0.107, // 45/420 ≈ 0.107
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadiusDirectional.circular(22),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  if (quantity > 0) quantity--;
                                });
                              },
                              child: Image.asset(
                                "assets/icons/-.png",
                                width: size.width * 0.05,
                              ),
                            ),
                            Text(
                              quantity.toString(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontFamily: 'Inter',
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  quantity++;
                                });
                              },
                              child: Image.asset(
                                "assets/icons/+.png",
                                width: size.width * 0.05,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            lang?.total ?? '',
                            style: const TextStyle(
                              color: Colors.black,
                              fontFamily: 'Inter',
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            (double.parse(widget.product.price!
                                        .toString()
                                        .replaceAll('\$', '')) *
                                    quantity)
                                .toStringAsFixed(2),
                            style: const TextStyle(
                              color: Colors.black,
                              fontFamily: 'Inter',
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    left: padding,
                    right: padding,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          if (quantity > 0) {
                            context.read<BasketCubit>().addToCart(
                                  productId: widget.product.id!,
                                  productName: widget.product.name!,
                                  price: widget.product.price!,
                                  imagePath: widget.imagePath,
                                  quantity: quantity,
                                );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      'Please select a quantity greater than 0')),
                            );
                          }
                        },
                        child: Container(
                          width: size.width * 0.15, // 63/420 ≈ 0.15
                          height: size.width * 0.15,
                          decoration: BoxDecoration(
                            color: const Color(0xffD09423),
                            borderRadius: BorderRadius.circular(43),
                          ),
                          child: Image.asset(
                            'assets/icons/cart2.png',
                            width: size.width * 0.08,
                          ),
                        ),
                      ),
                      Container(
                        width: size.width *
                            0.65, // 284/420 ≈ 0.68, adjusted to 0.65
                        height: size.width * 0.148, // 62/420 ≈ 0.148
                        decoration: BoxDecoration(
                          color: const Color(0xff2D5356),
                          borderRadius: BorderRadius.circular(62),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 18),
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, CheckOutPage.id);
                              },
                              child: Text(
                                lang?.buyNow ?? '',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Inter',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
