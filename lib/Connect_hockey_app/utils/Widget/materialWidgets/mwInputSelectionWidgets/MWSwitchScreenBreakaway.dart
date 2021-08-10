import 'package:connect_hockey/Connect_hockey_app/utils/CHColors.dart';
import 'package:connect_hockey/Connect_hockey_app/utils/Widget/materialWidgets/mwInputSelectionWidgets/MWSwitchScreenBehindTheNet.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:connect_hockey/main.dart';
import 'package:connect_hockey/main/utils/AppWidget.dart';

class MWSwitchScreenBreakaway extends StatefulWidget {
  static String tag = '/MWSwitchScreen';

  @override
  MWSwitchScreenBreakawayState createState() => MWSwitchScreenBreakawayState();
}

class MWSwitchScreenBreakawayState extends State<MWSwitchScreenBreakaway> {
  bool isSwitched = false;
  var breakawayOrNo = 'No';
  var textHolder = 'OFF';

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Card(
                  child: Container(
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Breakaway', style: primaryTextStyle()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Switch(
                              hoverColor: Colors.red,
                              value: isSwitched,
                              onChanged: (value) {
                                setState(() {
                                  isSwitched = value;
                                  if (isSwitched == false){
                                    breakawayOrNo = 'No';
                                  }
                                    else{
                                    breakawayOrNo = 'Yes';
                                  }
                                });
                              },
                              activeTrackColor: chLightBackgroundColor,
                              activeColor: chPrimaryColor,
                            ),
                            Text('$breakawayOrNo', style: TextStyle(color: appStore.textSecondaryColor, fontSize: 16)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}
