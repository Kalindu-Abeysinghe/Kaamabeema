import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ShopNowItems extends StatelessWidget {
  const ShopNowItems({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> imageUrls = [
      'assets/images/jaggery.png',
      'assets/images/kithul_syrup.png',
      'assets/images/dodol.png',
      'assets/images/tea.png',
      'assets/images/curd.png',
      'assets/images/kokis.png',

    ];

    List<String> itemNames = ['Jaggery', 'Kithul Syrup', 'Dodol' ,'Dilmah Tea', 'Curd', 'Kokis'];

    return Container(
      height: MediaQuery.of(context).size.height / 8,
      child: ListView.builder(
          itemCount: imageUrls.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
                margin: EdgeInsets.symmetric(horizontal: 10,),
                child: Column(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          imageUrls[index],
                          fit: BoxFit.fill,
                          width: MediaQuery.of(context).size.width / 4,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: Text(
                        itemNames[index],
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ));
          }),
    );
    ;
  }
}
