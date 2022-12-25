import 'package:flutter/material.dart';
import 'package:data_master/interface/texts-ui/subtitle.dart';
import 'package:data_master/shared/theme.dart';
import 'package:data_master/shared/variables.dart';

class SecondaryListTileApp extends StatelessWidget {

  final bool useLeading;
  final Widget leading;
  final String title;
  final bool useCustomTrailing;
  final Widget customTrailing;

  const SecondaryListTileApp({super.key, this.leading = const SizedBox(), required this.title, this.customTrailing = const SizedBox(), this.useLeading = false, this.useCustomTrailing = false});

  @override
  Widget build(BuildContext context) {
    
    final themeApp = Theme.of(context);

    return ListTile(
      dense: true,
      leading: useLeading ? leading : null,
      horizontalTitleGap: -sizedBox5,
      title: SubtitleText(
        label: title,
        fontFamily: interRegular,
        letterSpacing: 0.35,
        customColor: true,
        textColor: themeApp.textTheme.caption?.color,
      ),
      trailing: useCustomTrailing ? customTrailing : Transform.translate(
        offset: Offset(sizedBox8, 0.0),
        child: Icon(
          Icons.chevron_right_rounded
        ),
      ),
    );
  }
}