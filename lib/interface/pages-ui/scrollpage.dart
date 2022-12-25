import 'package:flutter/material.dart';
import 'package:data_master/interface/others-ui/appbarcollapse.dart';
import 'package:data_master/providers/provider.dart';
import 'package:data_master/shared/variables.dart';
import 'package:provider/provider.dart';

class AppScrollPage extends StatelessWidget {

  final String title;
  final Widget largeTitle;
  final bool showLeading;
  final Widget leadingWidget;
  final double expandedHeight;
  final bool showFlexibleSpace;
  final List<Widget>? appbarAction;
  final List<Widget> body;
  final bool useRefresh;
  final int actionRefresh;
  final bool centerTitle;
  final bool removePadding;
  final bool useCustomTitle;
  final Widget customTitle;

  const AppScrollPage({super.key, required this.title, required this.largeTitle, this.showLeading = false, this.leadingWidget = const SizedBox(), this.expandedHeight = smallFlexibleAppBarSize, this.showFlexibleSpace = true, this.appbarAction, required this.body, this.useRefresh = false, this.actionRefresh = 0, this.removePadding = false, this.centerTitle = true, this.useCustomTitle = false, this.customTitle = const SizedBox()});

  @override
  Widget build(BuildContext context) {

    final mainProvider = Provider.of<MainProvider>(context, listen: false);
    final mediaApp = MediaQuery.of(context);
    final themeApp = Theme.of(context);

    return useRefresh ? RefreshIndicator(
      onRefresh: () => mainProvider.onRefresh(context: context, action: actionRefresh),
      backgroundColor: themeApp.backgroundColor,
      color: themeApp.primaryColor,
      strokeWidth: 2.0,
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        slivers: [
          SliverAppBar(
            pinned: true,
            toolbarHeight: appBarSize,
            leading: showLeading ? leadingWidget : null,
            title: AppBarCollaps(
              child: useCustomTitle ? customTitle : Consumer<MainProvider>(
                builder: (context, value, child) => MediaQuery(
                  data: mediaApp.copyWith(
                    textScaleFactor: value.textScaleFactor
                  ),
                  child: Text(
                    title,
                    style: themeApp.appBarTheme.titleTextStyle?.copyWith(
                      fontSize: themeApp.textTheme.subtitle1?.fontSize,
                    ),
                  ),
                ),
              ),
            ),
            centerTitle: centerTitle,
            expandedHeight: expandedHeight,
            actions: appbarAction,
          ),
          if(showFlexibleSpace)
          SliverPadding(
            padding: EdgeInsets.only(left: primaryPaddingSize, right: primaryPaddingSize, bottom: tertiaryPaddingSize),
            sliver: SliverToBoxAdapter(
              child: largeTitle,
            ),
          ),
          SliverPadding(
            padding: removePadding ? EdgeInsets.zero : EdgeInsets.symmetric(horizontal: primaryPaddingSize),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                body,
              )
            ),
          )
        ],
      ),
    ) : CustomScrollView(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        slivers: [
          SliverAppBar(
            pinned: true,
            toolbarHeight: appBarSize,
            automaticallyImplyLeading: showLeading,
            leading: leadingWidget,
            title: AppBarCollaps(
              child: useCustomTitle ? customTitle : Consumer<MainProvider>(
                builder: (context, value, child) => MediaQuery(
                  data: mediaApp.copyWith(
                    textScaleFactor: value.textScaleFactor
                  ),
                  child: Text(
                    title,
                    style: themeApp.appBarTheme.titleTextStyle?.copyWith(
                      fontSize: themeApp.textTheme.subtitle1?.fontSize,
                    ),
                  ),
                ),
              ),
            ),
            centerTitle: true,
            expandedHeight: expandedHeight,
            actions: appbarAction,
          ),
          if(showFlexibleSpace)
          SliverPadding(
            padding: EdgeInsets.only(left: primaryPaddingSize, right: primaryPaddingSize, bottom: tertiaryPaddingSize),
            sliver: SliverToBoxAdapter(
              child: largeTitle,
            ),
          ),
          SliverPadding(
            padding: removePadding ? EdgeInsets.zero : EdgeInsets.symmetric(horizontal: primaryPaddingSize),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                body,
              )
            ),
          )
        ],
      );
  }
}