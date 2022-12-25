import 'package:flutter/material.dart';
import 'package:data_master/providers/provider.dart';
import 'package:data_master/shared/theme.dart';
import 'package:provider/provider.dart';

class Headline3Text extends StatelessWidget {

  final String label;
  final String fontFamily;
  final bool customColor;
  final Color? textColor;
  final double heightSpaceing;
  final TextAlign textAlign;
  final int maxLines;
  
  const Headline3Text({super.key, required this.label, this.fontFamily = jakartaSemibold, this.customColor = false, this.textColor, this.heightSpaceing = 1.3, this.textAlign = TextAlign.start, this.maxLines = 2});

  @override
  Widget build(BuildContext context) {

    final themeApp = Theme.of(context);
    final fontSize = themeApp.textTheme.headline6?.fontSize!;

    return Consumer<MainProvider>(
      builder: (contextt, value, child) =>  Text(
        label,
        style: themeApp.textTheme.headline6?.copyWith(
          fontFamily: fontFamily,
          fontSize: fontSize! - 2.0,
          color: customColor ? textColor : null,
          height: heightSpaceing,
        ),
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
        textScaleFactor: value.textScaleFactor,
        softWrap: true,
      ),
    );
  }
}