import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/config/colors.dart';

import '../main_screen.dart';

class BottomNavigation extends StatelessWidget {
  BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: MainScreen.selectedIndexNotifier,
        builder: (BuildContext context, int updatedIndex, Widget? _) {
          return BottomNavigationBar(
            backgroundColor: button_color,
            elevation: 5,
            selectedItemColor: black,
            unselectedItemColor: Colors.white,
            unselectedFontSize: 12,
            selectedFontSize: 14,
            unselectedLabelStyle: GoogleFonts.inter(
                textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w500)),
            selectedLabelStyle: GoogleFonts.inter(
                textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500)),
            currentIndex: updatedIndex,
            onTap: (newIndex) {
              MainScreen.selectedIndexNotifier.value = newIndex;
              if (newIndex == 0) {
              } else if (newIndex == 1) {
              } else if (newIndex == 2) {
              } else if (newIndex == 3) {}
            },
            items: [
              BottomNavigationBarItem(
                label: 'Home',
                activeIcon: Image.asset(
                  "asset/bottom_navigation_icons/Home.png",
                  height: 25,
                  color: black,
                  width: 25,
                ),
                icon: Image.asset(
                  "asset/bottom_navigation_icons/Home.png",
                  height: 25,
                  width: 25,
                  color: Colors.white,
                ),
              ),
              BottomNavigationBarItem(
                label: 'My Tickets',
                activeIcon: Image.asset(
                  "asset/bottom_navigation_icons/Tickets.png",
                  color: black,
                  height: 25,
                  width: 25,
                ),
                icon: Image.asset(
                  "asset/bottom_navigation_icons/Tickets.png",
                  height: 25,
                  width: 25,
                  color: Colors.white,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Notice',
                activeIcon: Image.asset(
                  "asset/bottom_navigation_icons/Notice.png",
                  color: black,
                  height: 25,
                  width: 25,
                ),
                icon: Image.asset(
                  "asset/bottom_navigation_icons/Notice.png",
                  height: 25,
                  width: 25,
                  color: Colors.white,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Account',
                activeIcon: Image.asset(
                  "asset/bottom_navigation_icons/Account.png",
                  color: black,
                  height: 25,
                  width: 25,
                ),
                icon: Image.asset(
                  "asset/bottom_navigation_icons/Account.png",
                  height: 25,
                  width: 25,
                  color: Colors.white,
                ),
              ),
            ],
          );
        });
  }
}
