import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_reflectly/components/constants.dart';
import 'package:my_reflectly/pages/account_pageview.dart';
import 'package:my_reflectly/providers/daily_positives_provider.dart';
import 'package:my_reflectly/providers/has_animation_run.dart';
import 'package:my_reflectly/providers/images_provider.dart';
import 'package:my_reflectly/providers/isActivitesMoreThanZero.dart';
import 'package:my_reflectly/providers/isFeelingsMoreThanZero.dart';
import 'package:my_reflectly/providers/moment2_provider.dart';
import 'package:my_reflectly/providers/onboarding_indicator.dart';
import 'package:my_reflectly/providers/stored_moments_provider.dart';
import 'package:my_reflectly/providers/show_add_note_provider.dart';
import 'package:my_reflectly/providers/sliderValue_provider.dart';
import 'package:my_reflectly/providers/username_provide.dart';

import 'pages/sign_in.dart';
import 'pages/sign_in_pageview.dart';
import 'pages/notes.dart';
import 'pages/daily_positives.dart';

import 'package:provider/provider.dart';
import 'package:my_reflectly/providers/add_note_providers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    SystemChrome.setEnabledSystemUIOverlays([]);

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);



    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => StoredMoments(),
        ),
        ChangeNotifierProvider(
          create: (_) => AddMoment(),
        ),
        ChangeNotifierProvider(
          create: (_) => SliderValue(),
        ),
        ChangeNotifierProvider.value(
          value: ActivitiesMoments(),
        ),
        ChangeNotifierProvider.value(
            value: IsPopUpOn()),
        ChangeNotifierProvider(
            create:(_)=> DailyPositivesList()),
        ChangeNotifierProvider.value(
            value:  ShowDailyPositivesDialog()),
        ChangeNotifierProvider.value(
            value:  DPImagesProvider()),
        ChangeNotifierProvider.value(
            value:  ActivitiesIsMoreThanZero()),
        ChangeNotifierProvider.value(
            value:  FeelingsIsMoreThanZero()),
        ChangeNotifierProvider.value(
            value:  UserName()),
        ChangeNotifierProvider.value(
            value: HasAnimationRun()),
        ChangeNotifierProvider.value(
            value: OnBoardingValue()),

      ],
      child: MaterialApp(
        darkTheme: ThemeData.dark(),

        theme: ThemeData.dark().copyWith(
          primaryColor: Colors.purple,
          scaffoldBackgroundColor: kBackgroundColor,
          backgroundColor: kPrimaryColor,
        ),
        initialRoute: SignIn.id,
        routes: {
          SignIn.id: (context) => SignInPageView(),
          Moments.id: (context) => Moments(),
          DailyPositives.id: (context) => DailyPositives(),
//          Account.id: (context) => Account(),
          SettingsPage.id: (context) => SettingsPage(),

      },
      ),
    );
  }
}
