import 'package:connect_hockey/Connect_hockey_app/utils/CHColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:connect_hockey/main.dart';
import 'package:connect_hockey/main/utils/AppWidget.dart';
import 'package:lipsum/lipsum.dart' as lipsum;

import '../CHConstant.dart';



class CWSlidingSegmentedControlScreen extends StatefulWidget {
  static String tag = '/CWSlidingSegmentedControlScreen';
  final Widget child;

  const CWSlidingSegmentedControlScreen({Key key, @required this.child}) : super(key: key);

  @override
  CWSlidingSegmentedControlScreenState createState() =>
      CWSlidingSegmentedControlScreenState();
}

class CWSlidingSegmentedControlScreenState
    extends State<CWSlidingSegmentedControlScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  int segmentedControlGroupValue = 0;
  final Map<int, Widget> myTabs = <int, Widget>{
    0: Text("Item 1"),
    1: Text("Item 2")
  };
  int _sliding = 0;

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    Widget mPage(var value) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            value,
            style: boldTextStyle(),
          ).paddingLeft(16),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 16),
            child:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    text('2.34', textColor: chTextPrimaryColor, fontFamily: fontMedium),
                    text('GAA', textColor: chTextPrimaryColor),
                  ],
                ),
                Container(
                  height: width * 0.1,
                  width: 0.5,
                  color: chViewColor,
                  margin: EdgeInsets.only(left: spacing_standard_new, right: spacing_standard_new),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    text('0.915%', textColor: chTextPrimaryColor, fontFamily: fontMedium),
                    text('SV%', textColor: chTextPrimaryColor),
                  ],
                ),
                Container(
                  height: width * 0.1,
                  width: 0.5,
                  color: chViewColor,
                  margin: EdgeInsets.only(left: spacing_standard_new, right: spacing_standard_new),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    text('25', textColor: chTextPrimaryColor, fontFamily: fontMedium),
                    text('Shots/Game', textColor: chTextPrimaryColor),
                  ],
                ),
              ],
            ),
          ),
        ],
      );
    }

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(16.0),
              child: CupertinoSlidingSegmentedControl(
                  children: {
                    0: Container(
                        padding: EdgeInsets.all(8), child: Text('Monthly', style: primaryTextStyle(color: _sliding== 0 ? blackColor: grey),)),
                    1: Container(
                        padding: EdgeInsets.all(8), child: Text('Yearly',style: primaryTextStyle(color: _sliding== 1 ? blackColor: grey))),
                    2: Container(
                        padding: EdgeInsets.all(8), child: Text('All time',style: primaryTextStyle(color: _sliding== 2 ? blackColor: grey))),
                  },
                  groupValue: _sliding,
                  onValueChanged: (newValue) {
                    setState(() {
                      _sliding = newValue;
                    });
                  }),
            ),
            if (_sliding == 0) mPage("Monthly"),
            if (_sliding == 1) mPage("Yearly"),
            if (_sliding == 2) mPage("All time"),
          ],
        ),
      ),
    );
  }
}
