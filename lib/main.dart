import 'package:connect_hockey/Connect_hockey_app/screens/CHViewAllLivevideoScreen.dart';
import 'package:connect_hockey/Connect_hockey_app/screens/CHSubscriptionScreen.dart';
import 'package:connect_hockey/authentication_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:connect_hockey/main/store/AppStore.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'Connect_hockey_app/screens/CHEditAccountScreen.dart';
import 'Connect_hockey_app/screens/CHEditProfileScreen.dart';
import 'Connect_hockey_app/screens/CHHomePageScreen.dart';
import 'Connect_hockey_app/screens/CHLoginScreen.dart';
import 'Connect_hockey_app/screens/CHRegisterScreen.dart';
import 'Connect_hockey_app/screens/CHSplashScreen.dart';
import 'Connect_hockey_app/screens/CHFeed.dart';
import 'Connect_hockey_app/screens/CHProfile.dart';
import 'main/utils/AppTheme.dart';
import 'package:connect_hockey/routes.dart';
import 'package:firebase_core/firebase_core.dart';
/// This variable is used to get dynamic colors when theme mode is changed
AppStore appStore = AppStore();

Future<void> main() async {
  //region Entry Point
  //WidgetsFlutterBinding.ensureInitialized();

  //await initialize();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  //appStore.toggleDarkMode(value: getBoolAsync(isDarkModeOnPref));

  //if (isMobile) {
    //await Firebase.initializeApp();
   // MobileAds.instance.initialize();

   // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  //}

  runApp(MyApp());
  //endregion
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => MultiProvider(
        providers: [
          Provider<AuthenticationService>(
            create: (_) => AuthenticationService(FirebaseAuth.instance),
          ),
          StreamProvider(
              create: (context) => context.read<AuthenticationService>().authStateChange,
          ),
        ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        // localizationsDelegates: [MuviAppLocalizations.delegate, GlobalMaterialLocalizations.delegate, GlobalWidgetsLocalizations.delegate],
        localeResolutionCallback: (locale, supportedLocales) => Locale(appStore.selectedLanguage),
        locale: Locale(appStore.selectedLanguage),
        supportedLocales: [Locale('en', '')],
        routes: routes(),
        home: AuthenticationWrapper(),
        theme: !appStore.isDarkModeOn ? AppThemeData.lightTheme : AppThemeData.darkTheme,
        // builder: scrollBehaviour(),
      ),)
    );
  }
}

class AuthenticationWrapper extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    if(firebaseUser != null){
      return CHHomePageScreen();
    }
    return CHSplashScreen();
  }
}

