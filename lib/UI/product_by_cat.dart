import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shoehub/shared/appstyle.dart' as style;

class ProductByCategory extends StatefulWidget {
  const ProductByCategory({super.key});

  @override
  State<ProductByCategory> createState() => _ProductByCategoryState();
}

class _ProductByCategoryState extends State<ProductByCategory>
    with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 3, vsync: this);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(16, 45, 0, 0),
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: const BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                  image: AssetImage("assets/images/background1.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(6, 12, 16, 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            FontAwesomeIcons.xmark,
                            color: Colors.white,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: const Icon(
                            FontAwesomeIcons.sliders,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  TabBar(
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: Colors.transparent,
                    isScrollable: true,
                    labelColor: Colors.white,
                    labelStyle:
                        style.appstyle(24, Colors.white, FontWeight.w500),
                    unselectedLabelColor: Colors.grey.withOpacity(0.3),
                    tabs: const [
                      Tab(
                        text: "Men Shoes",
                      ),
                      Tab(
                        text: "Women Shoes",
                      ),
                      Tab(
                        text: "Kid Shoes",
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            Padding(
              padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.265, left: 16, right: 12),
              child: TabBarView(
                controller: _tabController,
                children: [
               Container(
                height: 500,
                width: 500,
                color: Colors.red,
               ),
               Container(
                height: 500,
                width: 500,
                color: Colors.blue,
               ),
               Container(
                height: 500,
                width: 500,
                color: Colors.green,
               ),
              ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}
