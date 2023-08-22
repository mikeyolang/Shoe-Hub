import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shoehub/UI/cartpage.dart';
import 'package:shoehub/UI/homepage.dart';
import 'package:shoehub/UI/profile.dart';
import 'package:shoehub/UI/searchpage.dart';
import 'package:shoehub/controllers/mainscreen_controllers.dart';

import 'shared/bottom_navigation_bar.dart';

// ignore: must_be_immutable
class MainScreen extends StatelessWidget {
  MainScreen({super.key, required this.title});
  final String title;

  List<Widget> pageList = const [
    Homepage(),
    SearchPages(),
    Homepage(),
    CartPage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Consumer<MainscreenNotifier>(
      builder: (context, mainScreennotifier, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          // Page list of widgets
          body: pageList[mainScreennotifier.pageIndex],
          bottomNavigationBar: const BottomNavigation(),
        );
      },
    );
  }
}
