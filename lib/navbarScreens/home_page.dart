import 'package:flutter/material.dart';
import 'package:sarah/widgets/homePage/home_search_bar.dart';
import 'package:sarah/widgets/homePage/recommended_food_items.dart';
import 'package:sarah/widgets/homePage/shop_now_items.dart';
import 'package:sarah/widgets/homePage/what_to_try_in_cities.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget getCategoryHeading(String categoryName, BuildContext context) {
    return Padding(
      padding:const EdgeInsets.symmetric(horizontal: 30),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          categoryName,
          textAlign: TextAlign.left,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/home_page_background.png'),
              fit: BoxFit.cover)),
      padding:const EdgeInsets.fromLTRB(15, 10, 15, 0),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height / 20,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Hello, Jane Doe!',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 30,
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: HomeSearchBar()),
          SizedBox(
            height: MediaQuery.of(context).size.height / 45,
          ),
          getCategoryHeading('Recommended', context),
          SizedBox(
            height: MediaQuery.of(context).size.height / 45,
          ),
          RecommendedFoodItems(),
          SizedBox(
            height: MediaQuery.of(context).size.height / 45,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'What to try in',
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 45,
          ),
          WhatToTryInCities(),
          SizedBox(
            height: MediaQuery.of(context).size.height / 45,
          ),
          getCategoryHeading('Shop now', context),
          SizedBox(
            height: MediaQuery.of(context).size.height / 45,
          ),
          ShopNowItems()
        ],
      ),
    );
  }
}
