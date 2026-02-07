import 'package:flutter/material.dart';
import 'package:practice/ui/screens/product_dm/product_dm.dart';

class CartProvider extends ChangeNotifier {
  final List<ProductDm> _cartItems = [];

  List<ProductDm> get cartItems => _cartItems;

  void addToCart(ProductDm product) {
    int index = _cartItems.indexWhere((item) => item.title == product.title);

    if (index != -1) {
      _cartItems[index].quantity++;
    } else {
      product.quantity = 1;
      _cartItems.add(product);
    }
    notifyListeners();
  }

  void removeFromCart(ProductDm product) {
    _cartItems.remove(product);
    notifyListeners();
  }

  void incrementQuantity(ProductDm product) {
    product.quantity++;
    notifyListeners();
  }

  void decrementQuantity(ProductDm product) {
    if (product.quantity > 1) {
      product.quantity--;
    } else {
      _cartItems.remove(product);
    }
    notifyListeners();
  }

  int get totalPrice {
    int total = 0;
    for (var product in _cartItems) {
      String cleanPrice = product.price.replaceAll(RegExp(r'[^0-9]'), '');
      int price = int.parse(cleanPrice);
      total += (price * product.quantity);
    }
    return total;
  }

  int get itemsCount => _cartItems.length;
}
