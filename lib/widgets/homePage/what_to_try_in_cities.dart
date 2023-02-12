import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class WhatToTryInCities extends StatelessWidget {
  const WhatToTryInCities({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> imageUrls = [
      'assets/images/galle.png',
      'assets/images/colombo.png',
      'assets/images/kandy.jpg',
    ];

    return Container(
      height: MediaQuery.of(context).size.height / 6,
      child: ListView.builder(
          itemCount: imageUrls.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Card(
                  elevation: 5,
                  child: Image.asset(
                    imageUrls[index],
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width/1.5,
                  ),
                ),
              ),
            );
          }),
    );

  }
}
