import 'package:connect_hockey/authentication_service.dart';
import 'package:connect_hockey/integrations/utils/common.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:connect_hockey/Connect_hockey_app/utils/CHColors.dart';
import 'package:connect_hockey/Connect_hockey_app/utils/Widget/CHWidgets.dart';
import 'package:provider/provider.dart';

class CHChangePasswordScreen extends StatefulWidget {
  @override
  CHChangePasswordScreenState createState() => CHChangePasswordScreenState();
}

class CHChangePasswordScreenState extends State<CHChangePasswordScreen> {
  TextEditingController currentPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  FocusNode currentPasswordFocus = FocusNode();
  FocusNode newPasswordFocus = FocusNode();
  FocusNode confirmPasswordFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  Future<bool> validateCurrentPassword(String password) async {
    return await context
        .read<AuthenticationService>()
        .validatePassword(password);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: appBarWidget('Change your Password',
          center: true, titleTextStyle: boldTextStyle()),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              16.height,
              AppTextField(
                controller: currentPassword,
                textStyle: primaryTextStyle(color: black),
                focus: currentPasswordFocus,
                nextFocus: newPasswordFocus,
                textFieldType: TextFieldType.PASSWORD,
                cursorColor: white,
                decoration: buildInputDecoration('Your current password'),
              ),
              16.height,
              AppTextField(
                validator: passwordValidator,
                controller: newPassword,
                textStyle: primaryTextStyle(color: black),
                focus: newPasswordFocus,
                nextFocus: confirmPasswordFocus,
                textFieldType: TextFieldType.PASSWORD,
                cursorColor: white,
                decoration: buildInputDecoration('Create a new password'),
              ),
              16.height,
              AppTextField(
                validator: passwordValidator,
                controller: confirmPassword,
                textStyle: primaryTextStyle(color: black),
                focus: confirmPasswordFocus,
                textFieldType: TextFieldType.PASSWORD,
                cursorColor: white,
                decoration: buildInputDecoration('Confirm password'),
              ),
              16.height,
              AppButton(
                text: 'Done',
                textStyle: boldTextStyle(color: white),
                width: context.width(),
                color: chPrimaryColor,
                onTap: () async {
                  try {
                    if (_formKey.currentState.validate()) {
                      bool checkCurrentPasswordValid =
                          await validateCurrentPassword(confirmPassword.text);
                      if (checkCurrentPasswordValid) {
                        if (confirmPassword.text == newPassword.text) {
                          context
                              .read<AuthenticationService>()
                              .updatePassword(confirmPassword.text);

                          // finish(context);
                        } else {
                          _scaffoldKey.currentState.showSnackBar(new SnackBar(
                              content: new Text("Your password didn't match")));
                        }
                      } else if (checkCurrentPasswordValid == false) {
                        _scaffoldKey.currentState.showSnackBar(new SnackBar(
                            content:
                                new Text("Your current password is wrong")));
                      }
                    }
                  } catch (e) {
                    print(e);
                    _scaffoldKey.currentState
                        .showSnackBar(new SnackBar(content: new Text("Error")));
                  }
                },
              )
            ],
          ).paddingOnly(left: 16, right: 16),
        ),
      ),
    );
  }
}
