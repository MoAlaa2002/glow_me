import 'package:glow_me/features/home/data/model/product_model.dart';

abstract class SearchState {}

class InitalSearchState extends SearchState {}

class LoadingSearchState extends SearchState {}

class LoadedSearchState extends SearchState {
  final List<ProductModel> product;
  LoadedSearchState({required this.product});
}

class FailureSearchState extends SearchState {
  final String errormsg;
  FailureSearchState({required this.errormsg});
}
