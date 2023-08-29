import 'dart:math';

import 'package:flutter/material.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:provider/provider.dart';
import 'package:shoehub/models/sneaker_model.dart';
import 'package:shoehub/services/helper.dart';

import '../controllers/product_controller.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key, required this.id, required this.category});

  final String id;
  final String category;
  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final PageController pageController = PageController(initialPage: 0);
  late Future<Sneakers> _sneakers;

  void getShoes() {
    if (widget.category == "menShoes") {
      _sneakers = SneakerService().getMaleSneakersById(widget.id);
    } else if (widget.category == "womenShoes") {
      _sneakers = SneakerService().getFemaleSneakersById(widget.id);
    } else {
      _sneakers = SneakerService().getKidSneakersById(widget.id);
    }
  }

  @override
  void initState() {
    getShoes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Sneakers>(
        future: _sneakers,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text("Error ${snapshot.error}");
          } else {
            final sneaker = snapshot.data;
            return Consumer<ProductNotifier>(
              builder: (context, productNotifier, child) {
                return CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      automaticallyImplyLeading: false,
                      // backgroundColor: Colors.white,
                      leadingWidth: 0,
                      title: Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Icon(
                                CommunityMaterialIcons.close,
                                color: Colors.black,
                                size: 30,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: const Icon(
                                CommunityMaterialIcons.ellipse,
                                color: Colors.black,
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                      ),
                      pinned: true,
                      snap: false,
                      floating: true,
                      backgroundColor: Colors.transparent,
                      expandedHeight: MediaQuery.of(context).size.height,
                      flexibleSpace: FlexibleSpaceBar(
                        background: Stack(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.5,
                              width: MediaQuery.of(context).size.width,
                              child: PageView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: sneaker!.image.length,
                                controller: pageController,
                                onPageChanged: (value) {
                                  productNotifier.activePage = value;
                                },
                                itemBuilder: (context, index) {
                                  return Stack(
                                    children: [
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.39,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        color: Colors.grey[300],
                                        child: Image.asset(
                                          sneaker.image[index],
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      Positioned(
                                        top:
                                            MediaQuery.of(context).size.height *
                                                0.09,
                                        right: 20,
                                        child: const Icon(
                                          CommunityMaterialIcons.heart_outline,
                                          color: Colors.white,
                                          size: 30,
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        right: 0,
                                        left: 0,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.3,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: List.generate(
                                            sneaker.image.length,
                                            (index) {
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: CircleAvatar(
                                                  radius: 5,
                                                  backgroundColor:
                                                      productNotifier
                                                                  .activePage ==
                                                              index
                                                          ? Colors.black
                                                          : Colors.grey,
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}
