import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sarah/data/static_data.dart';

class DietPreferencesWidget extends StatefulWidget {
  String titlePart1;
  String titlePart2;
  String headerDescription;
  List<String> dietPreferences;
  String bottomRightButtonText;
  String navigationRoute;

  DietPreferencesWidget(
      {required this.titlePart1,
      required this.titlePart2,
      required this.headerDescription,
      required this.dietPreferences,
      required this.bottomRightButtonText,
      required this.navigationRoute});

  @override
  State<DietPreferencesWidget> createState() => _DietPreferencesWidgetState();
}

class _DietPreferencesWidgetState extends State<DietPreferencesWidget> {
  List<String> _selectedDietPreferences = [];

  void onNextButtonClicked() {
    Navigator.of(context).pushNamed(widget.navigationRoute,
        arguments: {'selectDietPreferences': _selectedDietPreferences});
  }

  @override
  Widget build(BuildContext context) {
    Map<String, bool> _dietPrefencesAndIsChecked = Map.fromIterable(
      widget.dietPreferences,
      key: (element) => element,
      value: (element) => false,
    );

    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 20, top: 80, right: 20),
        decoration: null,
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  widget.titlePart1,
                  style: const TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1), fontSize: 32),
                ),
                Text(
                  widget.titlePart2,
                  style: const TextStyle(
                      color: Color.fromRGBO(168, 32, 32, 1), fontSize: 32),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  widget.headerDescription,
                  style: const TextStyle(fontSize: 18),
                )),
            Flexible(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.dietPreferences.length,
                  itemBuilder: ((context, index) {
                    return CheckboxListTile(
                      dense: true,
                      checkboxShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(3),
                      ),
                      visualDensity: const VisualDensity(
                          vertical: VisualDensity.minimumDensity),
                      value: _dietPrefencesAndIsChecked[
                          widget.dietPreferences[index]],
                      onChanged: ((value) {
                        setState(() {
                          _dietPrefencesAndIsChecked[
                              widget.dietPreferences[index]] = value!;
                          if (value == true) {
                            _selectedDietPreferences
                                .add(widget.dietPreferences[index]);
                          } else {
                            _selectedDietPreferences
                                .remove(widget.dietPreferences[index]);
                          }
                        });
                      }),
                      title: Text(
                        widget.dietPreferences[index],
                        style: TextStyle(fontSize: 16),
                      ),
                      controlAffinity: ListTileControlAffinity.leading,
                    );
                  })),
            ),
            Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                    onPressed: onNextButtonClicked, child: Text(widget.bottomRightButtonText)))
          ],
        ),
      ),
      floatingActionButton: IconButton(
        onPressed: (() => Navigator.of(context).pop()),
        icon: Icon(
          Icons.arrow_back,
        ),
        iconSize: 40,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
    );
  }
}
