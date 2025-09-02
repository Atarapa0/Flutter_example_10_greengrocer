import 'package:flutter/material.dart';

class Greengrocer extends StatefulWidget {
  const Greengrocer({super.key});

  @override
  State<Greengrocer> createState() => _GreengrocerState();
}

class _GreengrocerState extends State<Greengrocer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GreenGrocer')),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemCount: 6,
              itemBuilder: (context, index) {
                return const Card(
                  color: Colors.grey,
                  child: Center(
                    child: Text('hello'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
