import 'package:connect_hockey/Connect_hockey_app/models/CHTrainingModels.dart';
import 'package:connect_hockey/Connect_hockey_app/screens/CHViewAllLivevideoScreen.dart';
import 'package:connect_hockey/Connect_hockey_app/utils/CHColors.dart';
import 'package:connect_hockey/Connect_hockey_app/utils/CHConstant.dart';
import 'package:connect_hockey/Connect_hockey_app/utils/CHDataGenerator.dart';
import 'package:connect_hockey/integrations/screens/flutterCalender/CalenderHomePage.dart';
import 'package:connect_hockey/Connect_hockey_app/utils/Widget/materialWidgets/mwInformationDisplayWidgets/MWChipScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:connect_hockey/main/utils/AppWidget.dart';
import 'package:connect_hockey/Connect_hockey_app/utils/Widget/CHTrainingSliderWidget.dart';
import '../../main.dart';

//dashboard2, dashboard3, listing2, listing 6


class CHTraining extends StatefulWidget {
  static String tag = '/CHTraining';

  @override
  CHTrainingState createState() => CHTrainingState();
}

class CHTrainingState extends State<CHTraining> {
  DateTime startDate = DateTime.now().subtract(Duration(days: 2));
  DateTime endDate = DateTime.now().add(Duration(days: 30));
  DateTime selectedDate = DateTime.now().subtract(Duration(days: 2));
  List<DateTime> markedDates = [DateTime.now().subtract(Duration(days: 1)), DateTime.now().subtract(Duration(days: 2)), DateTime.now().add(Duration(days: 4))];
  int selectedPos = 1;
  List<CHSlider> mSliderList;
  List<CHLogModel> mActivity;

  onSelect(data) {
    print("Selected Date -> $data");
  }

  _monthNameWidget(monthName) {
    return Container(
      child: Text(
        monthName,
        style: TextStyle(
          fontSize: 16,
          color: Colors.transparent,
        ),
      ),
      padding: EdgeInsets.only(top: 8, bottom: 0),
    );
  }

  getMarkedIndicatorWidget() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        margin: EdgeInsets.only(left: 1, right: 1),
        width: 7,
        height: 7,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.red),
      ),
      Container(
        width: 7,
        height: 7,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
      )
    ]);
  }

  dateTileBuilder(date, selectedDate, rowIndex, dayName, isDateMarked, isDateOutOfRange) {
    bool isSelectedDate = date.compareTo(selectedDate) == 0;
    TextStyle normalStyle = TextStyle(fontSize: 16, color: chTextSecondaryColor);
    TextStyle selectedStyle = TextStyle(fontSize: 17, fontWeight: FontWeight.w800, color: Colors.white);
    TextStyle dayNameStyle = TextStyle(fontSize: 14.5, color: chPrimaryColor);

    List<Widget> _children = [
      Text(dayName, style: dayNameStyle),
      Text(date.day.toString(), style: !isSelectedDate ? normalStyle : selectedStyle),
    ];

    if (isDateMarked == true) {
      _children.add(getMarkedIndicatorWidget());
    }

    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 8, left: 5, right: 5, bottom: 5),
      decoration: BoxDecoration(
        color: !isSelectedDate ? Colors.transparent : chViewColor,
        borderRadius: BorderRadius.all(Radius.circular(60)),
      ),
      child: Column(
        children: _children,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    selectedPos = 1;
    mSliderList = getSliders();
    mActivity = getData();
  }

  var isSelected = 1;

  Widget tabItem(var pos, var icon, var name) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = pos;
        });
      },
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Container(
          alignment: Alignment.center,
          decoration: isSelected == pos ? BoxDecoration(shape: BoxShape.rectangle, color: chPrimaryColor, borderRadius: BorderRadius.circular(8)) : BoxDecoration(),
          child: Padding(
            padding: EdgeInsets.all(6.0),
            child: Column(
              children: <Widget>[
                SvgPicture.asset(
                  icon,
                  width: 20,
                  height: 20,
                  color: isSelected == pos ? Colors.white : chTextSecondaryColor,
                ),
                text(name, textColor: isSelected == pos ? Colors.white : chTextSecondaryColor, fontSize: textSizeSmall)
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text('Training',
            style: boldTextStyle(color: Colors.white)),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: chPrimaryColor,
      ),
      backgroundColor: appStore.scaffoldBackground,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    color: appStore.scaffoldBackground,
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              text('Hi Anthony', textColor: appStore.textPrimaryColor),
                              Icon(Icons.notifications_active, color: appStore.iconColor),
                            ],
                          ),
                          text('What are you doing today?', textColor: appStore.textPrimaryColor, fontFamily: fontMedium)
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 16),
                    child: text('Your Weekly Program', textColor: chTextPrimaryColor, fontFamily: fontMedium),
                  ),
                  SizedBox(
                    width: 400.0,
                    height: 300.0,
                    child:
                    CalenderHomePage(),
                  ),
                  SizedBox(height: 20),
                  Container(
                    margin: EdgeInsets.only(left: 16, right: 16),
                    child: text('Scheduled Exercices', textColor: chTextPrimaryColor, fontFamily: fontMedium),
                  ),
                  SizedBox(height: 16),
                  CHTrainingSliderWidget(mSliderList),
                  SizedBox(height: 16),
                  SizedBox(
                    width: 400.0,
                    height: 800.0,
                    child:
                    SdViewAllLiveVideoScreen(),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 16),
                    child: text('All Exercices', textColor: chTextPrimaryColor, fontFamily: fontMedium),
                  ),
                  SizedBox(height: 16),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.3,
                    child: ListView.builder(
                        padding: EdgeInsets.all(8),
                        scrollDirection: Axis.horizontal,
                        itemCount: mActivity.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return T6Activity(mActivity[index], index);
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class T6Activity extends StatelessWidget {
  CHLogModel model;

  T6Activity(CHLogModel model, int pos) {
    this.model = model;
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.only(left: 16, right: 4, bottom: 6),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            decoration: boxDecoration(radius: 10, showShadow: true, bgColor: appStore.scaffoldBackground),
            child: Padding(
              padding: EdgeInsets.all(12),
              child: SvgPicture.asset(model.Image, height: w * 0.08, width: w * 0.08, color: appStore.iconSecondaryColor),
            ),
          ),
          SizedBox(height: 8),
          text(model.name, textColor: appStore.textSecondaryColor)
        ],
      ),
    );
  }
}
