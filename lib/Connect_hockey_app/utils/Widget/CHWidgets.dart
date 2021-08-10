import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:image_picker/image_picker.dart';

import '../CHColors.dart';

Widget createBasicListTile({IconData icon, @required String text, Function onTap}) {
  return ListTile(
    contentPadding: EdgeInsets.all(0),
    visualDensity: VisualDensity(horizontal: -4, vertical: -2),
    onTap: onTap as void Function(),
    title: Text(text, style: TextStyle(fontSize: 16)),
    leading: Icon(icon, color: Colors.black, size: 22),
  );
}


InputDecoration buildInputDecoration(String labelText) {
  return InputDecoration(
    contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
    labelText: labelText,
    labelStyle: TextStyle(color: Colors.black),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.zero,
      borderSide: BorderSide(color: Colors.black, width: 1.5),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.zero,
      borderSide: BorderSide(color: Colors.red, width: 1.5),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.zero,
      borderSide: BorderSide(color: Colors.red, width: 1.5),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(width: 1.5, color: CSGreyColor),
      borderRadius: BorderRadius.zero,
    ),
  );
}

Widget subscribeAppButton(BuildContext context, {String btnText, Color bgColor, double width, double shape, Function onPress, Color txtColor, double height}) {
  return RaisedButton(
    color: bgColor,
    elevation: 0.0,
    padding: EdgeInsets.all(14),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(shape)),
    onPressed: () {
      if (onPress != null) {
        onPress?.call();
      }
    },
    child: Text(btnText, style: boldTextStyle(color: txtColor, size: 14)),
  ).withWidth(width).withHeight(height);
}