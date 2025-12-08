import 'package:flutter/material.dart';
import 'package:glow_me/features/home/data/model/product_model.dart';

class Wishlist with ChangeNotifier {
  final List<ProductModel> _productList = [];
  void toggleFavorite(ProductModel product) {
    if (_productList.contains(product)) {
      _productList.remove(product);
    } else {
      _productList.add(product);
    }
    notifyListeners();
  }

  void remove(ProductModel product) {
    _productList.remove(product);
    notifyListeners();
  }

  List<ProductModel> get wishlist {
    return _productList;
  }
}
