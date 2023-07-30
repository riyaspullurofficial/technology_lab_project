import 'package:flutter/material.dart';
import 'package:technology_lab_project/ui/bottom_navigation_screens/account_screen.dart';
import 'package:technology_lab_project/ui/bottom_navigation_screens/notice_screen.dart';
import 'package:technology_lab_project/utils/config/colors.dart';

import 'bottom_navigation/bottom_navigation.dart';
import 'bottom_navigation_screens/home_screen.dart';
import 'bottom_navigation_screens/my_ticket_screen.dart';
import 'drawer_screen/drawer_sction.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  static ValueNotifier<int> selectedIndexNotifier = ValueNotifier(0);
  final _pages = [
    HomeScreen(),
    MyTicketScreen(),
    NoticeScreen(),
    AccountScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: button_color,
        centerTitle: true,
        /* title:
            Image.asset(
          "asset/icons/splash/logo_png_type.png",
          height: 45,
          width: 45,
        ),*/
        actions: [],
      ),
      drawer: DrawerSection(),
      bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
              // sets the background color of the `BottomNavigationBar`
              canvasColor: button_color,
              // sets the active color of the `BottomNavigationBar` if `Brightness` is light
              primaryColor: button_color,
              textTheme: Theme.of(context)
                  .textTheme
                  .copyWith(caption: new TextStyle(color: Colors.yellow))),
          // sets the inactive color of the `BottomNavigationBar`
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: BottomNavigation()),
          )),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: selectedIndexNotifier,
          builder: (BuildContext context, int updatedIndex, Widget? child) {
            return _pages[updatedIndex];
          },
        ),
      ),
    );
  }
}
