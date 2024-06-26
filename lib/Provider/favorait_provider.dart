import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store_prv/model/model_product.dart';

class FavoraitProvider extends ChangeNotifier {
  final List<Product> _Favorait = [];
  List<Product> get favorait => _Favorait;
  void toggelFavorait(Product product) {
    if (_Favorait.contains(product)) {
      _Favorait.remove(product);
    } else {
      _Favorait.add(product);
    }
    notifyListeners();
  }

  bool isExite(Product product) {
    final isExite = _Favorait.contains(product);
    return isExite;
  }

  static FavoraitProvider of(
    BuildContext context, {
    bool listen = true,
  }) {
    return Provider.of<FavoraitProvider>(
      context,
      listen: listen,
    );
  }
}
