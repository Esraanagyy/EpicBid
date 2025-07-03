import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:epicBid/cubits/product_cubit/product_states.dart';
import 'package:epicBid/models/product_model.dart';
import 'package:http/http.dart' as http;

import '../../models/product_details_model.dart';

class ProductCubit extends Cubit<ProductStates> {
  ProductCubit() : super(ProductInitialState());

  // Pagination variables
  List<ProductModel> products = [];
  List<ProductModel> filteredProducts = [];
  int pageIndex = 1; // Start with page 1
  int pageSize = 10; // Default page size
  bool isLoadingMore = false; // Track loading state
  bool hasMore = true; // Track if more products are available

  // Get products with pagination
  void getProducts({bool loadMore = false}) async {
    if (isLoadingMore || !hasMore)
      return; // Prevent multiple simultaneous requests

    isLoadingMore = true;
    if (!loadMore) {
      emit(ProductLoadingState());
    } else {
      emit(LoadMoreProductsState());
    }

    try {
      final uri = Uri.parse(
        'http://ebic-bid11.runasp.net/api/Product/GetAllProducts?pageindex=$pageIndex&Pagesize=$pageSize',
      );
      http.Response response = await http.get(uri);
      var responseBody = jsonDecode(response.body);

      if (response.statusCode == 200) {
        // Clear products if not loading more (i.e., initial load or refresh)
        if (!loadMore) {
          products.clear();
          filteredProducts.clear();
        }

        // Add new products
        for (var item in responseBody['data']) {
          products.add(ProductModel.fromJson(data: item));
        }

        // Check if there are more products to load
        if (responseBody['data'].length < pageSize) {
          hasMore = false; // No more products to load
        }

        // Increment pageIndex for the next load
        if (loadMore) {
          pageIndex++;
        }

        emit(GetProductSuccessState());
      } else {
        emit(GetProductFailState());
      }
    } catch (e) {
      print('Error fetching products: $e');
      emit(GetProductFailState());
    } finally {
      isLoadingMore = false;
    }
  }

  // Search
  void filterProducts({required String input}) {
    filteredProducts = products
        .where((element) =>
            element.name?.toLowerCase().contains(input.toLowerCase()) ?? false)
        .toList();
    emit(FilterProductsSuccessState());
  }

  // Get product by id
  ProductDetailsModel? productDetails;
  void getProductDetails(int productId) async {
    try {
      emit(ProductLoadingState());

      final url =
          'http://ebic-bid11.runasp.net/api/Product/GetProductById?id=$productId';
      print('Request URL: $url');

      final response = await http.get(Uri.parse(url));

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        productDetails = ProductDetailsModel.fromJson(data: responseBody);
        emit(GetProductDetailsSuccessState(productDetails!));
      } else {
        emit(GetProductDetailsFailState());
      }
    } catch (e) {
      print('Error fetching product details: $e');
      emit(GetProductDetailsFailState());
    }
  }

  // Add product
  void addProduct({
    required String name,
    required String description,
    required String imageUploaded,
    required double price,
    required bool inStock,
    required String color,
    required String size,
    required String dimensions,
    required int productCategoryId,
    required bool isAuction,
    required String auctionStartTime,
    required String auctionEndTime,
  }) async {
    try {
      http.Response response = await http.post(
        Uri.parse('http://ebic-bid11.runasp.net/api/Product/AddProduct'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'name': name,
          'description': description,
          'imageUploaded': imageUploaded,
          'price': price,
          'inStock': inStock,
          'color': color,
          'size': size,
          'dimensions': dimensions,
          'productCategoryId': productCategoryId,
          'isAuction': isAuction,
          'auctionStartTime': auctionStartTime,
          'auctionEndTime': auctionEndTime,
        }),
      );
      var responseBody = jsonDecode(response.body);

      if (response.statusCode == 200) {
        emit(AddProductSuccessState());
      } else {
        emit(AddProductFailedState());
      }
    } catch (e) {
      print('Error during registration: $e');
      emit(AddProductFailedState());
    }
  }

  // Reset pagination for a fresh fetch
  void resetPagination() {
    pageIndex = 1;
    hasMore = true;
    products.clear();
    filteredProducts.clear();
    getProducts();
  }
}
