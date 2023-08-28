import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';

import 'package:shoehub/models/sneaker_model.dart';
import 'package:shoehub/shared/appstyle.dart' as style;

import '../services/helper.dart';
import '../shared/home_widget.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with TickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 3, vsync: this);

  // Getting the data of the sneakers
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  image: AssetImage("assets/images/backbackground.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(top: 10, bottom: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Mystic Shoe Hub",
                      style: style.appStyleWithHeight(
                          35, Colors.black, FontWeight.w400, 1.5),
                    ),
                    Text(
                      "Collection",
                      style: style.appStyleWithHeight(
                          35, Colors.black, FontWeight.w400, 1.2),
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
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.265),
              child: Container(
                padding: const EdgeInsets.only(left: 12),
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    HomepageWidget(
                      maleSneakers: _maleSneakers,
                      tabIndex: 0,
                    ),
                    HomepageWidget(
                      maleSneakers: _femaleSneakers,
                      tabIndex: 1,
                    ),
                    HomepageWidget(
                      maleSneakers: _femaleSneakers,
                      tabIndex: 2,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
