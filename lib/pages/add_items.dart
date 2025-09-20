import 'dart:io';
import 'package:image_picker/image_picker.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
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
    final imgUrl = _imageFile!.path;
    final price = int.tryParse(_priceController.text.trim());

    if (name.isNotEmpty || price != null || price! > 0 || _imageFile != null) {
      final counter = Provider.of<CardModel>(context, listen: false);
      counter.add(name, imgUrl, price!);
      _textController.clear();

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Ürün eklendi: $name')));
    }
    else{
      ScaffoldMessenger.of(context,).showSnackBar(SnackBar(content: Text("Make sure you fill in all the fields")));
    }

  }

  File? _imageFile;

  Future<void> _pickAndSaveImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      // uygulamanın local documents dizinini bul
      final directory = await getApplicationDocumentsDirectory();
      final fileName = "${DateTime.now().millisecondsSinceEpoch}.png";
      final path = "${directory.path}/$fileName";

      // resmi yeni konuma kaydet
      final File newImage = await File(pickedFile.path).copy(path);

      setState(() {
        _imageFile = newImage;
      });

      print("Resim kaydedildi: $path");
    }
  }

  // Resim seçme

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Product"),
        backgroundColor: Colors.greenAccent,
      ),
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
            SizedBox(height: 16),
            Center(
              child: _imageFile == null
                  ? Text("Resim seçilmedi")
                  : Image.file(_imageFile!, height: 120),
            ),


            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => addItem(context),
              child: Text("Add"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _pickAndSaveImage,
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}
