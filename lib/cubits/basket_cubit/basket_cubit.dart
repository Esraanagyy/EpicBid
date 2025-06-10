import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:epicBid/cubits/basket_cubit/basket_states.dart';
import 'package:epicBid/models/shipping_address_model.dart';
import 'package:http/http.dart' as http;

import '../../models/basket_items_model.dart';

class BasketCubit extends Cubit<BasketStates> {
  BasketCubit() : super(BasketInitialStates());

  //create basket
  void createBasket({
    required String basketId,
    required List<BasketItemModel> items,
  }) async {
    try {
      http.Response response = await http.post(
        Uri.parse('http://ebic-bid11.runasp.net/api/basket'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'id': basketId,
          'items': items,
        }),
      );

      if (response.statusCode == 200) {
        emit(CreateBasketSuccessState());
      } else {
        emit(CreateBasketFailedState());
      }
    } catch (e) {
      print('Error creating basket: $e');
      emit(CreateBasketFailedState());
    }
  }

  //create order
  void createOrder(
      {required String basketId,
      required int DeliverMethodId,
      required List<ShippingAddressModel> address}) async {
    try {
      http.Response response = await http.post(
        Uri.parse('http://ebic-bid11.runasp.net/api/Orders/CreateOrder'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'basketId': basketId,
          'DeliverMethodId': DeliverMethodId,
          'shippingAddress': address,
        }),
      );
      if (response.statusCode == 200) {
        emit(CreateOrderSuccessStates());
      } else {
        emit(CreateOrderFailedStates());
      }
    } catch (e) {
      print('Error creating basket: $e');
      emit(CreateOrderFailedStates());
    }
  }
}
