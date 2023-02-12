import 'package:flutter/material.dart';
import 'package:sarah/data/static_data.dart';
import 'package:sarah/widgets/foodInformation/food_calorie.dart';
import 'package:sarah/widgets/foodInformation/food_information_panel.dart';

class FoodInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    String foodName = routeArgs['foodName']!;

    String foodImageurl = StaticData.getImageReferenceForFood(foodName);
    print(foodName);

    return Scaffold(
      floatingActionButton: FloatingActionButton(mini: true, 
        onPressed: () {
          Navigator.of(context).pop();
        },
      backgroundColor: Theme.of(context).backgroundColor,
        child:const Icon(
          Icons.arrow_back,
          color: Colors.black87,
          size: 30,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
      body: Stack(children: [
        Positioned.fill(
          bottom: MediaQuery.of(context).size.height * (1 - 0.4),
          left: 0,
          right: 0,
          top: 0,
          child: Container(
            child: Image.asset(
              foodImageurl,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned.fill(
          top: MediaQuery.of(context).size.height / 3.7,
          left: 0,
          right: 0,
          bottom: 0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(35),
            child: Container(
              color: Theme.of(context).backgroundColor,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        foodName,
                        style: const TextStyle(
                            fontSize: 35, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 40,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FoodCalorie(
                                text: '419 cals',
                                iconData: 'assets/icons/calorie.png',
                                backgroundColor:
                                    const Color.fromRGBO(53, 115, 133, 1)),
                            FoodCalorie(
                                text: 'Spicy',
                                iconData: 'assets/icons/spicy.png',
                                backgroundColor: Color.fromRGBO(168, 32, 32, 1))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 40,
                      ),
                      FoodInformationPanel(
                        informationTitle: 'Main Ingredients',
                        foodInformationList:
                            StaticData.getIngredientsList(foodName),
                        crossAxisGridCount: 2,
                        panelBackgroundColor:
                            const Color.fromRGBO(237, 164, 0, 01),
                        bulletPointColor: Colors.orangeAccent,
                        gridChildAspectRatio: 5,
                      ),
                      FoodInformationPanel(
                          informationTitle: 'May contain',
                          foodInformationList: StaticData.getOptionalIngredients(foodName),
                          bulletPointColor: const Color.fromRGBO(168, 32, 32, 1),
                          panelBackgroundColor:
                              const Color.fromRGBO(168, 32, 32, 1),
                          crossAxisGridCount: 2,
                          gridChildAspectRatio: 5),
                      FoodInformationPanel(
                          informationTitle: 'Allergy Triggers',
                          foodInformationList:
                              StaticData.getAllergyTriggersList(foodName),
                          crossAxisGridCount: 2,
                          panelBackgroundColor:
                              const Color.fromRGBO(48, 60, 74, 01),
                          gridChildAspectRatio: 5,
                          bulletPointColor:
                              const Color.fromRGBO(48, 60, 74, 01)),
                      FoodInformationPanel(
                          informationTitle: 'Not Suitable For',
                          foodInformationList:
                              StaticData.getNotStuitableFor(foodName),
                          crossAxisGridCount: 1,
                          panelBackgroundColor:
                              const Color.fromRGBO(56, 116, 132, 1),
                          gridChildAspectRatio: 10,
                          bulletPointColor:
                              const Color.fromRGBO(56, 116, 132, 1))
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }
}

//Expansion panel 
