import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:connect_hockey/Connect_hockey_app/models/CHSearchModel.dart';
import 'package:connect_hockey/Connect_hockey_app/utils/CHColors.dart';
import 'package:connect_hockey/Connect_hockey_app/utils/CHStyle.dart';

class CHSearchScreen extends StatefulWidget {
  @override
  _CHSearchScreenState createState() => _CHSearchScreenState();
}

class _CHSearchScreenState extends State<CHSearchScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: chAppBackground,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(16.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        decoration: boxDecorations(radius: 6, bgColor: chViewColor.withOpacity(0.8)),
                        child: TextField(
                          style: TextStyle(fontSize: 20),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search',
                            prefixIcon: Icon(Icons.search, color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        finish(context);
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Text("Cancel", style: primaryTextStyle(color: chPrimaryColor)),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 16),
                child: Text("Search history", style: secondaryTextStyle()),
              ),
              ListView.builder(
                itemCount: searchList == null ? 0 : searchList.length,
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 16),
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(shape: BoxShape.circle, color: chSecondaryColorRed),
                                  padding: EdgeInsets.all(4),
                                  child: Icon(Icons.star, color: Colors.white, size: 12),
                                ),
                                SizedBox(width: 16),
                                Text(searchList[index].value, style: primaryTextStyle(size: 16, color: chTextPrimaryColor)),
                              ],
                            ),
                            Icon(Icons.keyboard_arrow_right, color: chIconColor)
                          ],
                        ),
                      ),
                      Container(
                        color: chViewColor,
                        height: 1,
                        margin: EdgeInsets.only(top: 16, bottom: 16),
                      )
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
