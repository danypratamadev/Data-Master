import 'package:data_master/interface/cards-ui/roundedcard.dart';
import 'package:data_master/interface/pages-ui/scrollpage.dart';
import 'package:data_master/interface/texts-ui/caption.dart';
import 'package:data_master/interface/texts-ui/headline1.dart';
import 'package:data_master/interface/texts-ui/title.dart';
import 'package:data_master/providers/provider.dart';
import 'package:data_master/shared/variables.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    final mainProvider = Provider.of<MainProvider>(context, listen: false);
    final themeApp = Theme.of(context);

    return Scaffold(
      body: AppScrollPage(
        title: 'Beranda', 
        largeTitle: Headline1Text(label: 'Beranda'), 
        showLeading: true,
        leadingWidget: IconButton(
          icon: Icon(
            Icons.close_rounded,
          ),
          onPressed: (){
            Navigator.pop(context);
          }, 
        ),
        body: [
          RoundedCard(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: (){
                  mainProvider.pushRoute(context: context, route: masterRoute);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: secondaryPaddingSize, vertical: tertiaryPaddingSize),
                  child: Column(
                    children: [
                      Icon(
                        Iconsax.folder,
                        size: secondaryAvatarSize,
                        color: themeApp.primaryColor,
                      ),
                      SizedBox(height: smallPaddingSize,),
                      TitleText(
                        label: 'Data Master'
                      ),
                    ],
                  ),
                ),
              ),
            )
          )
        ]
      ),
    );
  }
}