import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:glow_me/features/home/data/repo/get_product_by_type/get_product_by_type_repo_imple.dart';
import 'package:glow_me/features/home/presentation/controller/product_type/type_of_product_state.dart';

class TypeOfProductCubit extends Cubit<TypeOfProductState> {
  GetProductByTypeRepoImple getProductByTypeRepoImple;
  TypeOfProductCubit({required this.getProductByTypeRepoImple})
    : super(InitialTypeOfProductState());
  fetchProducttype({String? productsType, String? productBrand}) async {
    emit(LoadingTypeOfProductState());
    var value = await getProductByTypeRepoImple.productType(
      productType: productsType,
      productBrand: productBrand,
    );
    return value.fold(
      (error) {
        emit(FailureTypeOfProductState(errormsg: error));
      },
      (product) {
        emit(LoadedTypeOfProductState(list: product));
      },
    );
  }
}
