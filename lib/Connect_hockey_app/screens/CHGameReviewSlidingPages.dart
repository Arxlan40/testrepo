import 'package:connect_hockey/Connect_hockey_app/screens/CHHomePageScreen.dart';
import 'package:connect_hockey/Connect_hockey_app/utils/CHColors.dart';
import 'package:connect_hockey/Connect_hockey_app/utils/CHStyle.dart';
import 'package:connect_hockey/Connect_hockey_app/utils/CHStyleGameReview.dart';
import 'package:connect_hockey/Connect_hockey_app/utils/Widget/materialWidgets/mwButtonWidgets/MWDropDownButtonScreen.dart';
import 'package:connect_hockey/Connect_hockey_app/utils/Widget/materialWidgets/mwInputSelectionWidgets/MWSwitchScreenBehindTheNet.dart';
import 'package:connect_hockey/Connect_hockey_app/utils/Widget/materialWidgets/mwInputSelectionWidgets/MWSwitchScreenBreakaway.dart';
import 'package:connect_hockey/Connect_hockey_app/utils/Widget/materialWidgets/mwInputSelectionWidgets/MWSwitchScreenCommunication.dart';
import 'package:connect_hockey/Connect_hockey_app/utils/Widget/materialWidgets/mwInputSelectionWidgets/MWSwitchScreenFacingShot.dart';
import 'package:connect_hockey/Connect_hockey_app/utils/Widget/materialWidgets/mwInputSelectionWidgets/MWSwitchScreenOpponentPass.dart';
import 'package:connect_hockey/Connect_hockey_app/utils/Widget/materialWidgets/mwInputSelectionWidgets/MWSwitchScreenRebound.dart';
import 'package:connect_hockey/Connect_hockey_app/utils/Widget/materialWidgets/mwInputSelectionWidgets/MWSwitchScreenScreen.dart';
import 'package:connect_hockey/Connect_hockey_app/utils/Widget/materialWidgets/mwInputSelectionWidgets/picker_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class GameReviewSlidingPages extends StatefulWidget {
  @override
  _GameReviewSlidingPagesState createState() => _GameReviewSlidingPagesState();
}

class _GameReviewSlidingPagesState extends State<GameReviewSlidingPages> {
  PageController pageController = PageController(initialPage: 0);
  int pageNumber = 0;

