// lib/pages/greengrocer.dart
import 'package:flutter/material.dart';

class Greengrocer extends StatelessWidget {
  const Greengrocer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Veya başka bir temel widget
      appBar: AppBar(
        title: const Text('Manav'),
      ),
      body: const Center(
        child: Text(
            'Manav Sayfası İçeriği'), // Buraya kendi içeriğinizi ekleyin
      ),
    );
  }
}
    