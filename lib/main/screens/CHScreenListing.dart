import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:connect_hockey/main/model/AppModel.dart';
import 'package:connect_hockey/main/utils/AppColors.dart';
import 'package:connect_hockey/main/utils/AppImages.dart';
import 'package:connect_hockey/main/utils/AppWidget.dart';

import '../../main.dart';
import 'ThemeList.dart';

class CHScreenListing extends StatefulWidget {
  static String tag = "/CHScreenListing";
  final ProTheme proTheme;

  CHScreenListing(this.proTheme);

  @override
  CHScreenListingState createState() => CHScreenListingState();
}

class CHScreenListingState extends State<CHScreenListing> {
  var selectedTab = 0;
  List<ProTheme> list = [];
  List<Color> colors = [appCat1, appCat2, appCat3];

  @override
  void initState() {
    super.initState();
    if (widget.proTheme.sub_kits != null) {
      list.addAll(widget.proTheme.sub_kits);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Scaffold(
        appBar: appBar(
          context,
          widget.proTheme.title_name ?? widget.proTheme.name,
          iconColor: Theme.of(context).iconTheme.color,
          actions: [
            Tooltip(
              message: 'Dark Mode',
              child: Switch(
                value: appStore.isDarkModeOn,
                activeColor: appColorPrimary,
                onChanged: (s) {
                  appStore.toggleDarkMode(value: s);
                  setState(() {});
                },
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 80),
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(16),
                child: widget.proTheme.show_cover ? Image.asset(app_bg_cover_image, height: context.height() / 4) : null,
              ),
              ThemeList(list),
            ],
          ),
        ),
      ),
    );
  }
}
