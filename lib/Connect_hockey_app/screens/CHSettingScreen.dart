import 'package:connect_hockey/Connect_hockey_app/screens/CHEditAccountScreen.dart';
import 'package:connect_hockey/Connect_hockey_app/screens/CHEditProfileScreen.dart';
import 'package:connect_hockey/Connect_hockey_app/screens/CHLoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:connect_hockey/main/utils/AppWidget.dart';
import 'package:connect_hockey/Connect_hockey_app/utils/CHColors.dart';
import 'package:provider/provider.dart';


import '../../authentication_service.dart';
import 'CHChangePasswordScreen.dart';
import 'CHHomePageScreen.dart';


class SDSettingScreen extends StatefulWidget {
  @override
  _SDSettingScreenState createState() => _SDSettingScreenState();
}

class _SDSettingScreenState extends State<SDSettingScreen> {
  @override
  Widget build(BuildContext context) {
    Widget mOption(var icon, var heading) {
      return Padding(
        padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(icon, color: chIconColor, size: 18),
                  SizedBox(width: 16),
                  Text(heading, style: primaryTextStyle(size: 16, color: chTextPrimaryColor)),
                ],
              ),
            Icon(Icons.keyboard_arrow_right, color: chIconColor)
          ],
        ),
      );
    }

    Widget mDivider() {
      return Container(color: chViewColor, height: 1);
    }

    changeStatusColor(chAppBackground);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              finish(context);
            },
            child: Icon(Icons.arrow_back, color: Colors.black),
          ),
          title: Text('Settings', style: boldTextStyle(size: 20)),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          automaticallyImplyLeading: false,
        ),
        body: Column(
          children: <Widget>[
            InkWell(
            onTap: () {
              CHEditProfileScreen().launch(context);
              },
            child: mOption(Icons.language, "Edit Profile"),
            ),
            mDivider(),
            InkWell(
              onTap: () {
                CHChangePasswordScreen().launch(context);
              },
              child: mOption(Icons.settings, "Change Password"),
            ),
            mDivider(),
            InkWell(
              onTap: () {
                CHLoginScreen().launch(context);
              },
              child: mOption(Icons.notifications_none, "Notification Settings"),
            ),
            mDivider(),
            InkWell(
              onTap: () {
                CHLoginScreen().launch(context);
              },
              child: mOption(Icons.lock_outline, "Privacy and Security"),
            ),
            mDivider(),
            InkWell(
              onTap: () {
                CHLoginScreen().launch(context);
              },
              child: mOption(Icons.help_outline, "Help Center"),
            ),
            mDivider(),
            InkWell(
              onTap: () {
                CHLoginScreen().launch(context);
                context.read<AuthenticationService>().signOut();
              },
              child: mOption(Icons.launch, "Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
