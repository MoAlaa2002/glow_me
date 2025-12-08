import 'package:dartz/dartz.dart';
import 'package:glow_me/core/api/api_services.dart';
import 'package:glow_me/features/home/data/model/product_model.dart';
import 'package:glow_me/features/search/data/repo/search_repo.dart';

class SearchRepoImple implements SearchRepo {
  ApiServices apiServices;
  SearchRepoImple({required this.apiServices});
  @override
  Future<Either<String, List<ProductModel>>> searchProduct({
    String? productType,
    String? productBrand,
  }) async {
    try {
      var data = await apiServices.productSearch(
        endPoint: "products.json",
        productType: productType,
        brand: productBrand,
      );
      List<ProductModel> productList = [];
      for (var i in data) {
        productList.add(ProductModel.fromJson(i));
      }
      return right(productList);
    } catch (e) {
      return left(e.toString());
    }
  }
}
