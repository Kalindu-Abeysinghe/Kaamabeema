import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:sarah/screens/navbarScreens/cart_page.dart';
import 'package:sarah/screens/navbarScreens/food_scan_page.dart';
import 'package:sarah/screens/navbarScreens/home_page.dart';
import 'package:sarah/screens/navbarScreens/user_profile_page.dart';

class ScaffoldWrapper extends StatefulWidget with ChangeNotifier {
  int _currentTabIndex = 0;

  List<Widget> _bottomNavPages = [
    HomePage(),
    FoodScanPage(),
    CartPage(),
    UserProfilePage()
  ];

  Widget scaffoldBody;

  ScaffoldWrapper({required this.scaffoldBody});

  Widget get currentScreen {
    return _bottomNavPages[_currentTabIndex];
  }

  @override
  State<ScaffoldWrapper> createState() => _ScaffoldWrapperState();
}

class _ScaffoldWrapperState extends State<ScaffoldWrapper> {
  void _changeBottomTabPages(int value) {
    setState(() {
      widget._currentTabIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, bottom: 16),
        child: GNav(
            selectedIndex: widget._currentTabIndex,
            onTabChange: _changeBottomTabPages,
            tabBackgroundColor: Colors.grey.shade400,
            gap: 10,
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            iconSize: 30,
            // ignore: prefer_const_literals_to_create_immutables
            tabs: [
              const GButton(
                icon: Icons.home_outlined,
                text: 'Home',
              ),
              const GButton(
                icon: Icons.camera_alt_outlined,
                text: 'Scan',
              ),
              const GButton(
                icon: Icons.shopping_cart_outlined,
                text: 'Cart',
              ),
              const GButton(
                icon: Icons.supervised_user_circle_sharp,
                text: 'Profile',
              )
            ]),
      ),
    );
  }
}
