import 'package:connect_hockey/Connect_hockey_app/utils/CHColors.dart';
import 'package:connect_hockey/Connect_hockey_app/utils/Widget/materialWidgets/mwInputSelectionWidgets/MWSwitchScreenBehindTheNet.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:connect_hockey/main.dart';
import 'package:connect_hockey/main/utils/AppWidget.dart';

class MWSwitchScreenFacingShot extends StatefulWidget {
  static String tag = '/MWSwitchScreen';

  @override
  MWSwitchScreenFacingShotState createState() => MWSwitchScreenFacingShotState();
}

class MWSwitchScreenFacingShotState extends State<MWSwitchScreenFacingShot> {
  bool isSwitched = false;
  var facingShotOrNo = 'No';
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
                        Text('Facing the Shooter', style: primaryTextStyle()),
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
                                    facingShotOrNo = 'No';
                                  }
                                    else{
                                    facingShotOrNo = 'Yes';
                                  }
                                });
                              },
                              activeTrackColor: chLightBackgroundColor,
                              activeColor: chPrimaryColor,
                            ),
                            Text('$facingShotOrNo', style: TextStyle(color: appStore.textSecondaryColor, fontSize: 16)),
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
