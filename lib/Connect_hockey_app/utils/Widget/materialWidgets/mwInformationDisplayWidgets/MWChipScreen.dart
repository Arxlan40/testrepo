import 'package:connect_hockey/Connect_hockey_app/utils/CHColors.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:connect_hockey/main/utils/AppColors.dart';
import 'package:connect_hockey/main/utils/AppWidget.dart';

import 'package:connect_hockey/main.dart';

import '../../../CHConstant.dart';

 List<String> selectedProgrammingList =[];

class MWChipScreen extends StatefulWidget {
  static String tag = '/MWChipScreen';

  @override
  MWChipScreenState createState() => MWChipScreenState();
}

class MWChipScreenState extends State<MWChipScreen> {
  var isSelected = false;
  int _value = 1;
  int _value1 = 1;
  int _value2 = 1;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  List<String> programmingList = [
    "Goalie",
    "Coach",
  ];

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appStore.scaffoldBackground,
        body: CustomTheme(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                  child: Text(
                    "Position",
                    style: TextStyle(color: chPrimaryColor, fontFamily: fontMedium),
                  ),
                ),
                MultiSelectChip(
                  programmingList,
                  onSelectionChanged: (selectedList) {
                    setState(() {
                      selectedProgrammingList = selectedList;
                    });
                    print(selectedProgrammingList);
                  },
                ).paddingLeft(16.0)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MultiSelectChip extends StatefulWidget {
  final List<String> reportList;
  final Function(List<String>) onSelectionChanged;

  MultiSelectChip(this.reportList, {this.onSelectionChanged});

  @override
  _MultiSelectChipState createState() => _MultiSelectChipState();
}

class _MultiSelectChipState extends State<MultiSelectChip> {
  List<String> selectedChoices = [];

  _buildChoiceList() {
    List<Widget> choices = [];
    widget.reportList.forEach((item) {
      choices.add(Container(
        padding: const EdgeInsets.all(2.0),
        child: ChoiceChip(
          label: Text(item),
          selected: selectedChoices.contains(item),
          onSelected: (selected) {
            setState(() {
              selectedChoices.contains(item)
                  ? selectedChoices.remove(item)
                  : selectedChoices.add(item);
              widget.onSelectionChanged(selectedChoices);
            });
          },
        ),
      ));
    });
    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: _buildChoiceList(),
    );
  }
}
