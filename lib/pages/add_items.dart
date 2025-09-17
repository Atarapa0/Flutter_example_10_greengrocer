import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:example/models/cardmodel.dart';

class AddItems extends StatefulWidget {
  const AddItems({super.key});

  @override
  State<AddItems> createState() => _AddItemsState();
}

class _AddItemsState extends State<AddItems> {
  late TextEditingController _textController;


  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  // Ürün ekleme
  void addItem(BuildContext context) {
    final value = _textController.text.trim();
    if (value.isNotEmpty) {
      final counter = Provider.of<CardModel>(context, listen: false);
      counter.add(value);
      _textController.clear();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Ürün eklendi: $value')),
      );
    }
  }

  // Resim seçme

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Product"), backgroundColor: Colors.greenAccent,),
      backgroundColor: Colors.green,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Ürün ismi
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Add Product',
              ),
            ),

            SizedBox(height: 16),

            ElevatedButton(
              onPressed: () => addItem(context),
              child: Text("Add"),
            ),
          ],
        ),
      ),
    );
  }
}
