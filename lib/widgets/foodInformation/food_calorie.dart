import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class FoodCalorie extends StatelessWidget {
  String text;
  String iconData;
  Color backgroundColor;

  FoodCalorie(
      {required this.text,
      required this.iconData,
      required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(40),
      child: Container(
        height: MediaQuery.of(context).size.height/8,
          width: MediaQuery.of(context).size.width / 7,
          color: backgroundColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
              Container(
                width: MediaQuery.of(context).size.width / 8,
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500
                  ),
                ),
              ),
              CircleAvatar(
                  radius: 25,
                  backgroundColor: Theme.of(context).backgroundColor,
                  child: Image.asset(iconData, color: backgroundColor,))
            ]),
          )),
    );
  }
}
