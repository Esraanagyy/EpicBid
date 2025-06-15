class ReviewStorage {
  static final List<Map<String, dynamic>> _reviews = [];

  static Future<void> saveReview({
    required int productId,
    required String name,
    required String reviewText,
    required int rating,
  }) async {
    _reviews.add({
      'productId': productId,
      'name': name,
      'reviewText': reviewText,
      'rating': rating,
      'timestamp': DateTime.now().toIso8601String(),
    });
  }

  static List<Map<String, dynamic>> getReviews() => _reviews;

  static List<Map<String, dynamic>> getReviewsForProduct(int productId) =>
      _reviews.where((review) => review['productId'] == productId).toList();
}
