import 'package:age/age.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connect_hockey/Connect_hockey_app/User.dart';
import 'package:connect_hockey/Connect_hockey_app/screens/CHProfileStatistics.dart';
import 'package:connect_hockey/Connect_hockey_app/utils/CHColors.dart';
import 'package:connect_hockey/Connect_hockey_app/screens/CHSettingScreen.dart';
import 'package:connect_hockey/Connect_hockey_app/utils/CHConstant.dart';
import 'package:connect_hockey/Connect_hockey_app/utils/CHStrings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:connect_hockey/main/utils/AppWidget.dart';
import 'package:connect_hockey/Connect_hockey_app/utils/Widget/CWSlidingSegmentedControlScreen.dart';

import '../../main.dart';

//temporary list data
final List<String> attributes = <String>[
  'Glove High',
  'Glove Low',
  'Blocker High',
  'Blocker Low',
  'Five Hole',
  'Positioning',
  'Breakaway',
  'Lateral',
  'T-Push',
  'Slide',
  'Passing',
  'Puck Playing',
  'Rebound Control',
  'Recovery',
  'Communication',
  'Aggressivness',
  'Agility',
  'Durability',
  'Speed',
  'Vision'
];
final List<String> entries = <String>[
  '90',
  '92',
  '95',
  '88',
  '91',
  '90',
  '92',
  '95',
  '88',
  '91',
  '90',
  '92',
  '95',
  '88',
  '91',
  '90',
  '92',
  '95',
  '88',
  '91'
];
final fDb = FirebaseFirestore.instance;

class CHProfile extends StatefulWidget {
  static String tag = '/CHProfile';

  @override
  CHProfileState createState() => CHProfileState();
}

class CHProfileState extends State<CHProfile> {
  //List<T10Images> mList;
  String firstName = "";
  String lastName = "";
  String goalieNumber = "";
  List teamsGoalie =[];
  String age = "";
  String glove = "";
  String birthday ;
  String profilePicture = "";

  @override
  void initState() {
    super.initState();
    getdata();
    //mList = getProfile();
  }

  Future<void> getdata() async {
    try {
      fDb
          .collection('users')
          .where('email',
              isEqualTo: FirebaseAuth.instance.currentUser.email.toString())
          .get()
          .then((QuerySnapshot querySnapshot) {
        print(querySnapshot.docs);
        querySnapshot.docs.forEach((doc) {
          print(doc["teamsGoalie"]);
          setState(() {
            firstName = doc["firstName"];
            lastName = doc["lastName"];
            goalieNumber = doc["goalieNumber"];
            glove = doc["glove"];
            birthday = doc["birthDate"];

            profilePicture = doc["profilePicture"];
            teamsGoalie = doc["teamsGoalie"];
          });
        });
      });
      print("---------");
    } catch (e) {
      Get.log('$e');
    }
  }
  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    print("dater=${(to.difference(from).inDays )}");
    return (to.difference(from).inDays / 365).round();
  }
  @override
  Widget build(BuildContext context) {
    changeStatusColor(appStore.appBarColor);
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: appStore.scaffoldBackground,
      appBar: AppBar(
        title: Text('My Profile', style: boldTextStyle(color: Colors.white)),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Icons.settings, color: Colors.white),
            onPressed: () async {
              // DateTime today = DateTime.now();

              // daysBetween(DateTime.parse(birthday),today);

              SDSettingScreen().launch(context);
            },
          )
        ],
        backgroundColor: chPrimaryColor,
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: spacing_standard_new),
                    Padding(
                      padding: EdgeInsets.only(left: 40.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Expanded(
                            flex: 2,
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(spacing_middle),
                                  bottomRight:
                                      Radius.circular(spacing_standard_new)),
                              child: CachedNetworkImage(
                                placeholder: placeholderWidgetFn(),
                                imageUrl: profilePicture ==""? ch_profile:profilePicture,
                                fit: BoxFit.cover,
                                height: width * 0.35,
                              ),
                            ),
                          ),
                          SizedBox(width: spacing_standard_new),
                          Expanded(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                text(firstName,
                                    textColor: chTextPrimaryColor,
                                    fontFamily: fontMedium,
                                    fontSize: textSizeLargeMedium),
                                text(lastName,
                                    textColor: chTextPrimaryColor,
                                    fontFamily: fontMedium,
                                    fontSize: textSizeLargeMedium),
                                text("#$goalieNumber",
                                    textColor: chTextPrimaryColor),
                                text(teamsGoalie.length == 0 ? "" : teamsGoalie[0].toString(),
                                    textColor: chTextPrimaryColor),
                                // text('Age: $age years' ,
                                //     textColor: chTextPrimaryColor,
                                //     fontSize: textSizeLargeMedium),
                                text('Glove: $glove',
                                    textColor: chTextPrimaryColor,
                                    fontSize: textSizeLargeMedium),
                                SizedBox(height: spacing_standard),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(spacing_standard_new),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  text(theme10_nb_games,
                                      textColor: chTextPrimaryColor,
                                      fontFamily: fontMedium),
                                  text(theme10_lbl_games,
                                      textColor: chTextPrimaryColor),
                                ],
                              ),
                              Container(
                                height: width * 0.1,
                                width: 0.5,
                                color: chViewColor,
                                margin: EdgeInsets.only(
                                    left: spacing_standard_new,
                                    right: spacing_standard_new),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  text(theme10_nb_saves,
                                      textColor: chTextPrimaryColor,
                                      fontFamily: fontMedium),
                                  text(theme10_lbl_saves,
                                      textColor: chTextPrimaryColor),
                                ],
                              ),
                              Container(
                                height: width * 0.1,
                                width: 0.5,
                                color: chViewColor,
                                margin: EdgeInsets.only(
                                    left: spacing_standard_new,
                                    right: spacing_standard_new),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  text(theme10_nb_friends,
                                      textColor: chTextPrimaryColor,
                                      fontFamily: fontMedium),
                                  text(theme10_lbl_friends,
                                      textColor: chTextPrimaryColor),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: spacing_standard_new),
                          SizedBox(
                            width: 400.0,
                            height: 220.0,
                            child: CHProfileStatistic(),
                          ),
                          SizedBox(height: spacing_standard_new),
                          Divider(height: 1, thickness: 1),
                          SizedBox(height: spacing_standard_new),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              text('MY STATISTICS',
                                  textColor: chTextPrimaryColor,
                                  fontFamily: fontMedium),
                            ],
                          ),
                          SizedBox(
                            width: 400.0,
                            height: 200.0,
                            child: CWSlidingSegmentedControlScreen(),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
