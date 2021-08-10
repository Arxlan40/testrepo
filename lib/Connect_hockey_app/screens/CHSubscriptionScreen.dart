import 'package:connect_hockey/Connect_hockey_app/models/CHModel.dart';
import 'package:connect_hockey/Connect_hockey_app/screens/CHHomePageScreen.dart';
import 'package:connect_hockey/Connect_hockey_app/utils/CHColors.dart';
import 'package:connect_hockey/Connect_hockey_app/utils/CHDataGenerator.dart';
import 'package:connect_hockey/Connect_hockey_app/utils/Widget/CHWidgets.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:connect_hockey/Connect_hockey_app/utils/CHStrings.dart';

class CHSubscriptionScreen extends StatefulWidget {
  @override
  _CHSubscriptionScreenState createState() => _CHSubscriptionScreenState();
}

class _CHSubscriptionScreenState extends State<CHSubscriptionScreen> {
  List<ChoosePlanModel> subscriptionChoosePlanList = getSubscriptionChoosePlanList();
  int i;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {}

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('images/theme6/background_connect_hockey_logo.png', alignment: Alignment.topCenter, fit: BoxFit.cover, height: context.height() * 0.25, width: context.width()),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(subscribe_text, style: boldTextStyle(size: 22, color: chPrimaryColor)),
                8.height,
                UL(
                  symbolType: SymbolType.Bullet,
                  spacing: 8,
                  padding: 16,
                  children: [
                    Text(subscribe_text_benefit_goalie_1, style: boldTextStyle(color: chTextPrimaryColor, size: 16)),
                    Text(subscribe_text_benefit_goalie_2, style: boldTextStyle(color: chTextPrimaryColor, size: 16)),
                    Text(subscribe_text_benefit_goalie_3, style: boldTextStyle(color: chTextPrimaryColor, size: 16)),
                    Text(subscribe_text_benefit_both, style: boldTextStyle(color: chTextPrimaryColor, size: 16)),
                  ],
                ),
                16.height,
                Text(subscribe_text_choose_period, style: boldTextStyle(color: chTextPrimaryColor)),
                ListView.builder(
                    itemCount: subscriptionChoosePlanList.length,
                    padding: EdgeInsets.symmetric(vertical: 8),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      ChoosePlanModel data = subscriptionChoosePlanList[index];
                      return Container(
                        margin: EdgeInsets.symmetric(vertical: 8),
                        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                        decoration: boxDecorationWithRoundedCorners(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          backgroundColor: i == index ? chLightBackgroundColor : white,
                          border: Border.all(color: chPrimaryColor.withOpacity(0.2), width: 0.8),
                        ),
                        child: Row(
                          children: [
                            Container(
                                width: 25,
                                height: 25,
                                decoration: new BoxDecoration(
                                    color: data.checkBox ? Colors.transparent : white,
                                    border: Border.all(
                                      width: 1,
                                      color: i == index ? white : chPrimaryColor,
                                    ),
                                    shape: BoxShape.circle),
                                child: i == index ? Icon(Icons.check, size: 18) : 0.height),
                            16.width,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(data.title, style: boldTextStyle(size: 16)),
                                4.height,
                                Text(data.subTitle, style: primaryTextStyle(size: 14, color: i == index ? chPrimaryColor : chPrimaryColor)),
                              ],
                            ).expand(),
                            subscribeAppButton(
                              context,
                              btnText: subscribe_text_buy,
                              bgColor: chPrimaryColor,
                              width: 70,
                              shape: 10.0,
                              txtColor: white,
                            ).visible(i == index).withHeight(45),
                          ],
                        ),
                      ).onTap(() {
                        i = index;
                        setState(() {});
                      });
                    }),
                Container(
                  height: 40,
                  padding: EdgeInsets.only(left: 15, right: 15),
                  width: MediaQuery.of(context).copyWith().size.width,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('I don\'t want to subscribe.', style: secondaryTextStyle()),
                      FlatButton(
                        onPressed: () {
                          CHHomePageScreen().launch(context);
                        },
                        child: Text('NO THANKS', style: boldTextStyle(size: 14, color: chPrimaryColor)),
                      ),
                    ],
                  ),
                )
              ],
            ).paddingAll(16),
          ],
        ),
      ),
    );
  }
}
