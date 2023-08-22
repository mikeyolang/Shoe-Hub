import 'package:flutter/material.dart';
import 'package:shoehub/shared/bottom_nav_widget.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:provider/provider.dart';
import 'package:ionicons/ionicons.dart';

import '../controllers/mainscreen_controllers.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<MainscreenNotifier>(
      builder: (context, mainScreennotifier, child) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BottomNavWidget(
                    onTap: () {
                      mainScreennotifier.pageIndex = 0;
                    },
                    icon: mainScreennotifier.pageIndex == 0
                        ? CommunityMaterialIcons.home
                        : CommunityMaterialIcons.home_outline,
                  ),
                  BottomNavWidget(
                    onTap: () {
                      mainScreennotifier.pageIndex = 1;
                    },
                    icon: mainScreennotifier.pageIndex == 1
                        ? Ionicons.search
                        : Ionicons.search_outline,
                  ),
                  BottomNavWidget(
                    onTap: () {
                      mainScreennotifier.pageIndex = 2;
                    },
                    icon: mainScreennotifier.pageIndex == 2
                        ? CommunityMaterialIcons.heart
                        : CommunityMaterialIcons.heart_outline,
                  ),
                  BottomNavWidget(
                    onTap: () {
                      mainScreennotifier.pageIndex = 3;
                    },
                    icon: mainScreennotifier.pageIndex == 3
                        ? CommunityMaterialIcons.cart
                        : CommunityMaterialIcons.cart_outline,
                  ),
                  BottomNavWidget(
                    onTap: () {
                      mainScreennotifier.pageIndex = 4;
                    },
                    icon: mainScreennotifier.pageIndex == 3
                        ? Ionicons.person
                        : Ionicons.person_outline,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
