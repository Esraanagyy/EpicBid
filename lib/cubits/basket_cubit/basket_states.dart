part of 'basket_cubit.dart';

abstract class BasketStates {}

class BasketInitial extends BasketStates {}

class BasketLoading extends BasketStates {}

class BasketSuccess extends BasketStates {
  final String message;
  BasketSuccess(this.message);
}

class BasketError extends BasketStates {
  final String errorMessage;
  BasketError(this.errorMessage);
}
