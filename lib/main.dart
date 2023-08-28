import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoehub/controllers/mainscreen_controllers.dart';

import 'controllers/product_controller.dart';
import 'main_screen.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => MainscreenNotifier(),
    ),
    ChangeNotifierProvider(
      create: (context) => ProductNotifier(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Mystic Shoe Hub",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(title: "Mystic Shoe Hub"),
    );
  }
}
