import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNav extends StatelessWidget {
  final Widget child;

  const BottomNav({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();

    int currentIndex = 0;
    if (location.startsWith('/add-items')) {
      currentIndex = 1;
    } else if (location.startsWith('/basket')) {
      currentIndex = 2;
    }

    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          switch (index) {
            case 0:
              context.go('/greengrocer');
              break;
            case 1:
              context.go('/add-items');
              break;
            case 2:
              context.go('/basket');
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.store), label: "Greengrocer"),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: "Add İtems"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_basket), label: "Basket"),
        ],
      ),
    );
  }
}
