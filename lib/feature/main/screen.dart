import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nutalk/constant.dart';
import 'package:nutalk/widget/icon.dart';
import 'package:nutalk/widget/textstyle.dart';

class MainNavigatorBar extends StatelessWidget {
  final StatefulNavigationShell child;
  const MainNavigatorBar({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: child,
          bottomNavigationBar: SizedBox(
            height: 85,
            child: BottomNavigationBar(
              elevation: 0,
              selectedLabelStyle: customTextStyle(
                  context: context,
                  fontSize: TextStyleSize.s14,
                  fontWeight: TextStyleWeight.bold),
              unselectedLabelStyle: customTextStyle(
                  context: context,
                  color: TextStyleColor.secondaryColor,
                  fontSize: TextStyleSize.s12),
              currentIndex: child.currentIndex,
              backgroundColor: primaryTheme1,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: whiteColor,
              unselectedItemColor: disableColor,
              items: [
                BottomNavigationBarItem(
                  icon: CustomIcon(
                    IconName.bottomBarIconCommunity,
                    height: 15,
                    color: blackColor.withOpacity(0.4),
                  ),
                  label: tr('bottom_bar.community'),
                ),
                BottomNavigationBarItem(
                  icon: const CustomIcon(
                    IconName.bottomBarIconChat,
                    height: 20,
                  ),
                  label: tr('bottom_bar.chat'),
                ),
                BottomNavigationBarItem(
                  icon: const CustomIcon(
                    IconName.profileStaff1,
                    height: 20,
                  ),
                  label: tr('bottom_bar.home'),
                ),
                BottomNavigationBarItem(
                  icon: const CustomIcon(
                    IconName.bottomBarIconNote,
                    height: 20,
                  ),
                  label: tr('bottom_bar.note'),
                ),
                BottomNavigationBarItem(
                  icon: const CustomIcon(
                    IconName.bottomBarIconBooking,
                    height: 20,
                  ),
                  label: tr('bottom_bar.booking'),
                ),
              ],
              onTap: (index) {
                child.goBranch(index,
                    initialLocation: index == child.currentIndex);
              },
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 23),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: () =>
                    child.goBranch(2, initialLocation: 2 == child.currentIndex),
                child: const CustomIcon(
                  IconName.profileStaff1,
                  height: 60,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
