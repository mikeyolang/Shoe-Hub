import 'package:flutter/material.dart';
import 'package:community_material_icon/community_material_icon.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
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
            backgroundColor: Colors.transparent ,
            expandedHeight: MediaQuery.of(context).size.height ,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.5,
                  )
                ],
                
              ),
            ),
          ),
        ],
      ),
    );
  }
}
