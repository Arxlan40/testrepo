import 'package:flutter/material.dart';
import 'package:connect_hockey/main/model/AppModel.dart';
import 'package:connect_hockey/main/screens/CHScreenListing.dart';

Map<String, WidgetBuilder> routes() {
  return <String, WidgetBuilder>{
    CHScreenListing.tag: (context) => CHScreenListing(ProTheme()),
  };
}
