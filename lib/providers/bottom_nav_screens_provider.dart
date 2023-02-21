import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sarah/screens/navbarScreens/cart_page.dart';
import 'package:sarah/screens/navbarScreens/food_scan_page.dart';
import 'package:sarah/screens/navbarScreens/user_profile_page.dart';

import '../screens/navbarScreens/home_page.dart';

class BottomNavScreensProvider with ChangeNotifier {
  final List<Widget> _bottomNavScreens = [
    HomePage(),
    FoodScanPage(),
    CartPage(),
    UserProfilePage()
  ];

  // Widget get getCurrentScreen(){
  //   return _bottomNavScreens[];
  // }
}
