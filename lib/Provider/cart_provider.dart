import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_prv/model/model_product.dart';

class CartProvider extends ChangeNotifier {
  final List<Product> _Cart = [];
  List<Product> get cart => _Cart;
  void toggelFavorait(Product product) {
    if (_Cart.contains(product)) {
      for (Product element in _Cart) {
        element.quantity++;
      }
    } else {
      _Cart.add(product);
    }
    notifyListeners();
  }

  totalPrice() {
    double total1 = 0.0;
    for (Product element in _Cart) {
      total1 += element.price * element.quantity;
    }
    return total1;
  }

  incerement(int index) => _Cart[index].quantity++;
  decerement(int index) => _Cart[index].quantity--;

  static CartProvider of(
    BuildContext context, {
    bool listen = true,
  }) {
    return Provider.of<CartProvider>(
      context,
      listen: listen,
    );
  }
}
