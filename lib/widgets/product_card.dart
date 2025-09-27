import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cardmodel.dart';
import '../models/productmodel.dart';

Padding productCard(
  String imgUrl,
  String name,
  int price,
  int value,
  BuildContext context,
  List<MapEntry<ProductModel, int>> entries,
  int index,
) {
  return Padding(
    padding: EdgeInsets.all(8),
    child: Card(
      elevation: 20,
      margin: EdgeInsets.all(6),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Image.asset(
                  imgUrl,
                  fit: BoxFit.fitHeight,
                  height: 65,
                  width: 65,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    name,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    "${price.toString()}₺",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [Expanded(child: Center(child: Text(value.toString())))],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () =>
                    context.read<CardModel>().counterAdd(entries[index].key.id),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
