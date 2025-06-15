import 'package:epicBid/cubits/basket_cubit/cart_storage.dart';
import 'package:flutter/material.dart';

class CartCard extends StatefulWidget {
  CartCard({
    super.key,
    required this.productName,
    required this.image,
    required this.price,
    required this.color,
  });
  String image;
  String productName;
  String price;
  Color color;

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {
  int quantity = 0;
  double? basePrice;

  @override
  void initState() {
    super.initState();
    try {
      final cartItem = CartStorage.getCartItems().firstWhere(
        (item) => item['productName'] == widget.productName,
        orElse: () => {
          'quantity': 0,
          'price': double.tryParse(widget.price.replaceAll(' LE', '')) ?? 0.0
        },
      );
      quantity = cartItem['quantity'] ?? 0;
      basePrice = (cartItem['price'] as double?) ??
          double.tryParse(widget.price.replaceAll(' LE', '')) ??
          0.0;
      print(
          'Init - ProductName: ${widget.productName}, Quantity: $quantity, BasePrice: $basePrice, CartItems: ${CartStorage.getCartItems()}');
    } catch (e) {
      print('Initialization error: $e'); // Debug log
      quantity = 0;
      basePrice = double.tryParse(widget.price.replaceAll(' LE', '')) ?? 0.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double padding = size.width * 0.043; // 18/420 ≈ 0.043
    final double totalPrice = (basePrice ?? 0.0) * quantity;

    if (basePrice == null) {
      return const Center(
          child: CircularProgressIndicator()); // Temporary fallback
    }

    return Padding(
      padding: EdgeInsets.only(
        top: size.width * 0.095, // 40/420 ≈ 0.095
        left: padding,
        right: padding,
      ),
      child: Container(
        width: size.width * 0.95, // 404/420 ≈ 0.95
        height: size.width * 0.238, // 100/420 ≈ 0.238
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius:
              BorderRadius.circular(size.width * 0.076), // 32/420 ≈ 0.076
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: -size.width * 0.119, // -50/420 ≈ -0.119
              child: Image.asset(
                widget.image,
                width: size.width * 0.381, // 160/420 ≈ 0.381
                height: size.width * 0.381,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: size.width * 0.043, // 18/420 ≈ 0.043
                left: size.width * 0.369, // 155/420 ≈ 0.369
              ),
              child: Text(
                widget.productName,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Inter',
                  fontSize: size.width * 0.052, // 22/420 ≈ 0.052
                  fontWeight: FontWeight.w300,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: size.width * 0.119, // 50/420 ≈ 0.119
                left: size.width * 0.405, // 170/420 ≈ 0.405
              ),
              child: Text(
                '$totalPrice LE',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Inter',
                  fontSize: size.width * 0.052, // 22/420 ≈ 0.052
                  fontWeight: FontWeight.w600,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: size.width * 0.710, // (0.95 - 0.188 - 0.043)
                top: size.width * 0.081,
                right: size.width * 0.02,
              ),
              child: Container(
                width: size.width * 0.188, // 79/420 ≈ 0.188
                height: size.width * 0.079, // 33/420 ≈ 0.079
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(
                      size.width * 0.057), // 24/420 ≈ 0.057
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          quantity++;
                          final productId =
                              CartStorage.getCartItems().firstWhere(
                            (item) => item['productName'] == widget.productName,
                            orElse: () => {'productId': -1},
                          )['productId'];
                          if (productId != -1) {
                            CartStorage.updateQuantity(productId, quantity);
                          }
                        });
                      },
                      child: Text(
                        '+',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Inter',
                          fontSize: size.width * 0.048, // 20/420 ≈ 0.048
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Text(
                      quantity.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Inter',
                        fontSize: size.width * 0.038, // 16/420 ≈ 0.038
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          if (quantity > 0) {
                            quantity--;
                            final productId =
                                CartStorage.getCartItems().firstWhere(
                              (item) =>
                                  item['productName'] == widget.productName,
                              orElse: () => {'productId': -1},
                            )['productId'];
                            if (productId != -1) {
                              CartStorage.updateQuantity(productId, quantity);
                            }
                          }
                        });
                      },
                      child: Text(
                        '-',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Inter',
                          fontSize: size.width * 0.048, // 20/420 ≈ 0.048
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top:
                  -size.width * 0.071, // Adjusted to place icon above the image
              right: size.width * 0.048, // 20/420 ≈ 0.048
              child: InkWell(
                onTap: () {
                  final cartItems = CartStorage.getCartItems();
                  print('Before delete - CartItems: $cartItems');
                  final cartItem = cartItems.firstWhere(
                    (item) => item['productName'] == widget.productName,
                    orElse: () =>
                        {'productId': -1, 'productName': widget.productName},
                  );
                  if (cartItem['productId'] != -1) {
                    print('Removing item with ID: ${cartItem['productId']}');
                    CartStorage.removeFromCart(cartItem['productId']);
                    print(
                        'After delete - CartItems: ${CartStorage.getCartItems()}');
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Item removed from cart')),
                    );
                  } else {
                    print('Item not found - CartItems: $cartItems');
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Item not found in cart')),
                    );
                  }
                },
                child: const Icon(
                  Icons.delete,
                  color: Colors.red,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
