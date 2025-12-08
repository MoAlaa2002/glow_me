import 'package:flutter/material.dart';
import 'package:glow_me/features/home/data/model/product_model.dart';

class Cart with ChangeNotifier {
  final Map<ProductModel, int> _productCart = {};

  Map<ProductModel, int> get productCart => _productCart;

  void add(ProductModel product) {
    if (_productCart.containsKey(product)) {
      _productCart[product] = _productCart[product]! + 1;
    } else {
      _productCart[product] = 1;
    }
    notifyListeners();
  }

  void remove(ProductModel product) {
    if (!_productCart.containsKey(product)) return;

    if (_productCart[product]! > 1) {
      _productCart[product] = _productCart[product]! - 1;
    } else {
      _productCart.remove(product);
    }
    notifyListeners();
  }

  void removeCompletely(ProductModel product) {
    _productCart.remove(product);
    notifyListeners();
  }

  double get totalPrice {
    double total = 0.0;
    _productCart.forEach((product, quantity) {
      double price =
          double.tryParse(product.price.replaceAll('\$', '').trim()) ?? 0.0;
      total += price * quantity;
    });
    return total;
  }
}
