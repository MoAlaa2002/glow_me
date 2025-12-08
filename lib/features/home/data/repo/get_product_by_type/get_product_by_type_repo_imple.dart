import 'package:dartz/dartz.dart';
import 'package:glow_me/core/api/api_services.dart';
import 'package:glow_me/features/home/data/model/product_model.dart';
import 'package:glow_me/features/home/data/repo/get_product_by_type/get_product_by_type_repo.dart';

class GetProductByTypeRepoImple implements GetProductByTypeRepo {
  ApiServices apiServices;
  GetProductByTypeRepoImple({required this.apiServices});

  @override
  Future<Either<String, List<ProductModel>>> productType({
    String? productType,
    String? productBrand,
  }) async {
    try {
      var data = await apiServices.getProductByProductType(
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
