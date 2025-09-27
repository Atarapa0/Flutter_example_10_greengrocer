import 'package:example/models/cardmodel.dart';
import 'package:example/widgets/product_basket_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Basket extends StatefulWidget {
  const Basket({super.key});

  @override
  State<Basket> createState() => _BasketState();
}

class _BasketState extends State<Basket> {
  @override
  Widget build(BuildContext context) {
    final card = context.watch<CardModel>();
    final total = context.select<CardModel, double>((c) => c.totalPrice);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text("Basket"), Text("$total:₺")],
        ),
        backgroundColor: Colors.greenAccent,
      ),
      backgroundColor: Colors.green,
      body: Consumer<CardModel>(
        builder: (context, items, child) {
          var entries = items.items.entries
              .where((e) => e.value > 0)
              .toList();
          if (card.totalCount > 0) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 5 / 6,
              ),
              itemCount: entries.length,
              itemBuilder: (context, index) {
                var entry = entries[index];
                String imgUrl = entry.key.image;
                String name = entry.key.name;
                int price = entry.key.price;
                int value = entry.value;
                int idController = entry.key.id;
                if (value != 0) {
                  return productBasketCard(imgUrl, name, price, value, context,
                      idController);
                }
                else {
                  return const SizedBox.shrink();
                }
              },
            );
          }
          else {
            return Center(
              child:
              Text("Basket is Empty",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
            );
          }
        },
      ),
    );
  }
}
