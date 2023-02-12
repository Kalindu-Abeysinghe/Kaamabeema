import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sarah/data/static_data.dart';

class RecommendedFoodItems extends StatelessWidget {
  const RecommendedFoodItems({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> imageUrls = StaticData.foodImageReferences;

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
                    width: MediaQuery.of(context).size.width/4,
                  ),
                ),
              ),
            );
          }),
    );
  }
}
