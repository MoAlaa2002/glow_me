import 'package:glow_me/features/home/data/model/product_model.dart';
import 'package:dartz/dartz.dart';

abstract class ProductRepo {
  Future<Either<String, List<ProductModel>>> products();
}
