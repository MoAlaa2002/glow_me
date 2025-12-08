import 'package:dartz/dartz.dart';
import 'package:glow_me/features/home/data/model/product_model.dart';

abstract class GetProductByTypeRepo {
  Future<Either<String, List<ProductModel>>> productType({
    required String productType,
    String? productBrand,
  });
}
