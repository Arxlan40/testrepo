import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:connect_hockey/main.dart';
import 'package:connect_hockey/main/utils/AppWidget.dart';

class MWDropDownButtonScreen extends StatefulWidget {
  static const tag = '/MWDropDownButtonScreen';

  @override
  _MWDropDownButtonScreenState createState() => _MWDropDownButtonScreenState();
}

class _MWDropDownButtonScreenState extends State<MWDropDownButtonScreen> {
  List<String> listOfCategory = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'];
  String selectedIndexCategory = '0';
  String dropdownNames;
  String dropdownScrollable = 'I';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Text('Goal For', style: boldTextStyle()),
              10.height,
              Card(
                  elevation: 4,
                  child: DropdownButton(
                    isExpanded: true,
                    dropdownColor: appStore.appBarColor,
                    value: selectedIndexCategory,
                    style: boldTextStyle(),
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: appStore.iconColor,
                    ),
                    underline: 0.height,
                    onChanged: (newValue) {
                      setState(() {
                        toast(newValue);
                        selectedIndexCategory = newValue;
                      });
                    },
                    items: listOfCategory.map((category) {
                      return DropdownMenuItem(
                        child: Text(category, style: primaryTextStyle()).paddingLeft(8),
                        value: category,
                      );
                    }).toList(),
                  )),
              10.height,
              Text('Goal Against', style: boldTextStyle()),
              10.height,
              Card(
                  elevation: 4,
                  child: DropdownButton(
                    isExpanded: true,
                    dropdownColor: appStore.appBarColor,
                    value: selectedIndexCategory,
                    style: boldTextStyle(),
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: appStore.iconColor,
                    ),
                    underline: 0.height,
                    onChanged: (newValue) {
                      setState(() {
                        toast(newValue);
                        selectedIndexCategory = newValue;
                      });
                    },
                    items: listOfCategory.map((category) {
                      return DropdownMenuItem(
                        child: Text(category, style: primaryTextStyle()).paddingLeft(8),
                        value: category,
                      );
                    }).toList(),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
