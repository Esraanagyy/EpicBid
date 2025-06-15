import 'package:epicBid/cubits/review_cubit/review_cubit.dart';
import 'package:epicBid/pages/all_reviews_page.dart';
import 'package:epicBid/services/snack_bar_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReviewCard extends StatefulWidget {
  const ReviewCard({
    super.key,
    required this.productName,
    this.price,
    required this.productId,
  });

  final String productName;
  final double? price;
  final int productId;

  @override
  State<ReviewCard> createState() => _ReviewCardState();
}

class _ReviewCardState extends State<ReviewCard> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _reviewController = TextEditingController();
  int _rating = 0;

  @override
  void dispose() {
    _nameController.dispose();
    _reviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReviewCubit(),
      child: BlocConsumer<ReviewCubit, ReviewState>(
        listener: (context, state) {
          if (state is ReviewSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
            Navigator.pop(context); // Navigate back on success
          } else if (state is ReviewError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage)),
            );
          }
        },
        builder: (context, state) {
          return Container(
            width: 400,
            height: 450,
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
                    height: 1.5,
                    thickness: 0.2,
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        widget.productName,
                        style: const TextStyle(
                          color: Colors.black,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        widget.price != null
                            ? "${widget.price!.toStringAsFixed(2)} LE"
                            : "N/A",
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
                const Padding(
                  padding: EdgeInsets.only(left: 20, top: 10),
                  child: Text(
                    "Add Customer Review",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                    left: 18,
                    right: 18,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: List.generate(
                        5,
                        (index) => InkWell(
                              onTap: () {
                                setState(() {
                                  _rating = index + 1;
                                });
                              },
                              child: Icon(
                                index < _rating
                                    ? Icons.star
                                    : Icons.star_border,
                                color: const Color(0xffD09423),
                                size: 30,
                              ),
                            )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10,
                    left: 18,
                    right: 18,
                  ),
                  child: TextFormField(
                    controller: _nameController,
                    style: const TextStyle(
                      color: Color(0xff4C4C4C),
                    ),
                    cursorColor: const Color(0xff4C4C4C),
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      floatingLabelAlignment: FloatingLabelAlignment.start,
                      labelText: "Your Name",
                      labelStyle: const TextStyle(
                        color: Color(0xff4C4C4C),
                        fontFamily: 'Inter',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Color(0xff4C4C4C),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Color(0xff4C4C4C),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    left: 18,
                    right: 18,
                  ),
                  child: TextFormField(
                    controller: _reviewController,
                    style: const TextStyle(
                      color: Color(0xff4C4C4C),
                    ),
                    maxLines: 4,
                    cursorColor: const Color(0xff4C4C4C),
                    decoration: InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      floatingLabelAlignment: FloatingLabelAlignment.start,
                      labelText: "Review",
                      labelStyle: const TextStyle(
                        color: Color(0xff4C4C4C),
                        fontFamily: 'Inter',
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Color(0xff4C4C4C),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Color(0xff4C4C4C),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18, left: 60),
                  child: InkWell(
                    onTap: state is ReviewLoading
                        ? null
                        : () async {
                            if (_nameController.text.isEmpty ||
                                _reviewController.text.isEmpty ||
                                _rating == 0) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        'Please fill all fields and select a rating')),
                              );
                              return;
                            }

                            context.read<ReviewCubit>().addReview(
                                  productId: widget.productId,
                                  name: _nameController.text,
                                  reviewText: _reviewController.text,
                                  rating: _rating,
                                );

                            await context
                                .read<ReviewCubit>()
                                .stream
                                .firstWhere((state) => state is! ReviewLoading);
                            if (context.read<ReviewCubit>().state
                                is ReviewSuccess) {
                              SnackBarService.showSuccessMessage(
                                  'Review added successfully!');
                              Navigator.pushNamed(context, AllReviewsPage.id);
                            }
                          },
                    child: Container(
                      width: 284,
                      height: 62,
                      decoration: BoxDecoration(
                        color: const Color(0xffD09423),
                        borderRadius: BorderRadius.circular(62),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 18),
                        child: Text(
                          state is ReviewLoading ? 'Saving...' : 'Add Review',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'Inter',
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
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
