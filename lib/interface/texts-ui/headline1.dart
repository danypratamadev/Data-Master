import 'package:flutter/material.dart';
import 'package:data_master/providers/provider.dart';
import 'package:data_master/shared/theme.dart';
import 'package:provider/provider.dart';

class Headline1Text extends StatelessWidget {

  final String label;
  final String fontFamily;
  final bool customColor;
  final Color? textColor;
  final double heightSpaceing;
  final TextAlign textAlign;
  final int maxLines;
  
  const Headline1Text({super.key, required this.label, this.fontFamily = jakartaBold, this.customColor = false, this.textColor, this.heightSpaceing = 1.3, this.textAlign = TextAlign.start, this.maxLines = 2});

  @override
  Widget build(BuildContext context) {

    final themeApp = Theme.of(context);
    final fontSize = themeApp.textTheme.headline5?.fontSize!;

    return Consumer<MainProvider>(
      builder: (contextt, value, child) => Text(
        label,
        style: themeApp.textTheme.headline5?.copyWith(
          fontFamily: fontFamily,
          color: customColor ? textColor : null,
          fontSize: fontSize! + 2.0,
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