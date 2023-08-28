import 'package:flutter/material.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:provider/provider.dart';

import '../controllers/product_controller.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ProductNotifier>(
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
                        onTap: () {},
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
                          itemCount: 4,
                          controller: pageController,
                          onPageChanged: (value) {
                            productNotifier.activePage = value;
                          },
                          itemBuilder: (context, index) {
                            return Stack(
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.39,
                                  width: MediaQuery.of(context).size.width,
                                  color: Colors.grey[300],
                                  child: Image.asset(
                                    'assets/images/1.jpg',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Positioned(
                                  top:
                                      MediaQuery.of(context).size.height * 0.09,
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
                                      MediaQuery.of(context).size.height * 0.3,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: List.generate(
                                      4,
                                      (index) {
                                        return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: CircleAvatar(
                                            radius: 5,
                                            backgroundColor:
                                                productNotifier.activePage ==
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
      ),
    );
  }
}
