import 'package:connect_hockey/Connect_hockey_app/utils/CHColors.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:connect_hockey/main.dart';
import 'package:connect_hockey/main/utils/AppWidget.dart';

class MWSwitchScreenBehindTheNet extends StatefulWidget {
  static String tag = '/MWSwitchScreen';

  @override
  MWSwitchScreenBehindTheNetState createState() => MWSwitchScreenBehindTheNetState();
}

class MWSwitchScreenBehindTheNetState extends State<MWSwitchScreenBehindTheNet> {
  bool isSwitched = false;
  var blunderOrNot = 'No Blunder';
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
                        Text('Behind the Net', style: primaryTextStyle()),
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
                                    blunderOrNot = 'No Blunder';
                                  }
                                    else{
                                    blunderOrNot = 'Blunder';
                                  }
                                });
                              },
                              activeTrackColor: chLightBackgroundColor,
                              activeColor: chPrimaryColor,
                            ),
                            Text('$blunderOrNot', style: TextStyle(color: appStore.textSecondaryColor, fontSize: 16)),
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
