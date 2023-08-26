import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shoehub/shared/appstyle.dart' as style;
import 'package:shoehub/shared/category_button.dart';
import 'package:shoehub/shared/custom_spacer.dart';

import '../models/sneaker_model.dart';
import '../services/helper.dart';
import '../shared/latest_shoes.dart';

class ProductByCategory extends StatefulWidget {
  const ProductByCategory({super.key, required this.tabIndex});
  final int tabIndex;

  @override
  State<ProductByCategory> createState() => _ProductByCategoryState();
}

class _ProductByCategoryState extends State<ProductByCategory>
    with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 3, vsync: this);
  late Future<List<Sneakers>> _maleSneakers;

  void getMale() {
    _maleSneakers = SneakerService().getMaleSneakers();
  }

  late Future<List<Sneakers>> _femaleSneakers;

  void getFemale() {
    _femaleSneakers = SneakerService().getFemaleSneakers();
  }

  late Future<List<Sneakers>> _kidSneakers;

  void getKid() {
    _kidSneakers = SneakerService().getKidsSneakers();
  }

  @override
  void initState() {
    super.initState();
    getMale();
    getFemale();
    getKid();
  }

  List<String> brand = [
    "assets/images/brandLogos/addidas.png",
    "assets/images/brandLogos/jordan.png",
    "assets/images/brandLogos/luois.png",
    "assets/images/brandLogos/nike.png",
  ];

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
                          onTap: () {
                            filter();
                          },
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
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.265,
                  left: 16,
                  right: 12),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    LatestShoes(
                      maleSneakers: _maleSneakers,
                    ),
                    LatestShoes(
                      maleSneakers: _femaleSneakers,
                    ),
                    LatestShoes(
                      maleSneakers: _kidSneakers,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> filter() {
    double currentSliderValue = 100;
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.white54,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.82,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(125),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 5,
              width: 40,
              decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: Column(
                children: [
                  const CustomSpacer(),
                  Text(
                    "Filet",
                    style: style.appstyle(40, Colors.black, FontWeight.bold),
                  ),
                  const CustomSpacer(),
                  Text(
                    "Gender",
                    style: style.appstyle(20, Colors.black, FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      const CategoryButton(
                        label: "Men",
                        buttonColor: Colors.black,
                      ),
                      const CategoryButton(
                        label: "Female",
                        buttonColor: Colors.grey,
                      ),
                      const CategoryButton(
                        label: "Kids",
                        buttonColor: Colors.grey,
                      ),
                      const CustomSpacer(),
                      Text(
                        "Category",
                        style:
                            style.appstyle(20, Colors.black, FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const CategoryButton(
                            label: "Shoes",
                            buttonColor: Colors.black,
                          ),
                          const CategoryButton(
                            label: "Apparels",
                            buttonColor: Colors.grey,
                          ),
                          const CategoryButton(
                            label: "Accessories",
                            buttonColor: Colors.grey,
                          ),
                          const CustomSpacer(),
                          Text(
                            "Price",
                            style: style.appstyle(
                              20,
                              Colors.black,
                              FontWeight.bold,
                            ),
                          ),
                          Slider(
                            value: currentSliderValue,
                            activeColor: Colors.black,
                            inactiveColor: Colors.grey,
                            thumbColor: Colors.black,
                            max: 100,
                            divisions: 50,
                            label: currentSliderValue.round().toString(),
                            secondaryTrackValue: 200,
                            onChanged: (double value) {},
                          ),
                          const CustomSpacer(),
                          Text(
                            "Brands",
                            style: style.appstyle(
                                20, Colors.black, FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            height: 80,
                            child: ListView.builder(
                                itemCount: brand.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(12),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(15),
                                        ),
                                      ),
                                      child: Image.asset(
                                        brand[index],
                                        height: 50,
                                        width: 80,
                                        color: Colors.black,
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
