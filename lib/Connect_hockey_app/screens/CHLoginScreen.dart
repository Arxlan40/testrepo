import 'package:connect_hockey/Connect_hockey_app/utils/CHImages.dart';
import 'package:connect_hockey/Connect_hockey_app/utils/CHStrings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:connect_hockey/main/utils/AppWidget.dart';
import 'package:connect_hockey/Connect_hockey_app/utils/CHColors.dart';
import 'package:connect_hockey/Connect_hockey_app/utils/CHStyle.dart';
import 'package:connect_hockey/Connect_hockey_app/screens/CHForgotPwdScreen.dart';
import 'package:connect_hockey/Connect_hockey_app/screens/CHRegisterScreen.dart';
import 'package:connect_hockey/Connect_hockey_app/screens/CHHomePageScreen.dart';
import 'package:flutter_svg/svg.dart';
import '../../authentication_service.dart';
import 'package:provider/provider.dart';

class CHLoginScreen extends StatefulWidget {
  @override
  _CHLoginScreenState createState() => _CHLoginScreenState();
}

class _CHLoginScreenState extends State<CHLoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    changeStatusColor(chAppBackground);
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: chAppBackground,
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(left: 25, right: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    child: Image(
                      image: AssetImage(
                          'images/Connect_hockey/logo_connect_hockey_flutter_color.png'),
                      height: size.height * 0.2,
                      width: size.width,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: 25),
                  Text('Connect.Hockey', style: boldTextStyle(size: 25)),
                  SizedBox(height: 25),
                  Text('Sign in to your account',
                      style: secondaryTextStyle(size: 16)),
                  SizedBox(height: 25),
                  Container(
                    width: size.width,
                    decoration: boxDecorations(showShadow: true),
                    child: Column(
                      children: <Widget>[
                        TextField(
                          controller: emailController,
                          cursorColor: chTextSecondaryColor.withOpacity(0.2),
                          cursorWidth: 1,
                          autocorrect: true,
                          autofocus: false,
                          decoration: InputDecoration(
                            hintText: 'Email',
                            hintStyle: secondaryTextStyle(
                                color: chTextSecondaryColor.withOpacity(0.6)),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.only(
                                left: 16, bottom: 16, top: 16, right: 16),
                          ),
                        ),
                        Divider(height: 1, thickness: 1),
                        Row(
                          children: <Widget>[
                            Flexible(
                              child: TextField(
                                controller: passwordController,
                                obscureText: true,
                                cursorColor:
                                    chTextSecondaryColor.withOpacity(0.2),
                                cursorWidth: 1,
                                decoration: InputDecoration(
                                  hintText: 'Password',
                                  hintStyle: secondaryTextStyle(
                                      color: chTextSecondaryColor
                                          .withOpacity(0.6)),
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  disabledBorder: InputBorder.none,
                                  contentPadding: EdgeInsets.only(
                                      left: 16, bottom: 16, top: 16, right: 16),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                CHForgotPwdScreen().launch(context);
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 16),
                                child: Text('Forgot?',
                                    style: boldTextStyle(
                                        size: 14, color: chPrimaryColor)),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 45),
                  SDButton(
                    textContent: "SIGN IN",
                    onPressed: () {
                      CHHomePageScreen().launch(context);
                      context.read<AuthenticationService>().signIn(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim());
                    },
                  ),
                  SizedBox(height: 20),
                  Container(
                      alignment: Alignment.center,
                      child: text(t6_lbl_or_with, textColor: chPrimaryColor)),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: chform_google),
                        width: width / 7.5,
                        height: width / 7.5,
                        padding: EdgeInsets.all(width / 28),
                        child: SvgPicture.asset(
                          t6_google_fill,
                          color: Colors.white,
                        ),
                      ).onTap(() async {
                        await context
                            .read<AuthenticationService>()
                            .signInWithGoogle();
                      }),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: chform_facebook),
                        width: width / 7.5,
                        height: width / 7.5,
                        padding: EdgeInsets.all(width / 28),
                        child: SvgPicture.asset(
                          t6_facebook_fill,
                          color: Colors.white,
                        ).onTap(() async {
                          await context
                              .read<AuthenticationService>()
                              .signInWithFacebook();
                        }),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        persistentFooterButtons: <Widget>[
          Container(
            height: 40,
            padding: EdgeInsets.only(left: 15, right: 15),
            width: MediaQuery.of(context).copyWith().size.width,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Don\'t have an account?', style: secondaryTextStyle()),
                FlatButton(
                  onPressed: () {
                    CHRegisterScreen().launch(context);
                  },
                  child: Text('REGISTER',
                      style: boldTextStyle(size: 14, color: chPrimaryColor)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
