import 'package:bloc/bloc.dart';
import 'package:glow_me/features/home/data/repo/product/product_repo_imple.dart';
import 'package:glow_me/features/home/presentation/controller/product/product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductRepoImple productRepoImple;
  ProductCubit({required this.productRepoImple}) : super(InitalProductState());
  fetchProduct() async {
    emit(LoadingProductState());
    var value = await productRepoImple.products();
    return value.fold(
      (error) {
        emit(FailureProductState(errormsg: error));
      },
      (product) {
        emit(LoadedProductState(product: product));
      },
    );
  }
}
