import 'package:dartz/dartz.dart';
import 'package:glow_me/core/api/api_services.dart';
import 'package:glow_me/features/home/data/model/product_model.dart';
import 'package:glow_me/features/home/data/repo/product/product_repo.dart';

class ProductRepoImple implements ProductRepo {
  ApiServices apiServices;
  ProductRepoImple({required this.apiServices});
  @override
  Future<Either<String, List<ProductModel>>> products() async {
    try {
      var data = await apiServices.get(endpoint: "products.json");
      List<ProductModel> productList = [];
      for (var i in data) {
        productList.add(ProductModel.fromJson(i));
      }
      return right(productList);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
