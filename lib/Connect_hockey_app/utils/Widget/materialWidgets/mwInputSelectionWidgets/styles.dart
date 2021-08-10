import 'package:connect_hockey/Connect_hockey_app/utils/CHConstant.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

Widget textPrimary(text, {size = 16, color = whiteColor, aFontFamily = fontRegular}) {
  return Text(text, style: primaryTextStyle(size: size, color: color));
}

Widget textSecondary(text, {size = 16, color = textSecondaryColor, aFontFamily = fontRegular}) {
  return Text(text, style: TextStyle(color: color, fontSize: double.parse(size.toString()).toDouble(), fontFamily: aFontFamily));
}
