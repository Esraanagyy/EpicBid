import 'package:flutter/material.dart';

import '../cubits/review_cubit/review_storage.dart';

class AllReviewsPage extends StatelessWidget {
  static const String id = 'all_reviews';

  const AllReviewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final reviews = ReviewStorage.getReviews(); // Direct access to static list

    return Scaffold(
      backgroundColor: const Color(0xffDDCDC2), // Match ReviewPage background
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context); // Navigate back
          },
          child: const ImageIcon(
            AssetImage("assets/icons/arrow.png"),
          ),
        ),
        title: const Padding(
          padding: EdgeInsets.only(top: 8),
          child: Text(
            "All Reviews",
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
      body: reviews.isEmpty
          ? const Center(
              child: Text(
                'No reviews found',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.all(18),
              itemCount: reviews.length,
              separatorBuilder: (context, index) => const Divider(
                height: 1,
                thickness: 0.1,
                color: Colors.black,
              ),
              itemBuilder: (context, index) {
                final review = reviews[index];
                return Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Product ID: ${review['productId']}',
                            style: const TextStyle(
                              color: Colors.black,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          Row(
                            children: List.generate(
                              review['rating'],
                              (i) => const Icon(
                                Icons.star,
                                color: Color(0xffD09423),
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'By: ${review['name']}',
                        style: const TextStyle(
                          color: Color(0xff4C4C4C),
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        review['reviewText'],
                        style: const TextStyle(
                          color: Colors.black,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Posted: ${DateTime.parse(review['timestamp']).toLocal().toString().split('.')[0]}',
                        style: const TextStyle(
                          color: Color(0xff4C4C4C),
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
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
