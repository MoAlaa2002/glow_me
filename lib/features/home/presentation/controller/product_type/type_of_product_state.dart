import 'package:glow_me/features/home/data/model/product_model.dart';

abstract class TypeOfProductState {}

class InitialTypeOfProductState extends TypeOfProductState {}

class LoadingTypeOfProductState extends TypeOfProductState {}

class LoadedTypeOfProductState extends TypeOfProductState {
  final List<ProductModel> list;
  LoadedTypeOfProductState({required this.list});
}

class FailureTypeOfProductState extends TypeOfProductState {
  final String errormsg;
  FailureTypeOfProductState({required this.errormsg});
}
