import 'package:flutter/material.dart';
import 'package:data_master/interface/texts-ui/subtitle.dart';
import 'package:data_master/shared/theme.dart';
import 'package:data_master/shared/variables.dart';

class ListTileApp extends StatelessWidget {

  final bool useLeading;
  final Widget leading;
  final String title;
  final bool useCustomTrailing;
  final Widget customTrailing; 
  final GestureTapCallback onTap;
  final double titlePadding;

  const ListTileApp({super.key, this.leading = const SizedBox(), required this.title, this.customTrailing = const SizedBox(), required this.onTap, this.useLeading = false, this.useCustomTrailing = false, this.titlePadding = -sizedBox5});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: ListTile(
        onTap: onTap,
        dense: true,
        leading: useLeading ? leading : null,
        horizontalTitleGap: titlePadding,
        title: Transform.translate(
          offset: Offset(0.0, -1.0),
          child: SubtitleText(
            label: title,
            fontFamily: jakartaMedium,
          ),
        ),
        trailing: useCustomTrailing ? customTrailing : Transform.translate(
          offset: Offset(sizedBox8, 0.0),
          child: Icon(
            Icons.chevron_right_rounded
          ),
        ),
      ),
    );
  }
}