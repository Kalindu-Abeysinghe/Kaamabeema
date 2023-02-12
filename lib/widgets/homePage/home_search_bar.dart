import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.grey[400]),
      padding: EdgeInsets.symmetric(horizontal:20),
      child:
          Row(crossAxisAlignment: CrossAxisAlignment.center, children: <Widget>[
        Expanded(
          child: TextField(
            decoration: InputDecoration(
                hintText: 'Search food...',
                border: InputBorder.none),
          ),
        ),
        IconButton(
          onPressed: null,
          icon: Icon(Icons.search),
          iconSize: 25,
        )
      ]),
    );
  }
}
