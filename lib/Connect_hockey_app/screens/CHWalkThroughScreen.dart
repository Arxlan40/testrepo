import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:connect_hockey/Connect_hockey_app/utils/CHColors.dart';
import 'package:connect_hockey/Connect_hockey_app/screens/CHLoginScreen.dart';

class CHWalkThroughScreen extends StatefulWidget {
  @override
  _CHWalkThroughScreenState createState() => _CHWalkThroughScreenState();
}

class _CHWalkThroughScreenState extends State<CHWalkThroughScreen> {
  bool isActive;
  PageController pageController = PageController(initialPage: 0);
  int pageChanged = 0;

  List<Widget> buildDotIndicator() {
    List<Widget> list = [];
    for (int i = 0; i <= 2; i++) {
      list.add(i == pageChanged ? sDDotIndicator(isActive: true) : sDDotIndicator(isActive: false));
    }

    return list;
  }

  Widget sDDotIndicator({bool isActive}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      height: isActive ? 8.0 : 6.0,
      width: isActive ? 8.0 : 6.0,
      decoration: BoxDecoration(color: isActive ? chPrimaryColor : Color(0xFF7E869B), borderRadius: BorderRadius.all(Radius.circular(50))),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              height: size.height * 0.7,
              child: PageView(
                onPageChanged: (index) {
                  setState(() {
                    pageChanged = index;
                  });
                },
                controller: pageController,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.1, left: 10, right: 10),
                        child: Image(
                          image: AssetImage('images/Connect_hockey/logo_connect_hockey_flutter_color.png'),
                          height: size.height * 0.3,
                          width: size.width,
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(height: 4),
                      Center(
                        child: Padding(padding: EdgeInsets.only(top: 40), child: Text('Personalized \nExercices', textAlign: TextAlign.center, style: boldTextStyle(size: 25))),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.1, left: 10, right: 10),
                        child: Image(
                          image: AssetImage('images/Connect_hockey/logo_connect_hockey_flutter_color.png'),
                          height: size.height * 0.3,
                          width: size.width,
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(height: 4),
                      Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 40),
                          child: Text('Personalized \n Statistics', textAlign: TextAlign.center, style: boldTextStyle(size: 25)),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: size.height * 0.1, left: 10, right: 10),
                        child: Image(
                          image: AssetImage('images/Connect_hockey/logo_connect_hockey_flutter_color.png'),
                          height: size.height * 0.3,
                          width: size.width,
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(height: 4),
                      Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 40),
                          child: Text('Share it with your \nFriends and Coaches', textAlign: TextAlign.center, style: boldTextStyle(size: 25)),
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Padding(
                        padding: EdgeInsets.only(left: 40, right: 40),
                        child: Text('Access all your games \nin your Career Feed', textAlign: TextAlign.justify, style: secondaryTextStyle(size: 16)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 40,
              child: Row(mainAxisAlignment: MainAxisAlignment.center, children: buildDotIndicator()),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              width: size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  pageChanged != 2
                      ? InkWell(
                          child: CircleAvatar(
                            radius: 25,
                            child: Icon(Icons.arrow_forward, color: Colors.white),
                            backgroundColor: chPrimaryColor,
                          ),
                          onTap: () {
                            pageController.nextPage(duration: Duration(milliseconds: 250), curve: Curves.easeInOut);
                          },
                        )
                      : Container(
                          margin: EdgeInsets.only(bottom: 0, left: 20, right: 20),
                          width: size.width,
                          height: 50,
                          child: RaisedButton(
                            color: chPrimaryColor,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                            elevation: 1,
                            onPressed: () async{
                              SharedPreferences prefs = await SharedPreferences.getInstance();
                              await prefs.setBool("walk", true);

                              finish(context);
                              CHLoginScreen().launch(context);
                            },
                            child: Text(
                              "GET STARTED",
                              textAlign: TextAlign.center,
                              style: boldTextStyle(size: 16, color: Colors.white, letterSpacing: 2),
                            ),
                          ),
                        ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
