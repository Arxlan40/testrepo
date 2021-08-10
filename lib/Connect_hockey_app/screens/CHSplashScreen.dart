import 'dart:async';
import 'package:connect_hockey/Connect_hockey_app/screens/CHLoginScreen.dart';
import 'package:connect_hockey/Connect_hockey_app/utils/CHColors.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:connect_hockey/Connect_hockey_app/screens/CHWalkThroughScreen.dart';

class CHSplashScreen extends StatefulWidget {
  static String tag = '/CHSplashScreen';

  @override
  _CHSplashScreenState createState() => _CHSplashScreenState();
}

class _CHSplashScreenState extends State<CHSplashScreen>
    with SingleTickerProviderStateMixin {
  startTime() async {
    var _duration = Duration(seconds: 3);
    return Timer(_duration, navigationPage);
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  void navigationPage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool walk = prefs.getBool('walk');
    print(walk);
    if (walk == false || walk == null) {
      CHWalkThroughScreen().launch(context);
    } else {
      CHLoginScreen().launch(context);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: chPrimaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Image.asset(
                'images/Connect_hockey/logo_connect_hockey_flutter-accueil.png',
                height: 105),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: Text("Connect.Hockey",
                  style: secondaryTextStyle(size: 25, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
