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
        expandedHeight: sizedBox55,
        body: [
          Consumer<MainProvider>(
            builder: (contextt, value, child) => GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              crossAxisSpacing: tertiaryPaddingSize,
              mainAxisSpacing: tertiaryPaddingSize,
              physics: NeverScrollableScrollPhysics(),
              children: value.listMainMenu.map((menu) => RoundedCard(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: (){
                      mainProvider.onClickMainMenu(context: context, action: menu.action);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: secondaryPaddingSize, vertical: secondaryPaddingSize),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            menu.icon,
                            size: secondaryAvatarSize,
                            color: menu.iconColor,
                          ),
                          SizedBox(height: smallPaddingSize,),
                          TitleText(
                            label: menu.title
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              )).toList(),
            ),
          ),
        ]
      ),
    );
  }
}