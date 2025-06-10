import '../../models/product_details_model.dart';

abstract class ProductStates {}

class ProductInitialState extends ProductStates {}

class GetProductSuccessState extends ProductStates {}

class GetProductFailState extends ProductStates {}

class GetProductDetailsSuccessState extends ProductStates {
  final ProductDetailsModel product;

  GetProductDetailsSuccessState(this.product);
}

class GetProductDetailsFailState extends ProductStates {}

class ProductLoadingState extends ProductStates {}

class AddProductSuccessState extends ProductStates {}

class AddProductFailedState extends ProductStates {}

class FilterProductsSuccessState extends ProductStates {}
