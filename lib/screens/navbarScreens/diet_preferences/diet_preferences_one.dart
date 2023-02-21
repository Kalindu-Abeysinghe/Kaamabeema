import 'package:sarah/data/static_data.dart';
import 'package:sarah/screens/navbarScreens/diet_preferences/diet_preferences_two.dart';
import 'package:sarah/screens/navbarScreens/diet_preferences/diet_preferences_widget.dart';
import 'package:flutter/material.dart';

class DietPreferencesOne extends StatefulWidget {
  const DietPreferencesOne({super.key});

  static String route = '/diet-preferences-one';

  @override
  State<DietPreferencesOne> createState() => _DietPreferencesOneState();
}

class _DietPreferencesOneState extends State<DietPreferencesOne> {
  List<String> _selectedDietPreferences = [];
  List<String> _dietPreferences = StaticData.dietPreferencesPartOne;
  Map<String, bool> _dietPrefencesAndIsChecked = Map.fromIterable(
      StaticData.dietPreferencesPartOne,
      key: (element) => element,
      value: ((element) => false));

  void _onNextButtonClicked() {
    Navigator.of(context).pushNamed(DietPreferencesTwo.route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 20, top: 80, right: 20),
        decoration:  BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                    'assets/images/diet_preferences_one_background.png'))),
        child: Column(
          children: [
            Row(
              children:const [
                Text(
                  'Let\'s',
                  style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1), fontSize: 32),
                ),
                Text(
                  ' Customize',
                  style: TextStyle(
                      color: Color.fromRGBO(168, 32, 32, 1), fontSize: 32),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Select your diet preferences',
                  style: TextStyle(fontSize: 18),
                )),
            const SizedBox(
              height: 20,
            ),
            Flexible(
              fit: FlexFit.tight,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _dietPreferences.length,
                  itemBuilder: ((context, index) {
                    return CheckboxListTile(
                      activeColor: Color.fromRGBO(48, 60, 74, 1),
                      dense: true,
                      checkboxShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3),
                      ),
                      visualDensity: const VisualDensity(
                          vertical: VisualDensity.minimumDensity),
                      value:
                          _dietPrefencesAndIsChecked[_dietPreferences[index]],
                      onChanged: ((value) {
                        setState(() {
                          _dietPrefencesAndIsChecked[_dietPreferences[index]] =
                              value!;
                          if (value == true) {
                            _selectedDietPreferences
                                .add(_dietPreferences[index]);
                          } else {
                            _selectedDietPreferences
                                .remove(_dietPreferences[index]);
                          }
                        });
                      }),
                      title: Text(
                        _dietPreferences[index],
                        style: TextStyle(fontSize: 16),
                      ),
                      controlAffinity: ListTileControlAffinity.leading,
                    );
                  })),
            ),
            Align(
                alignment: Alignment.centerRight,
                child:  Padding(
                  padding: EdgeInsets.only(bottom: 10,right: 10),
                  child: ElevatedButton(
                          style: ButtonStyle(backgroundColor:MaterialStateProperty.all( Color.fromRGBO(237, 164, 0, 1)),),
                          onPressed: _onNextButtonClicked, 
                          child: Padding(
                            padding: EdgeInsets.all(12),
                            child: const Text(
                              'Next',
                              style: TextStyle(color: Color.fromRGBO(0, 0, 0, 1)),
                            ),
                          )),
                ))
          ],
        ),
      ),
      floatingActionButton: IconButton(
        onPressed: (() => Navigator.of(context).pop('')),
        icon: Image.asset('assets/icons/back_button.png',),
        iconSize: 40,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
    );
  }
}
