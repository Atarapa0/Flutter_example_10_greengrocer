import 'package:example/router/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/cardmodel.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (_) => CardModel(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
