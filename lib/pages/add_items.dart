import 'package:example/models/cardmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddItems extends StatefulWidget {
  const AddItems({super.key});

  @override
  State<AddItems> createState() => _AddItemsState();

}

class _AddItemsState extends State<AddItems> {
  late TextEditingController _controller;
  var i = 0;
  // Ürün ekleme fonksiyonu
  void addItem(BuildContext context) {
    final value = _controller.text.trim();
    if (value.isNotEmpty) {
      final counter = Provider.of<CardModel>(context, listen: false);
      counter.add(value); // sadece ürünü ekle
      _controller.clear();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Ürün eklendi: $value')),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Add Product")),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Add Product',
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => addItem(context),
                    child: Text("Ekle"),
                  ),
                ],
              ),
            ),

          ],
        ),
      );

    }
}
