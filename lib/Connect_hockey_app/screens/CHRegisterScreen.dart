import 'package:connect_hockey/Connect_hockey_app/User.dart';
import 'package:connect_hockey/Connect_hockey_app/utils/CHImages.dart';
import 'package:connect_hockey/Connect_hockey_app/utils/CHStrings.dart';
import 'package:connect_hockey/Connect_hockey_app/utils/Widget/CWPickerScreenCountry.dart';
import 'package:connect_hockey/Connect_hockey_app/utils/Widget/materialWidgets/mwInformationDisplayWidgets/MWChipScreen.dart';
import 'package:connect_hockey/integrations/utils/common.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:connect_hockey/Connect_hockey_app/utils/CHColors.dart';
import 'package:connect_hockey/Connect_hockey_app/utils/CHStyle.dart';
import 'package:connect_hockey/main/utils/AppWidget.dart';
import 'package:connect_hockey/Connect_hockey_app/screens/CHLoginScreen.dart';

import 'package:flutter_svg/svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

import '../../authentication_service.dart';
import 'CHHomePageScreen.dart';

class CHRegisterScreen extends StatefulWidget {
  @override
  _CHRegisterScreenState createState() => _CHRegisterScreenState();
}

class _CHRegisterScreenState extends State<CHRegisterScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _registrationCodeFormKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    changeStatusColor(chAppBackground);
    var width = MediaQuery.of(context).size.width;
    String initValue = "Select your Birth Date";
    bool isDateSelected = false;
    DateTime birthDate; // instance of DateTime
    String birthDateInString;
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: chAppBackground,
        body: loading
            ? Center(child: CircularProgressIndicator())
            : Center(
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(left: 25, right: 25),
                    child: Form(
                      key: _registrationCodeFormKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: 5,),
                          Container(
                            alignment: Alignment.center,
                            child: Image(
                              image: AssetImage(
                                  'images/Connect_hockey/logo_connect_hockey_flutter_color.png'),
                              height: size.height * 0.15,
                              width: size.width,
                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text('Connect.Hockey',
                              style: boldTextStyle(size: 25)),
                          SizedBox(height: 10),
                          Text('Create your account',
                              style: secondaryTextStyle(size: 16)),
                          SizedBox(height: 10),
                          Container(
                            width: size.width,
                            decoration: boxDecorations(showShadow: true),
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  validator: EmailValidator(
                                      errorText: 'Please enter a valid email'),
                                  controller: emailController,
                                  cursorColor:
                                      chTextSecondaryColor.withOpacity(0.2),
                                  cursorWidth: 1,
                                  autocorrect: true,
                                  autofocus: false,
                                  decoration: InputDecoration(
                                    hintText: 'Email',
                                    hintStyle: secondaryTextStyle(
                                        color: chTextSecondaryColor
                                            .withOpacity(0.6)),
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    contentPadding: EdgeInsets.only(
                                        left: 16,
                                        bottom: 16,
                                        top: 16,
                                        right: 16),
                                  ),
                                ),
                                Divider(height: 1, thickness: 1),
                                Row(
                                  children: <Widget>[
                                    Flexible(
                                      child: TextFormField(
                                        controller: passwordController,
                                        obscureText: true,
                                        validator: passwordValidator,
                                        cursorColor: chTextSecondaryColor
                                            .withOpacity(0.2),
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
                                              left: 16,
                                              bottom: 16,
                                              top: 16,
                                              right: 16),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(height: 1, thickness: 1),
                                Row(
                                  children: <Widget>[
                                    Flexible(
                                      child: TextFormField(
                                        validator: RequiredValidator(
                                            errorText:
                                                ' Please enter first name'),
                                        cursorColor: chTextSecondaryColor
                                            .withOpacity(0.2),
                                        cursorWidth: 1,
                                        controller: firstNameController,
                                        decoration: InputDecoration(
                                          hintText: 'First Name',
                                          hintStyle: secondaryTextStyle(
                                              color: chTextSecondaryColor
                                                  .withOpacity(0.6)),
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                          contentPadding: EdgeInsets.only(
                                              left: 16,
                                              bottom: 16,
                                              top: 16,
                                              right: 16),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(height: 1, thickness: 1),
                                Row(
                                  children: <Widget>[
                                    Flexible(
                                      child: TextFormField(
                                        validator: RequiredValidator(
                                            errorText:
                                                ' Please enter last name'),
                                        controller: lastNameController,
                                        cursorColor: chTextSecondaryColor
                                            .withOpacity(0.2),
                                        cursorWidth: 1,
                                        decoration: InputDecoration(
                                          hintText: 'Last Name',
                                          hintStyle: secondaryTextStyle(
                                              color: chTextSecondaryColor
                                                  .withOpacity(0.6)),
                                          border: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          errorBorder: InputBorder.none,
                                          disabledBorder: InputBorder.none,
                                          contentPadding: EdgeInsets.only(
                                              left: 16,
                                              bottom: 16,
                                              top: 16,
                                              right: 16),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(height: 1, thickness: 1),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    SizedBox(
                                      width: 250.0,
                                      height: 110.0,
                                      child: MWChipScreen(),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 15),
                          SDButton(
                              textContent: "SIGN UP",
                              onPressed: () async {
                                print(selectedProgrammingList);

                                if (_registrationCodeFormKey.currentState
                                        .validate() &&
                                    selectedProgrammingList.length != 0) {
                                  setState(() {
                                    loading = true;
                                  });
                                  try {
                                  await context
                                      .read<AuthenticationService>()
                                      .signUp(
                                          email: emailController.text.trim(),
                                          password:
                                              passwordController.text.trim());
                                  await UserFirestore().adduser(
                                      firstNameController.text,
                                      lastNameController.text,
                                      selectedProgrammingList,
                                      emailController.text);

                                  selectedProgrammingList.clear();
                                  CHHomePageScreen().launch(context);
                                  setState(() {
                                    loading = false;
                                  });
                                  } catch (e) {
                                    setState(() {
                                      loading = false;
                                    });
                                    _scaffoldKey.currentState.showSnackBar(
                                        new SnackBar(content: new Text("$e")));
                                  }
                                } else if (selectedProgrammingList.length ==
                                    0) {
                                  setState(() {
                                    loading = false;
                                  });
                                  _scaffoldKey.currentState.showSnackBar(
                                      new SnackBar(
                                          content: new Text(
                                              "Select at least one position")));
                                }
                              }),
                          SizedBox(height: 5),
                          Container(
                              alignment: Alignment.center,
                              child: text(t6_lbl_or_with,
                                  textColor: chPrimaryColor)),
                          SizedBox(height: 6),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: chform_google),
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
                                    shape: BoxShape.circle,
                                    color: chform_facebook),
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
              ),
        persistentFooterButtons: <Widget>[
          Container(
            height: 35,
            padding: EdgeInsets.only(left: 15, right: 15),
            width: MediaQuery.of(context).copyWith().size.width,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Already have an account?', style: secondaryTextStyle()),
                FlatButton(
                  onPressed: () {
                    CHLoginScreen().launch(context);
                  },
                  child: Text('SIGN IN',
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
