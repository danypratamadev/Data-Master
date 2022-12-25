import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:data_master/shared/theme.dart';
import 'package:data_master/shared/variables.dart';

class ElevatedButtonApp extends StatelessWidget {

  final String label;
  final double width;
  final double height;
  final GestureTapCallback onTap;
  final bool buttonEnable;
  final bool loadingEnable;
  final double textScaleFactor;
  
  const ElevatedButtonApp({super.key, required this.label, this.width = double.maxFinite, this.height = 48.0, required this.onTap, required this.buttonEnable, required this.loadingEnable, required this.textScaleFactor,});

  @override
  Widget build(BuildContext context) {

    final themeApp = Theme.of(context);

    return MediaQuery(
      data: MediaQuery.of(context).copyWith(
        textScaleFactor: textScaleFactor,
      ),
      child: SizedBox(
        width: width,
        height: height,
        child: ElevatedButton(
          onPressed: buttonEnable && !loadingEnable ? onTap : null,
          child: loadingEnable ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CupertinoActivityIndicator(),
              SizedBox(width: sizedBox8,),
              Transform.translate(
                offset: Offset(0.0, -1.0),
                child: Text(
                  'Loading',
                  style: themeApp.textTheme.button?.copyWith(
                    fontSize: themeApp.textTheme.button!.fontSize! + 1.0,
                    color: themeApp.disabledColor
                  ),
                ),
              ),
            ],
          ) : Transform.translate(
            offset: Offset(0.0, -1.0),
            child: Text(
              label,
              style: themeApp.textTheme.button?.copyWith(
                fontSize: themeApp.textTheme.button!.fontSize! + 1.0,
                color: buttonEnable ? lightWhiteTextColor : themeApp.disabledColor
              ),
            ),
          ),
        ),
      ),
    );
  }
}