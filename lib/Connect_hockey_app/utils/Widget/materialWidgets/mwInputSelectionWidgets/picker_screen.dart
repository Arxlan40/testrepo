import 'package:connect_hockey/Connect_hockey_app/utils/CHColors.dart';
import 'package:connect_hockey/Connect_hockey_app/utils/CHConstant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:connect_hockey/integrations/utils/common.dart';
import 'package:connect_hockey/main/utils/AppWidget.dart';
import 'package:connect_hockey/Connect_hockey_app/utils/Widget/materialWidgets/mwInputSelectionWidgets/styles.dart';
import 'package:connect_hockey/main.dart';
import 'package:connect_hockey/main/utils/AppColors.dart';
import 'package:connect_hockey/main/utils/AppWidget.dart' as aw;



class PickerScreen extends StatefulWidget {
  static String tag = '/PickerScreen';

  @override
  PickerScreenState createState() => PickerScreenState();
}

class PickerScreenState extends State<PickerScreen> {
  var mSelectedDate = '';
  DateTime selectedDate = DateTime.now();
  Color pickerColor = appStore.textPrimaryColor;
  var mSelectedColor = '';

  var mSelectedAddress = '';

  Future<Null> selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(selectedDate.year, selectedDate.month, selectedDate.day),
        lastDate: DateTime(2101),
        builder: (BuildContext context, Widget child) {
          return aw.CustomTheme(child: child);
        });
    setState(() {
      if (picked != null && picked != selectedDate) selectedDate = picked;
      mSelectedDate = DateFormat.yMMMd().format(selectedDate.toLocal());
    });
  }

  Future pickColor(BuildContext context) async {
    await showDialog(
      context: context,
      builder:(_)=> AlertDialog(
        content: SingleChildScrollView(
          child: ColorPicker(
            pickerColor: pickerColor,
            onColorChanged: changeColor,
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: text("Pick"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  void changeColor(Color color) {
    setState(() {
      pickerColor = color;
      mSelectedColor = intToHex(pickerColor.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(appColorPrimary);

    getLocation() async {
      var position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      var coordinates = Coordinates(position.latitude, position.longitude);
      var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
      var first = addresses.first;
      print("$addresses : ${first.addressLine}");
      setState(() {
        mSelectedAddress = first.addressLine;
      });
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 16, right: 16),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(border: Border.all(color: Theme.of(context).dividerColor, width: 0.5), borderRadius: BorderRadius.all(Radius.circular(10))),
                padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
                child: text(mSelectedAddress.isEmpty ? "Game Location" : mSelectedAddress,
                    textColor: mSelectedAddress.isEmpty ? appStore.textSecondaryColor : appStore.textPrimaryColor, maxLine: 5),
              ),
              SizedBox(
                height: 16,
              ),
              GestureDetector(
                onTap: () {
                  getLocation();
                },
                child: Container(
                    margin: EdgeInsets.only(left: 16, right: 16),
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
                    decoration: BoxDecoration(
                        color: chPrimaryColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        )),
                    child: textPrimary('Pick Your Current Location', aFontFamily: fontMedium)),
              ),
              SizedBox(height: 10),
              Divider(height: 1, thickness: 1),
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.only(left: 16, right: 16),
                decoration: BoxDecoration(border: Border.all(color: Theme.of(context).dividerColor, width: 0.5), borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
                        child: text(mSelectedDate.isEmpty ? "Game date" : mSelectedDate,
                            textColor: mSelectedDate.isEmpty ? appStore.textSecondaryColor : appStore.textPrimaryColor)),
                    GestureDetector(
                      onTap: () {
                        selectDate(context);
                      },
                      child: Container(
                          padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
                          decoration: BoxDecoration(color: chPrimaryColor, borderRadius: BorderRadius.only(topRight: Radius.circular(10), bottomRight: Radius.circular(10))),
                          child: textPrimary('Pick Date', aFontFamily: fontMedium)),
                    )
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
