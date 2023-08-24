import 'package:flutter/material.dart';
import 'package:shoehub/shared/stagger_tile.dart';

import '../models/sneaker_model.dart';

class LatestShoes extends StatelessWidget {
  const LatestShoes({
    super.key,
    required Future<List<Sneakers>> maleSneakers,
  }) : _maleSneakers = maleSneakers;

  final Future<List<Sneakers>> _maleSneakers;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Sneakers>>(
      future: _maleSneakers,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text("Error ${snapshot.error}");
        } else {
          return ListView.builder(
            itemBuilder: (context, index) {
              final shoe = snapshot.data![index];
              return StaggerTile(
                price: "\$ ${shoe.price}",
                name: shoe.name,
                imageUrl: shoe.image,
              );
            },
            itemCount: snapshot.data!.length,
            scrollDirection: Axis.horizontal,
          );
        }
      },
    );
  }
}
