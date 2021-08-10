import 'package:connect_hockey/Connect_hockey_app/utils/CHConstant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:connect_hockey/main/utils/AppWidget.dart';
import '../../main.dart';
import 'package:connect_hockey/Connect_hockey_app/utils/CHColors.dart';

class CHProfileStatistic extends StatefulWidget {
  static var tag = "/T5Profile";

  @override
  CHProfileStatisticState createState() => CHProfileStatisticState();
}

class CHProfileStatisticState extends State<CHProfileStatistic> {
  double width;

  @override
  void initState() {
    super.initState();
  }

  var currentIndex = 0;

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  Widget gridItem(int pos) {
    return Container(
        width: (width - (16 * 3)) / 2,
        height: (width - (16 * 3)) / 2,
        decoration: boxDecoration(radius: 24, showShadow: true, bgColor: chAppBackground),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        ));
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: appStore.scaffoldBackground,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  Container(
                    alignment: Alignment.topCenter,
                    decoration: BoxDecoration(color: chAppBackground, borderRadius: BorderRadius.only(topLeft: Radius.circular(24), topRight: Radius.circular(24))),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        text('REFLEXES', textColor: chTextPrimaryColor, fontFamily: fontMedium),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Container(
                                  height: 8,
                                  child: LinearProgressIndicator(
                                    value: 0.9, // percent filled
                                    valueColor: AlwaysStoppedAnimation<Color>(chPrimaryColor),
                                    backgroundColor: Color(0XFFD7DCE0),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  text("Glove High", textColor:chPrimaryColor, fontSize: textSizeMedium, fontFamily: fontSemibold),
                                  text("90%",  textColor:chPrimaryColor, fontFamily: fontBold, fontSize: textSizeNormal)
                                ],
                              ),
                              SizedBox(height: 4),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Container(
                                  height: 8,
                                  child: LinearProgressIndicator(
                                    value: 0.92, // percent filled
                                    valueColor: AlwaysStoppedAnimation<Color>(chPrimaryColor),
                                    backgroundColor: Color(0XFFD7DCE0),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  text("Glove Low", textColor:chPrimaryColor, fontSize: textSizeMedium, fontFamily: fontSemibold),
                                  text("92%",  textColor:chPrimaryColor, fontFamily: fontBold, fontSize: textSizeNormal)
                                ],
                              ),
                              SizedBox(height: 4),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Container(
                                  height: 8,
                                  child: LinearProgressIndicator(
                                    value: 0.85, // percent filled
                                    valueColor: AlwaysStoppedAnimation<Color>(chPrimaryColor),
                                    backgroundColor: Color(0XFFD7DCE0),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  text("Blocker High", textColor:chPrimaryColor, fontSize: textSizeMedium, fontFamily: fontSemibold),
                                  text("85%",  textColor:chPrimaryColor, fontFamily: fontBold, fontSize: textSizeNormal)
                                ],
                              ),
                              SizedBox(height: 4),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Container(
                                  height: 8,
                                  child: LinearProgressIndicator(
                                    value: 0.9, // percent filled
                                    valueColor: AlwaysStoppedAnimation<Color>(chPrimaryColor),
                                    backgroundColor: Color(0XFFD7DCE0),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  text("Blocker low", textColor:chPrimaryColor, fontSize: textSizeMedium, fontFamily: fontSemibold),
                                  text("90%",  textColor:chPrimaryColor, fontFamily: fontBold, fontSize: textSizeNormal)
                                ],
                              ),
                            ],
                          ),
                        ),
                        text('TECHNIQUE', textColor: chPrimaryColor, fontFamily: fontMedium),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Container(
                                  height: 8,
                                  child: LinearProgressIndicator(
                                    value: 0.9, // percent filled
                                    valueColor: AlwaysStoppedAnimation<Color>(chPrimaryColor),
                                    backgroundColor: Color(0XFFD7DCE0),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  text("Positioning", textColor:chPrimaryColor, fontSize: textSizeMedium, fontFamily: fontSemibold),
                                  text("90%",  textColor:chPrimaryColor, fontFamily: fontBold, fontSize: textSizeNormal)
                                ],
                              ),
                              SizedBox(height: 4),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Container(
                                  height: 8,
                                  child: LinearProgressIndicator(
                                    value: 0.92, // percent filled
                                    valueColor: AlwaysStoppedAnimation<Color>(chPrimaryColor),
                                    backgroundColor: Color(0XFFD7DCE0),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  text("Lateral", textColor:chPrimaryColor, fontSize: textSizeMedium, fontFamily: fontSemibold),
                                  text("92%",  textColor:chPrimaryColor, fontFamily: fontBold, fontSize: textSizeNormal)
                                ],
                              ),
                              SizedBox(height: 4),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Container(
                                  height: 8,
                                  child: LinearProgressIndicator(
                                    value: 0.85, // percent filled
                                    valueColor: AlwaysStoppedAnimation<Color>(chPrimaryColor),
                                    backgroundColor: Color(0XFFD7DCE0),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  text("Break Away", textColor:chPrimaryColor, fontSize: textSizeMedium, fontFamily: fontSemibold),
                                  text("85%",  textColor:chPrimaryColor, fontFamily: fontBold, fontSize: textSizeNormal)
                                ],
                              ),
                              SizedBox(height: 4),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Container(
                                  height: 8,
                                  child: LinearProgressIndicator(
                                    value: 0.9, // percent filled
                                    valueColor: AlwaysStoppedAnimation<Color>(chPrimaryColor),
                                    backgroundColor: Color(0XFFD7DCE0),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  text("Five Hole", textColor:chPrimaryColor, fontSize: textSizeMedium, fontFamily: fontSemibold),
                                  text("90%",  textColor:chPrimaryColor, fontFamily: fontBold, fontSize: textSizeNormal)
                                ],
                              ),
                            ],
                          ),
                        ),
                        text('ATHLETIC', textColor: chPrimaryColor, fontFamily: fontMedium),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Container(
                                  height: 8,
                                  child: LinearProgressIndicator(
                                    value: 0.9, // percent filled
                                    valueColor: AlwaysStoppedAnimation<Color>(chPrimaryColor),
                                    backgroundColor: Color(0XFFD7DCE0),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  text("Speed", textColor:chPrimaryColor, fontSize: textSizeMedium, fontFamily: fontSemibold),
                                  text("90%",  textColor:chPrimaryColor, fontFamily: fontBold, fontSize: textSizeNormal)
                                ],
                              ),
                              SizedBox(height: 4),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Container(
                                  height: 8,
                                  child: LinearProgressIndicator(
                                    value: 0.92, // percent filled
                                    valueColor: AlwaysStoppedAnimation<Color>(chPrimaryColor),
                                    backgroundColor: Color(0XFFD7DCE0),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  text("Agility", textColor:chPrimaryColor, fontSize: textSizeMedium, fontFamily: fontSemibold),
                                  text("92%",  textColor:chPrimaryColor, fontFamily: fontBold, fontSize: textSizeNormal)
                                ],
                              ),
                              SizedBox(height: 4),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Container(
                                  height: 8,
                                  child: LinearProgressIndicator(
                                    value: 0.85, // percent filled
                                    valueColor: AlwaysStoppedAnimation<Color>(chPrimaryColor),
                                    backgroundColor: Color(0XFFD7DCE0),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  text("Durability", textColor:chPrimaryColor, fontSize: textSizeMedium, fontFamily: fontSemibold),
                                  text("85%",  textColor:chPrimaryColor, fontFamily: fontBold, fontSize: textSizeNormal)
                                ],
                              ),
                              SizedBox(height: 4),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Container(
                                  height: 8,
                                  child: LinearProgressIndicator(
                                    value: 0.9, // percent filled
                                    valueColor: AlwaysStoppedAnimation<Color>(chPrimaryColor),
                                    backgroundColor: Color(0XFFD7DCE0),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  text("Aggressiveness", textColor:chPrimaryColor, fontSize: textSizeMedium, fontFamily: fontSemibold),
                                  text("90%",  textColor:chPrimaryColor, fontFamily: fontBold, fontSize: textSizeNormal)
                                ],
                              ),
                            ],
                          ),
                        ),
                        text('REFLEXES', textColor: chPrimaryColor, fontFamily: fontMedium),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Container(
                                  height: 8,
                                  child: LinearProgressIndicator(
                                    value: 0.9, // percent filled
                                    valueColor: AlwaysStoppedAnimation<Color>(chPrimaryColor),
                                    backgroundColor: Color(0XFFD7DCE0),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  text("Glove High", textColor:chPrimaryColor, fontSize: textSizeMedium, fontFamily: fontSemibold),
                                  text("90%",  textColor:chPrimaryColor, fontFamily: fontBold, fontSize: textSizeNormal)
                                ],
                              ),
                              SizedBox(height: 4),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Container(
                                  height: 8,
                                  child: LinearProgressIndicator(
                                    value: 0.92, // percent filled
                                    valueColor: AlwaysStoppedAnimation<Color>(chPrimaryColor),
                                    backgroundColor: Color(0XFFD7DCE0),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  text("Glove Low", textColor:chPrimaryColor, fontSize: textSizeMedium, fontFamily: fontSemibold),
                                  text("92%",  textColor:chPrimaryColor, fontFamily: fontBold, fontSize: textSizeNormal)
                                ],
                              ),
                              SizedBox(height: 4),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Container(
                                  height: 8,
                                  child: LinearProgressIndicator(
                                    value: 0.85, // percent filled
                                    valueColor: AlwaysStoppedAnimation<Color>(chPrimaryColor),
                                    backgroundColor: Color(0XFFD7DCE0),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  text("Blocker High", textColor:chPrimaryColor, fontSize: textSizeMedium, fontFamily: fontSemibold),
                                  text("85%",  textColor:chPrimaryColor, fontFamily: fontBold, fontSize: textSizeNormal)
                                ],
                              ),
                              SizedBox(height: 4),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Container(
                                  height: 8,
                                  child: LinearProgressIndicator(
                                    value: 0.9, // percent filled
                                    valueColor: AlwaysStoppedAnimation<Color>(chPrimaryColor),
                                    backgroundColor: Color(0XFFD7DCE0),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  text("Blocker low", textColor:chPrimaryColor, fontSize: textSizeMedium, fontFamily: fontSemibold),
                                  text("90%",  textColor:chPrimaryColor, fontFamily: fontBold, fontSize: textSizeNormal)
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
