import 'package:flutter/material.dart';
import 'package:shoehub/shared/appstyle.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Text("Favorites", style: appstyle(36, Colors.black, FontWeight.w500)),
      ),
    );
  }
}
