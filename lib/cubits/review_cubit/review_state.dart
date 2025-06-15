part of 'review_cubit.dart';

abstract class ReviewState {}

class ReviewInitial extends ReviewState {}

class ReviewLoading extends ReviewState {}

class ReviewSuccess extends ReviewState {
  final String message;
  ReviewSuccess(this.message);
}

class ReviewError extends ReviewState {
  final String errorMessage;
  ReviewError(this.errorMessage);
}
