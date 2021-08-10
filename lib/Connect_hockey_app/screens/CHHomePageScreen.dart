import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:connect_hockey/main/utils/AppWidget.dart';
import 'package:connect_hockey/Connect_hockey_app/utils/CHColors.dart';
import 'package:connect_hockey/Connect_hockey_app/screens/CHChatScreen.dart';
import 'package:flutter_svg/svg.dart';

import 'CHFeed.dart';
import 'CHProfile.dart';
import 'CHTraining.dart';
import 'CHGameReviewSlidingPages.dart';

class CHHomePageScreen extends StatefulWidget {
  @override
  _CHHomePageScreenState createState() => _CHHomePageScreenState();
}

class _CHHomePageScreenState extends State<CHHomePageScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final tab = [
      CHTraining(),
      GameReviewSlidingPages(),
      CHFeed(),
      CHChatScreen(),
      CHProfile(),
    ];

    return SafeArea(
      child: Scaffold(
        backgroundColor: chAppBackground,
        body: tab[_currentIndex],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            boxShadow: [
              BoxShadow(color: chShadowColor, spreadRadius: 0, blurRadius: 2),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            child: BottomNavigationBar(
              backgroundColor: Colors.white,
              type: BottomNavigationBarType.fixed,
              showUnselectedLabels: false,
              showSelectedLabels: false,
              currentIndex: _currentIndex,
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset('images/theme6/t6_ic_list.svg', height: 28, width: 28, color: chIconColor),
                  activeIcon: SvgPicture.asset('images/theme6/t6_ic_list.svg', height: 28, width: 28, color: chPrimaryColor),
                  title: Text('a'),
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset('images/theme13/t13_ic_map.svg', height: 28, width: 28, color: chIconColor),
                  activeIcon: SvgPicture.asset('images/theme13/t13_ic_map.svg', height: 28, width: 28, color: chPrimaryColor),
                  title: Text('a'),
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset('images/theme13/t13_trophy.svg', height: 28, width: 28, color: chIconColor),
                  activeIcon: SvgPicture.asset('images/theme13/t13_trophy.svg', height: 28, width: 28, color: chPrimaryColor),
                  title: Text('a'),
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset('images/theme13/t13_ic_send.svg', height: 28, width: 28, color: chIconColor),
                  activeIcon: SvgPicture.asset('images/theme13/t13_ic_send.svg', height: 28, width: 28, color: chPrimaryColor),
                  title: Text('a'),
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    height: 30,
                    width: 30,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: CachedNetworkImage(
                        placeholder: placeholderWidgetFn(),
                        imageUrl: 'https://www.connect.hockey/wp-content/uploads/2020/10/7841-removebg-preview.png',
                        fit: BoxFit.cover,
                        height: 35,
                        width: 10,
                      ),
                    ),
                  ),
                  activeIcon: Container(
                    decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: chPrimaryColor, width: 2)),
                    height: 30,
                    width: 30,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: 'https://www.connect.hockey/wp-content/uploads/2020/10/7841-removebg-preview.png',
                        height: 35,
                        width: 10,
                      ),
                    ),
                  ),
                  title: Text('a'),
                ),
              ],
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
