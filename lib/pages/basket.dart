import 'package:example/models/cardmodel.dart';
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
          if(card.totalCount>0){
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
                else{
                  return const SizedBox.shrink();
                }
              },
            );
          }
          else{
            return Center(
              child:
              Text("Basket is Empty",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            );
          }
        },
      ),
    );
  }
}
