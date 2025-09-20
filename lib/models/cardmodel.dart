import 'package:example/models/productmodel.dart';
import 'package:flutter/material.dart';

class CardModel with ChangeNotifier {
  int _idCounter = 1;
  Map<ProductModel, int> items = {};

  void add(String productName, String productImage, int productPrice) {
    var product = ProductModel(
      id: _idCounter++,
      name: productName,
      price: productPrice,
      image: productImage,
    );
    items[product] = 2;
    print(productName + productPrice.toString());
    notifyListeners();
  }

  void counterAdd(int idController) {
    ProductModel? keyFound;

    for (final product in items.keys) {
      if (product.id == idController) {
        keyFound = product;
        print(product.name + items[product].toString());
        break;
      }
    }

    if (keyFound == null) return; // no matching product; do nothing

    final current = items[keyFound] ?? 0;
    items[keyFound] = current + 1;
    notifyListeners();
  }

  void remove(int idController) {
    ProductModel? keyFound;

    for (final product in items.keys) {
      if (product.id == idController) {
        keyFound = product;
        break;
      }
    }

    if (keyFound == null) return; // no matching product; do nothing

    final current = items[keyFound] ?? 0;
    if (current > 0) {
      items[keyFound] = current - 1;
      notifyListeners();
    }
  }
}
