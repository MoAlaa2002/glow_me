import 'package:dio/dio.dart';

class ApiServices {
  final String _baseUrl = "https://makeup-api.herokuapp.com/api/v1/";
  final Dio dio;
  ApiServices({required this.dio});
  Future<dynamic> get({required String endpoint}) async {
    var response = await dio.get("$_baseUrl$endpoint");
    return response.data;
  }

  Future<dynamic> getProductByProductType({
    required String endPoint,
    String? productType,
    String? brand,
  }) async {
    var response = await dio.get(
      "$_baseUrl$endPoint",
      queryParameters: {
        if (brand != null && brand.isNotEmpty) 'brand': brand,

        if (productType != null && productType.isNotEmpty)
          'product_type': productType,
      },
    );
    return response.data;
  }

  Future<dynamic> productSearch({
    required String endPoint,
    String? productType,
    String? brand,
  }) async {
    var response = await dio.get(
      "$_baseUrl$endPoint",
      queryParameters: {
        if (brand != null && brand.isNotEmpty) 'brand': brand,
        if (productType != null && productType.isNotEmpty)
          'product_type': productType,
      },
    );
    return response.data;
  }
}
