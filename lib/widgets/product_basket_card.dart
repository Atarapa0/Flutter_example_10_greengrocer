import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cardmodel.dart';

Padding productBasketCard(String imgUrl, String name, int price, int value, BuildContext context, int idController) {
  return Padding(
    padding: EdgeInsets.all(8),
    child: Card(
      elevation: 4,
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
                  errorBuilder: (_, __, ___) => const Icon(Icons.image_not_supported),
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
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
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
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Center(child: Text(value.toString())),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: () => context.read<CardModel>().remove(idController)
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

