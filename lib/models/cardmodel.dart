import 'package:example/models/productmodel.dart';
import 'package:flutter/material.dart';



class CardModel with ChangeNotifier{
  int _idCounter = 1; // otomatik id üretmek için
  Map<ProductModel, int> items = {};

  void add(String productName,String productImage,int productPrice) {
    var product = ProductModel(
      id: _idCounter++,
      name: productName,
      price: productPrice,
      image: productImage,
    );
    items[product] = 0;
    notifyListeners();

  }
  void counterAdd(int idController) {
    ProductModel? keyFound;

    items.forEach((product, count) {
      if (product.id == idController) {
        keyFound = product;
        print(product.name);
      }
    });

    items[keyFound!] = items[keyFound!]! + 1; // count artar
      notifyListeners();


  }


  void remove(String productName) {
    ProductModel? keyFound;
    items.forEach((product, count) {
      if (product.name == productName) {
        keyFound = product;
      }
    });
    if (items[keyFound!] != 0) {
      if (items[keyFound!] == 1) {
        items[keyFound!] = items[keyFound!]! - 1;
        //items[keyFound!] = items[keyFound!]! - 1;
        notifyListeners();
      }
    }
  }
  }