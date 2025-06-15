import 'package:flutter_bloc/flutter_bloc.dart';

import 'review_storage.dart';

part 'review_state.dart';

class ReviewCubit extends Cubit<ReviewState> {
  final ReviewStorage _storage = ReviewStorage();

  ReviewCubit() : super(ReviewInitial());

  Future<void> addReview({
    required int productId,
    required String name,
    required String reviewText,
    required int rating,
  }) async {
    emit(ReviewLoading());
    try {
      if (rating < 1 || rating > 5) {
        emit(ReviewError('Rating must be between 1 and 5'));
        return;
      }
      await ReviewStorage.saveReview(
        productId: productId,
        name: name,
        reviewText: reviewText,
        rating: rating,
      );
      emit(ReviewSuccess('Review saved successfully'));
    } catch (e) {
      emit(ReviewError('Error saving review: $e'));
    }
  }
}
