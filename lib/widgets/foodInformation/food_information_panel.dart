import 'package:flutter/material.dart';
import 'package:sarah/data/static_data.dart';

class FoodInformationPanel extends StatefulWidget {
  String informationTitle;
  List<String> foodInformationList;
  Color bulletPointColor;
  int crossAxisGridCount;
  Color panelBackgroundColor;
  double gridChildAspectRatio;
  bool isExpanded;

  FoodInformationPanel(
      {required this.informationTitle,
      required this.foodInformationList,
      required this.bulletPointColor,
      required this.panelBackgroundColor,
      required this.crossAxisGridCount,
      this.isExpanded = false,
      required this.gridChildAspectRatio});
  @override
  State<FoodInformationPanel> createState() => _FoodInformationPanelState();
}

class _FoodInformationPanelState extends State<FoodInformationPanel> {
  bool isPanelExpanded = false;

  Widget getGridViewForList(List<String> gridItems, Color bulletPointColor) {
    return Container(
      height: MediaQuery.of(context).size.height / 3,
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: widget.crossAxisGridCount,
            childAspectRatio: widget.gridChildAspectRatio,
          ),
          itemCount: gridItems.length,
          itemBuilder: ((context, index) {
            return Row(
              children: [
                Icon(
                  Icons.circle,
                  color: bulletPointColor,
                  size: 20,
                ),
                const SizedBox(
                  width: 7,
                ),
                Container(
                  child: Text(
                    gridItems[index],
                    style: const TextStyle(fontSize: 16),
                  ),
                )
              ],
            );
          })),
    );
  }

  @override
  Widget build(BuildContext context) {
    const Color whiteColorUsedHere = Color.fromRGBO(255, 255, 255, 0.8);
    // return
    // child: ExpansionTile(title: Text(widget.informationTitle),children: [
    //   ListTile(title: getGridViewForList(widget.foodInformationList, widget.bulletPointColor),)
    // ],),
    //     Container(
    //   padding: const EdgeInsets.symmetric(horizontal: 20),
    //   child: Column(
    //     children: [
    //       ClipRRect(
    //         borderRadius: BorderRadius.circular(35),
    //         child: Material(
    //           elevation: 10,
    //           child: ExpansionPanelList(
    //             expansionCallback: (panelIndex, isExpanded) {
    //               setState(() {
    //                 isPanelExpanded = !isPanelExpanded;
    //               });
    //             },
    //             children: [
    //               ExpansionPanel(
    //                 isExpanded: isPanelExpanded,
    //                 canTapOnHeader: true,
    //                 backgroundColor: widget.panelBackgroundColor,
    //                 headerBuilder: ((context, isExpanded) => Container(
    //                         child: Padding(
    //                       padding: const EdgeInsets.only(top: 10),
    //                       // child:Row(children: [Text(
    //                       //   widget.informationTitle,
    //                       //   textAlign: TextAlign.center,
    //                       //   style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500, color: Colors.white),
    //                       // ),
    //                       // isExpanded ? Icon( Icons.arrow_drop_up) : Icon(Icons.arrow_drop_down)],)
    //                       child: Text(
    //                         widget.informationTitle,
    //                         textAlign: TextAlign.center,
    //                         style: const TextStyle(
    //                             fontSize: 22,
    //                             fontWeight: FontWeight.w600,
    //                             color: Color.fromRGBO(255, 255, 255, 0.8)),
    //                       ),
    //                     ))),
    //                 body: Padding(
    //                   padding: const EdgeInsets.symmetric(horizontal: 20),
    //                   child: getGridViewForList(widget.foodInformationList,
    //                       widget.bulletPointColor),
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //       SizedBox(
    //         height: MediaQuery.of(context).size.height / 40,
    //       )
    //     ],
    //   ),
    // );

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(children: [
        ClipRRect(
          child: Container(
            color: Theme.of(context).backgroundColor,
            child: Column(
              children: [
                ClipRRect(
                borderRadius: BorderRadius.circular(35),
                  child: Container(
                    padding:const EdgeInsets.only(right: 20),
                    color: widget.panelBackgroundColor,
                    child: GestureDetector(
                      onTap: () => setState(() {
                        isPanelExpanded = !isPanelExpanded;
                      }),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 7),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                widget.informationTitle,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                    color: whiteColorUsedHere),
                              ),
                            ),
                            CircleAvatar(
                              radius: 20,
                              backgroundColor: widget.panelBackgroundColor,
                              child: isPanelExpanded
                                  ? Image.asset(
                                      'assets/icons/arrow_up.png',
                                      color: whiteColorUsedHere,
                                    )
                                  : Image.asset(
                                      'assets/icons/arrow_down.png',
                                      color: whiteColorUsedHere,
                                    ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.fastOutSlowIn,
                  height: isPanelExpanded ? null : 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: getGridViewForList(
                        widget.foodInformationList, widget.bulletPointColor),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 40,
        ),
      ]),
    );
  }
}
