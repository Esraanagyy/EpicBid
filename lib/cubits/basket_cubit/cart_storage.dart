import 'package:flutter/material.dart';

class CartStorage {
  static final List<Map<String, dynamic>> _cartItems = [];
  static final ValueNotifier<List<Map<String, dynamic>>> cartItemsNotifier =
      ValueNotifier(_cartItems);

  static List<Map<String, dynamic>> getCartItems() => _cartItems;

  static void addToCart({
    required int productId,
    required String productName,
    required double price,
    required String imagePath,
    required int quantity,
  }) {
    _cartItems.removeWhere((item) => item['productId'] == productId);
    _cartItems.add({
      'productId': productId,
      'productName': productName,
      'price': price,
      'imagePath': imagePath,
      'quantity': quantity,
    });
    cartItemsNotifier.value = List.from(_cartItems); // Update notifier
  }

  static void updateQuantity(int productId, int quantity) {
    final item = _cartItems.firstWhere(
      (item) => item['productId'] == productId,
      orElse: () => {},
    );
    if (item.isNotEmpty) {
      item['quantity'] = quantity;
      cartItemsNotifier.value = List.from(_cartItems); // Update notifier
    }
  }

  static void removeFromCart(int productId) {
    _cartItems.removeWhere((item) => item['productId'] == productId);
    cartItemsNotifier.value = List.from(_cartItems); // Update notifier
  }
}
