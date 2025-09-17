import 'package:flutter/material.dart';

class CardModel with ChangeNotifier{
  Map<String,int> items={};
  void add(String productName) {
    // ürün daha önce eklendiyse count'u artır, yoksa 1 olarak başlat
    items[productName] = (items[productName] ?? 0) + 1;
    notifyListeners();
  }

  void remove(String productName) {
    if (items.containsKey(productName) && items[productName]! > 0) {
      items[productName] = items[productName]! - 1;



      notifyListeners();
    }
  }


}