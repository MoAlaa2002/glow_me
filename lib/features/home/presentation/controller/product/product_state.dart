import 'package:glow_me/features/home/data/model/product_model.dart';

abstract class ProductState {}

class InitalProductState extends ProductState {}

class LoadingProductState extends ProductState {}

class LoadedProductState extends ProductState {
  final List<ProductModel> product;
  LoadedProductState({required this.product});
}

class FailureProductState extends ProductState {
  final String errormsg;
  FailureProductState({required this.errormsg});
}
