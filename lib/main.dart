import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:data_master/pages/master/home.dart';
import 'package:data_master/pages/master/master.dart';
import 'package:data_master/pages/shared/splash.dart';
import 'package:data_master/providers/provider.dart';
import 'package:data_master/shared/theme.dart';
import 'package:data_master/shared/variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MainProvider(),
      child: AdaptiveTheme(
        light: ThemeData(
          fontFamily: interRegular,
          brightness: Brightness.light,
          scaffoldBackgroundColor: lightScaffoldColor,
          backgroundColor: lightBackgroundColor,
          primaryColor: lightPrimaryColor,
          primarySwatch: Colors.blue,
          appBarTheme: AppBarTheme(
            backgroundColor: lightScaffoldColor,
            elevation: 5.0,
            shadowColor: lightSecondaryShadowColor,
            titleTextStyle: TextStyle(
              fontFamily: jakartaSemibold,
              color: lightPrimaryTextColor,
              letterSpacing: 0.1,
            ),
            iconTheme: IconThemeData(
              color: lightPrimaryIconColor
            ),
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark,
              systemNavigationBarColor: Colors.transparent,
              systemNavigationBarDividerColor: Colors.red,
            ),
          ),
          tabBarTheme: TabBarTheme(
            labelColor: lightPrimaryColor,
            unselectedLabelColor: lightTertiaryTextColor,
            labelStyle: TextStyle(
              fontFamily: jakartaSemibold,
            ),
            unselectedLabelStyle: TextStyle(
              fontFamily: jakartaSemibold,
            ),
            indicator: MaterialIndicator(
              color: lightPrimaryColor,
              horizontalPadding: secondaryPaddingSize,
              paintingStyle: PaintingStyle.fill,
            ),
          ),
          textTheme: TextTheme(
            headline3: TextStyle(
              color: lightPrimaryTextColor
            ),
            headline4: TextStyle(
              color: lightPrimaryTextColor
            ),
            headline5: TextStyle(
              color: lightPrimaryTextColor
            ),
            headline6: TextStyle(
              color: lightPrimaryTextColor
            ),
            subtitle1: TextStyle(
              color: lightPrimaryTextColor,
            ),
            bodyText2: TextStyle(
              color: lightPrimaryTextColor
            ),
            caption: TextStyle(
              color: lightSecondaryTextColor
            ),
            overline: TextStyle(
              color: lightTertiaryTextColor
            ),
            button: TextStyle(
              fontFamily: jakartaSemibold,
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: lightPrimaryColor,
              disabledBackgroundColor: lightDividerColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(secondaryRoundedButtonSize),
              ),
              textStyle: TextStyle(
                fontFamily: jakartaSemibold,
              ),
              elevation: 0.0,
              shadowColor: Colors.transparent,
            ),
          ),
          iconTheme: IconThemeData(
            color: lightSecondaryIconColor,
            size: primaryIconSize
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: lightScaffoldColor,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: lightPrimaryColor,
            selectedLabelStyle: TextStyle(
              fontSize: 11.0,
            ),
            unselectedLabelStyle: TextStyle(
              fontSize: 11.0
            ),
            elevation: 0.0,
          ),
        ),
        dark: ThemeData(
          fontFamily: interRegular,
          brightness: Brightness.dark,
          scaffoldBackgroundColor: darkScaffoldColor,
          backgroundColor: darkBackgroundColor,
          primaryColor: darkPrimaryColor,
          primarySwatch: Colors.blue,
          appBarTheme: AppBarTheme(
            backgroundColor: darkScaffoldColor,
            elevation: 5.0,
            shadowColor: lightSecondaryShadowColor,
            titleTextStyle: TextStyle(
              fontFamily: jakartaSemibold,
              color: darkPrimaryTextColor,
              letterSpacing: 0.1,
            ),
            iconTheme: IconThemeData(
              color: darkPrimaryIconColor
            ),
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.light,
            ),
          ),
          tabBarTheme: TabBarTheme(
            labelColor: darkPrimaryColor,
            unselectedLabelColor: darkTertiaryTextColor,
            labelStyle: TextStyle(
              fontFamily: jakartaSemibold,
            ),
            unselectedLabelStyle: TextStyle(
              fontFamily: jakartaSemibold,
            ),
            indicator: MaterialIndicator(
              color: darkPrimaryColor,
              horizontalPadding: secondaryPaddingSize,
              paintingStyle: PaintingStyle.fill,
            ),
          ),
          textTheme: TextTheme(
            headline3: TextStyle(
              color: darkPrimaryTextColor
            ),
            headline4: TextStyle(
              color: darkPrimaryTextColor
            ),
            headline5: TextStyle(
              color: darkPrimaryTextColor
            ),
            headline6: TextStyle(
              color: darkPrimaryTextColor
            ),
            subtitle1: TextStyle(
              color: darkPrimaryTextColor
            ),
            bodyText2: TextStyle(
              color: darkPrimaryTextColor
            ),
            caption: TextStyle(
              color: darkSecondaryTextColor
            ),
            overline: TextStyle(
              color: darkTertiaryTextColor
            ),
            button: TextStyle(
              fontFamily: jakartaSemibold,
            ),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: darkPrimaryColor,
              disabledBackgroundColor: darkDividerColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(secondaryRoundedButtonSize),
              ),
              textStyle: TextStyle(
                fontFamily: jakartaSemibold,
              ),
              elevation: 0.0,
              shadowColor: Colors.transparent,
            ),
          ),
          iconTheme: IconThemeData(
            color: darkSecondaryIconColor,
            size: primaryIconSize
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: darkScaffoldColor,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: darkPrimaryColor,
            selectedLabelStyle: TextStyle(
              fontSize: 11.0
            ),
            unselectedLabelStyle: TextStyle(
              fontSize: 11.0
            ),
            elevation: 0.0,
          ),
        ),
        initial: AdaptiveThemeMode.light, 
        builder: (light, dark) => MaterialApp(
          title: 'Data Master',
          theme: light,
          darkTheme: dark,
          initialRoute: mainRoute,
          routes: {
            mainRoute: (context) => SplashPage(),
            homeRoute: (context) => HomePage(),
            masterRoute: (context) => MasterPage(),
          },
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
