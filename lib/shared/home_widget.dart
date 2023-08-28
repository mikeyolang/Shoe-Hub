import 'package:flutter/material.dart';
import 'package:shoehub/UI/product_by_cat.dart';
import 'package:shoehub/shared/new_shoes.dart';
import 'package:shoehub/shared/product_card.dart';
import 'package:community_material_icon/community_material_icon.dart';
import '../models/sneaker_model.dart';
import '../shared/appstyle.dart' as style;

class HomepageWidget extends StatelessWidget {
  const HomepageWidget({
    super.key,
    required Future<List<Sneakers>> maleSneakers, required this.tabIndex,
  }) : _maleSneakers = maleSneakers;

  final Future<List<Sneakers>> _maleSneakers;
  final int tabIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: MediaQuery.of(context).size.height * 0.405,
            child: FutureBuilder<List<Sneakers>>(
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
                        return ProductCard(
                          price: "\$ ${shoe.price}",
                          name: shoe.name,
                          image: shoe.image,
                          category: shoe.category,
                          id: shoe.id,
                        );
                      },
                      itemCount: snapshot.data!.length,
                      scrollDirection: Axis.horizontal,
                    );
                  }
                })),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 20, 12, 20),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  ProductByCategory(
                        tabIndex: tabIndex,
                      ),
                    ),
                  );
                },
                child: Row(
                  children: [
                    Text(
                      "Latest Shoes",
                      style: style.appstyle(24, Colors.black, FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Text(
                          "Show All",
                          style:
                              style.appstyle(16, Colors.black, FontWeight.w400),
                        ),
                        const Icon(
                          CommunityMaterialIcons.arrow_right_drop_circle,
                          size: 16,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.13,
          child: FutureBuilder<List<Sneakers>>(
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
                    return NewShoes(
                      imageUrl: shoe.image,
                    );
                  },
                  itemCount: snapshot.data!.length,
                  scrollDirection: Axis.horizontal,
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
