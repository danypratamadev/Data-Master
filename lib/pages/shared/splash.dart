import 'dart:async';

import 'package:data_master/interface/texts-ui/largeheadline.dart';
import 'package:data_master/providers/provider.dart';
import 'package:data_master/shared/theme.dart';
import 'package:data_master/shared/variables.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class SplashPage extends StatelessWidget {

  int limitReq = 0;

  SplashPage({super.key});

  @override
  Widget build(BuildContext context) {

    final mainProvider = Provider.of<MainProvider>(context, listen: false);
    final themeApp = Theme.of(context);

    if(limitReq == 0){
      Timer(Duration(milliseconds: 1500), (){
        mainProvider.setupaMainMenu();
        mainProvider.pushReplacementRoute(context: context, route: homeRoute);
      });
      limitReq++;
    }

    return Scaffold(
      backgroundColor: themeApp.primaryColor,
      body: Center(
        child: LargeHeadlineText(
          label: 'Data Master',
          customColor: true,
          textColor: lightWhiteTextColor,
        ),
      ),
    );
  }
}