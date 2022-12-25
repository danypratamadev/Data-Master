import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:data_master/interface/texts-ui/body.dart';
import 'package:data_master/interface/texts-ui/headline2.dart';
import 'package:data_master/shared/theme.dart';
import 'package:data_master/shared/variables.dart';

class DialogApps {

  static showAlertDialogApp({required BuildContext context, required Widget title, required dynamic message, required double textScaleFactor, required List<Widget> action, bool dismissible = false, bool messageAsWidget = false, required bool darkMode}){

    final mediaApp = MediaQuery.of(context);
    
    showCupertinoDialog(
      context: context,
      barrierDismissible: dismissible,
      builder: (_) => MediaQuery(
        data: mediaApp.copyWith(
          textScaleFactor: textScaleFactor,
        ),
        child: Theme(
          data: darkMode ? ThemeData.dark() : ThemeData.light(),
          child: CupertinoAlertDialog(
            title: title,
            content: messageAsWidget ? message : BodyText(
              label: message, 
              textAlign: TextAlign.center,
              maxLines: 10,
            ),
            actions: action.map((btn) => btn).toList(),
          ),
        ),
      )
    );

  }

  static showBottomSheetDialog({required BuildContext context, required String title, required String describe, required double textScaleFactor, required bool darkMode, required List<Widget> widget, bool showDescribe = true, bool dismissible = true, bool centerTitle = false, int maxLinesDiscribe = 5}) {

    final mediaApp = MediaQuery.of(context);

    showModalBottomSheet(
      context: context, 
      isDismissible: dismissible,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(secondaryRoundedCardSize),
          topRight: Radius.circular(secondaryRoundedCardSize),
        )
      ),
      backgroundColor: darkMode ? darkBackgroundColor : lightScaffoldColor,
      builder: (context) => MediaQuery(
        data: mediaApp.copyWith(
          textScaleFactor: textScaleFactor,
        ),
        child: Padding(
          padding: EdgeInsets.only(left: primaryPaddingSize, right: primaryPaddingSize, top: tertiaryPaddingSize, bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(secondaryRoundedCardSize),
                child: Container(
                  width: sizedBox50,
                  height: sizedBox5,
                  color: darkMode ? darkDividerColor : lightDividerColor,
                ),
              ),
              SizedBox(height: secondaryPaddingSize,),
              Align(
                alignment: centerTitle ? Alignment.center : Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: centerTitle ? CrossAxisAlignment.center : CrossAxisAlignment.start,
                  children: [
                    Headline2Text(
                      label: title, 
                      textAlign: centerTitle ? TextAlign.center : TextAlign.left,
                      fontFamily: jakartaBold,
                      customColor: true,
                      textColor: darkMode ? darkPrimaryTextColor : lightPrimaryTextColor,
                    ),
                    if(showDescribe)
                    Padding(
                      padding: const EdgeInsets.only(top: sizedBox3),
                      child: BodyText(
                        label: describe,
                        textAlign: centerTitle ? TextAlign.center : TextAlign.left,
                        maxLines: maxLinesDiscribe,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: primaryPaddingSize,),
              Column(
                children: widget.map((widgets) => widgets).toList(),
              ),
              SizedBox(height: sizedBox24,),
            ],
          ),
        ),
      ),
    );
  }

}