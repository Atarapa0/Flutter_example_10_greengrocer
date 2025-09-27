import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cardmodel.dart';

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
                            icon: Icon(Icons.add),
                            onPressed: () => context
                                .read<CardModel>()
                                .counterAdd(entries[index].key.id),
                          ),
                          /*onPressed: () {
                                items.counterAdd(entries[index].key.id);
                              },
                            ),*/
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
