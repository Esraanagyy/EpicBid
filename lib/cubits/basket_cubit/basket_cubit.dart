import 'package:flutter_bloc/flutter_bloc.dart';

import 'cart_storage.dart';

part 'basket_states.dart';

class BasketCubit extends Cubit<BasketStates> {
  BasketCubit()
      : super(BasketInitial()); // Ensure initial state is BasketInitial

  void addToCart({
    required int productId,
    required String productName,
    required double price,
    required String imagePath,
    required int quantity,
  }) {
    emit(BasketLoading());
    try {
      CartStorage.addToCart(
        productId: productId,
        productName: productName,
        price: price,
        imagePath: imagePath,
        quantity: quantity,
      );
      emit(BasketSuccess('Product added to cart successfully!'));
    } catch (e) {
      emit(BasketError('Error adding to cart: $e'));
    }
  }
}