  List<Widget> buildDotIndicator() {
    List<Widget> list = [];
    for (int i = 0; i <= 3; i++) {
      list.add(i == pageNumber ? indicator(isActive: true) : indicator(isActive: false));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Game Review',
              style: boldTextStyle(color: Colors.white)),
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: chPrimaryColor,
        ),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Container(
              height: double.infinity,
              child: PageView(
                onPageChanged: (index) => setState(() {
                  pageNumber = index;
                }),
                controller: pageController,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 16, bottom: 70, right: 16),
                    child: SingleChildScrollView(
                      padding: EdgeInsets.only(bottom: 60),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          applogo(),
                          Text("Game Details", style: boldTextStyle(size: 24, letterSpacing: 0.2)),
                          SizedBox(height: 24),
                          Container(
                            width: size.width,
                            decoration: boxDecorations(showShadow: true),
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  width: 400.0,
                                  height: 220.0,
                                  child:
                                  PickerScreen(),
                                ),
                                Divider(height: 1, thickness: 1),
                                SizedBox(
                                  width: 400.0,
                                  height: 240.0,
                                  child:
                                  MWDropDownButtonScreen(),
                                ),
                                Divider(height: 1, thickness: 1),
                                Row(
                                  children: <Widget>[
                                    Flexible(
                                      child: TextField(
                                        obscureText: true,
                                        cursorColor: chTextSecondaryColor.withOpacity(0.2),
                                        cursorWidth: 1,
                                        decoration: InputDecoration(
                                          hintText: 'W3-2Levis2020/05/07',
                                          hintStyle: secondaryTextStyle(color: chTextSecondaryColor.withOpacity(0.6)),
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                          contentPadding: EdgeInsets.only(left: 16, bottom: 16, top: 16, right: 16),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(height: 1, thickness: 1),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 16, bottom: 70, right: 16),
                    child: SingleChildScrollView(
                      padding: EdgeInsets.only(bottom: 60),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          applogo(),
                          Text("Goal #${pageNumber}", style: boldTextStyle(size: 24, letterSpacing: 0.2)),
                          SizedBox(
                            width: 400.0,
                            height: 70.0,
                            child:
                            MWSwitchScreenBehindTheNet(),
                          ),
                          SizedBox(
                            width: 400.0,
                            height: 70.0,
                            child:
                            MWSwitchScreenCommunication(),
                          ),
                          SizedBox(
                            width: 400.0,
                            height: 70.0,
                            child:
                            MWSwitchScreenOpponentPass(),
                          ),
                          SizedBox(
                            width: 400.0,
                            height: 70.0,
                            child:
                            MWSwitchScreenBreakaway(),
                          ),
                          SizedBox(
                            width: 400.0,
                            height: 70.0,
                            child:
                            MWSwitchScreenFacingShot(),
                          ),
                          SizedBox(
                            width: 400.0,
                            height: 70.0,
                            child:
                            MWSwitchScreenRebound(),
                          ),
                          SizedBox(
                            width: 400.0,
                            height: 70.0,
                            child:
                            MWSwitchScreenScreen(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 16, bottom: 70, right: 16, top: size.height * 0.1),
                    child: SingleChildScrollView(
                      padding: EdgeInsets.only(bottom: 60),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          applogo(),
                          SizedBox(height: 24),
                          Text("Address", style: boldTextStyle(size: 24, letterSpacing: 0.2)),
                          SizedBox(height: 24),
                          textField(title: 'Main address', image: Icons.home),
                          SizedBox(height: 16),
                          textField(title: 'Second address', image: Icons.home),
                          SizedBox(height: 16),
                          textField(title: 'State', image: Icons.business),
                          SizedBox(height: 16),
                          textField(title: 'Post Code', image: Icons.pin_drop),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 16, bottom: 100, right: 16, top: size.height * 0.05),
                    child: SingleChildScrollView(
                      padding: EdgeInsets.only(bottom: 60),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          applogo(),
                          SizedBox(height: 24),
                          Text("Pick a way to Verify", style: boldTextStyle(size: 24, letterSpacing: 0.2)),
                          SizedBox(height: 24),
                          VerifyCards(
                            size: size,
                            title: 'Video call',
                            subtitle: 'We will call you shortly',
                            image: 'images/orapay/opvideocall.png',
                            color: Color(0xFFFF6E18),
                          ),
                          SizedBox(height: 20),
                          VerifyCards(
                            size: size,
                            title: 'Outlets',
                            subtitle: 'You came to our outlates',
                            image: 'images/orapay/opoutlets.png',
                            color: Color(0xFF343EDB),
                          ),
                          SizedBox(height: 20),
                          VerifyCards(
                            size: size,
                            title: 'Agents',
                            subtitle: 'Our agents will come to you',
                            image: 'images/orapay/opagent.png',
                            color: Color(0xFF343EDB),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 16, right: 16, bottom: 20),
              padding: EdgeInsets.only(left: 20),
              width: size.width,
              height: 50,
              decoration: BoxDecoration(color: chPrimaryColor, borderRadius: BorderRadius.circular(15.0)),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 15,
                    child: Text('${pageNumber}', style: primaryTextStyle(size: 16, color: chPrimaryColor)),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: buildDotIndicator(),
                  ),
                  pageNumber != 3
                      ? FlatButton(
                          onPressed: () {
                            pageController.nextPage(duration: Duration(milliseconds: 250), curve: Curves.fastOutSlowIn);
                          },
                          child: Text('Next', style: primaryTextStyle(size: 16, color: chAppBackground)),
                        )
                      : FlatButton(
                          onPressed: () {
                            finish(context);
                            Navigator.push(context, MaterialPageRoute(builder: (context) => CHHomePageScreen()));
                          },
                          child: Text('Finish', style: primaryTextStyle(size: 16, color: chAppBackground)),
                        )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
