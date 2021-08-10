import 'package:cached_network_image/cached_network_image.dart';
import 'package:connect_hockey/Connect_hockey_app/models/CHFeedModel.dart';
import 'package:connect_hockey/Connect_hockey_app/utils/CHConstant.dart';
import 'package:connect_hockey/Connect_hockey_app/utils/CHColors.dart';
import 'package:connect_hockey/Connect_hockey_app/utils/CHDataGenerator.dart';
import 'package:connect_hockey/Connect_hockey_app/utils/CHStrings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:connect_hockey/main.dart';
import 'package:connect_hockey/main/utils/AppWidget.dart' hide boxDecoration;
import 'CHNotificationScreen.dart';
import 'CHSearchScreen.dart';
import 'package:connect_hockey/Connect_hockey_app/utils/CHStyle.dart';

class CHFeed extends StatefulWidget {
  static var tag = "/CHFeed";

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CHFeedState();
  }
}

class CHFeedState extends State<CHFeed> {


  List<CHFeedModel> mListings;

  @override
  void initState() {
    super.initState();
    mListings = getListings().cast<CHFeedModel>();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(appStore.appBarColor);
    return Scaffold(
      appBar: AppBar(
        title: Text('Feed',
            style: primaryTextStyle(color: Colors.white)),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: chPrimaryColor,

      ),
      body: Observer(
        builder: (_) => Container(
          child: Column(
            children: <Widget>[
              16.height,
              Container(
                margin: EdgeInsets.only(left: 16, right: 16),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        decoration: boxDecoration(radius: 5, backGroundColor: chViewColor.withOpacity(0.8), blurRadius: 0, spreadRadius: 0),
                        child: TextField(
                          autofocus: false,
                          readOnly: true,
                          onTap: () {
                            CHSearchScreen().launch(context);
                          },
                          style: TextStyle(fontSize: 20),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search',
                            prefixIcon: Icon(Icons.search, color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    Stack(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          padding: EdgeInsets.only(left: 10, top: 5, right: 15),
                          child: InkWell(
                            onTap: () {
                              CHNotificationScreen().launch(context);
                            },
                            child: Icon(Icons.notifications_none, size: 30, color: Colors.black),
                          ),
                        ),
                        Positioned(
                          right: 9,
                          top: 0,
                          child: CircleAvatar(
                            radius: 10,
                            backgroundColor: Colors.red,
                            child: Text('3', style: secondaryTextStyle(color: Colors.white)),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              16.height,
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: mListings.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return T1ListItem(mListings[index], index);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class T1ListItem extends StatelessWidget {
  CHFeedModel model;
  int pos;

  T1ListItem(CHFeedModel model, int pos) {
    this.model = model;
    this.pos = pos;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Padding(
        padding: EdgeInsets.fromLTRB(16, 4, 16, 4),
        child: Container(
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        ClipRRect(
                          child: CachedNetworkImage(
                            placeholder: placeholderWidgetFn(),
                            imageUrl: model.img,
                            width: width / 5.5,
                            height: width / 6,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    text(model.name, textColor: chTextPrimaryColor, fontFamily: fontBold, fontSize: textSizeSMedium, maxLine: 2),
                                    text(model.duration, textColor: chTextPrimaryColor, fontSize: textSizeSmall),
                                  ],
                                ),
                                text(model.designation, fontSize: textSizeSmall, textColor: chTextPrimaryColor, fontFamily: fontMedium),
                              ],
                            ),
                          ),
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.start,
                    ),
                    SizedBox(height: 16),
                    text(t1_samplelong_text, fontSize: textSizeMedium, maxLine: 2, textColor: chTextPrimaryColor),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                          child: Icon(Icons.favorite, color: chPrimaryColor, size: 28),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                          child: Icon(Icons.comment, color: chPrimaryColor, size: 28),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                          child: Icon(Icons.send, color: chPrimaryColor, size: 28),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

            ],
          ),
        ));
  }
}
