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
    return Scaffold(
      body: child,
      bottomNavigationBar: SizedBox(
        height: 68,
        child: Column(
          children: [
            BottomNavigationBar(
              selectedLabelStyle: customTextStyle(context: context),
              unselectedLabelStyle: customTextStyle(context: context, color: TextStyleColor.secondaryColor),
              currentIndex: child.currentIndex,
              // backgroundColor: Constants.myTheme == 1
              //     ? Color(0xfffceb91)
              //     : Constants.myTheme == 2
              //         ? Color(0xffc3c7e2)
              //         : Constants.myTheme == 3
              //             ? Color(0xffeaafae)
              //             : Constants.myTheme == 4
              //                 ? Color(0xffd6965a)
              //                 : Color(0xffeaafae),
              type: BottomNavigationBarType.fixed,
              selectedItemColor: whiteColor,
              unselectedItemColor: disableColor,
              items: [
                BottomNavigationBarItem(
                  icon: CustomIcon(
                    IconName.bottomBarIconCommunity,
                    height: 30,
                    color: blackColor.withOpacity(0.9),
                  ),
                  label: tr('bottom_bar.community'),
                ),
                BottomNavigationBarItem(
                  icon: const CustomIcon(
                    IconName.bottomBarIconChat,
                    height: 40,
                  ),
                  label: tr('bottom_bar.chat'),
                ),
                BottomNavigationBarItem(
                  icon: const CustomIcon(
                    IconName.profileStaff6,
                    height: 40,
                  ),
                  label: tr('bottom_bar.home'),
                ),
                BottomNavigationBarItem(
                  icon: const CustomIcon(
                    IconName.bottomBarIconNote,
                    height: 40,
                  ),
                  label: tr('bottom_bar.note'),
                ),
                BottomNavigationBarItem(
                  icon: const CustomIcon(
                    IconName.bottomBarIconBooking,
                    height: 40,
                  ),
                  label: tr('bottom_bar.booking'),
                ),
              ],
              onTap: (index) {
                child.goBranch(index, initialLocation: index == child.currentIndex);
                // setState(() {
                //   checkPage(index);
                //   //widget.currentIndex = index;
                //   Navigator.pushReplacement(
                //       context, MaterialPageRoute(builder: (context) => MainPage(index, widget.email)));
                //   print(_children[widget.currentIndex]);
                // });
              },
            ),
            //notificationList(),
          ],
        ),
      ),
    );
  }
}
