import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:sarah/models/food_information.dart';
import 'package:sarah/navbarScreens/cart_page.dart';
import 'package:sarah/navbarScreens/food_scan_page.dart';
import 'package:sarah/navbarScreens/home_page.dart';
import 'package:sarah/navbarScreens/user_profile_page.dart';
import 'package:sarah/widgets/foodInformation/food_information.dart';
import 'package:sarah/widgets/foodInformation/food_information_panel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentTabIndex = 0;

  List<Widget> _bottomNavPages = [
    HomePage(),
    FoodScanPage(),
    CartPage(),
    UserProfilePage()
  ];

  void _changeBottomTabPages(int value) {
    setState(() {
      _currentTabIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    //   void toFoodInformationPage(context){
    //   Navigator.of(context).pushNamed('/food-information',arguments: {'foodName':'Kottu'});
    // }

    RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KaamaBeema',
      theme: ThemeData(
          backgroundColor: Colors.grey[300],
          // ignore: prefer_const_constructors
          textTheme: TextTheme(
              titleMedium: const TextStyle(
                fontSize: 20,
              ),
              bodyLarge:
                  const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(
                      color: Color.fromRGBO(246, 246, 239, 1), fontSize: 18),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  backgroundColor: Color.fromRGBO(53, 115, 133, 1)))),
      home: Scaffold(
        body: _bottomNavPages[_currentTabIndex],
        backgroundColor: Colors.grey[300],
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(left: 8, right: 8, bottom: 16),
          child: GNav(
              selectedIndex: _currentTabIndex,
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
      ),
      routes: {
        '/food-information': (ctx) => FoodInformation(),
      },
    );
  }
}
