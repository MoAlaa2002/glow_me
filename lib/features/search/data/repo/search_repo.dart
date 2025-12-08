import 'package:dartz/dartz.dart';
import 'package:glow_me/features/home/data/model/product_model.dart';

abstract class SearchRepo {
  Future<Either<String, List<ProductModel>>> searchProduct({
    String? productType,
    String? productBrand,
  });
}
