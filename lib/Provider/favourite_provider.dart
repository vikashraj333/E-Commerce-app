import 'package:e_commerce_app/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouriteProvider extends ChangeNotifier {
  final List<Product> _favorites = [];
  List<Product> get favorites => _favorites;
  void toggleFavourite(Product product) {
    if (_favorites.contains(product)) {
      _favorites.remove(product);
    } else {
      _favorites.add(product);
    }
    notifyListeners();
  }

  bool isExist(Product product) {
    final isExist = _favorites.contains(product);
    return isExist;
  }

  static FavouriteProvider of(
    BuildContext context, {
    bool listen = true,
  }) {
    return Provider.of<FavouriteProvider>(
      context,
      listen: listen,
    );
  }
}
