import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:example/models/cardmodel.dart';

class AddItems extends StatefulWidget {
  const AddItems({super.key});

  @override
  State<AddItems> createState() => _AddItemsState();
}

class _AddItemsState extends State<AddItems> {
  late TextEditingController _textController;
  late TextEditingController _priceController;


  @override
  void initState() {
    super.initState();
    _textController = TextEditingController();
    _priceController = TextEditingController();
  }

  @override
  void dispose() {
    _textController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  // Ürün ekleme
  void addItem(BuildContext context) {
    final name = _textController.text.trim();
    final imgUrl='assets/items/apple.png';
    final price = int.tryParse(_priceController.text.trim());


    if (name.isNotEmpty) {
      final counter = Provider.of<CardModel>(context, listen: false);
      counter.add(name,imgUrl,price!);
      _textController.clear();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Ürün eklendi: $name')),
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
                labelText: 'Add Product Name',
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _priceController,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Add Product Price',
              ),
            ),
            SizedBox(height: 16,),
        TextField(//img yükleme alanı
      ),
      SizedBox(height:16,),
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
