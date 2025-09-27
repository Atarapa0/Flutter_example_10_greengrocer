import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cardmodel.dart';
import '../widgets/product_card.dart';

class Greengrocer extends StatefulWidget {
  const Greengrocer({super.key});

  @override
  State<Greengrocer> createState() => _GreengrocerState();
}

class _GreengrocerState extends State<Greengrocer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GreenGrocer'),
        backgroundColor: Colors.greenAccent,
      ),
      backgroundColor: Colors.green,
      body: Consumer<CardModel>(
        builder: (context, items, child) {
          var entries = items.items.entries.toList();
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 4 / 5,
            ),
            itemCount: entries.length,
            itemBuilder: (context, index) {
              var entry = entries[index];
              String imgUrl = entry.key.image;
              String name = entry.key.name;
              int price = entry.key.price;
              int value = entry.value;
              return productCard(
                  imgUrl,
                  name,
                  price,
                  value,
                  context,
                  entries,
                  index);
            },
          );
        },
      ),
    );
  }

}