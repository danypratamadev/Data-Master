import 'package:data_master/interface/cards-ui/roundedcard.dart';
import 'package:data_master/interface/pages-ui/scrollpage.dart';
import 'package:data_master/interface/texts-ui/body.dart';
import 'package:data_master/interface/texts-ui/headline1.dart';
import 'package:data_master/interface/texts-ui/overline.dart';
import 'package:data_master/interface/texts-ui/title.dart';
import 'package:data_master/providers/provider.dart';
import 'package:data_master/shared/variables.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class MasterPage extends StatelessWidget {
  const MasterPage({super.key});

  @override
  Widget build(BuildContext context) {

    final mainProvider = Provider.of<MainProvider>(context, listen: false);
    final themeApp = Theme.of(context);

    return Scaffold(
      body: AppScrollPage(
        title: 'Data Master', 
        largeTitle: Headline1Text(label: 'Data Master'),
        body: [
          RoundedCard(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: (){
                  mainProvider.chooseFile();
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: secondaryPaddingSize, vertical: primaryPaddingSize),
                  child: Column(
                    children: [
                      Icon(
                        Iconsax.folder_open,
                        size: sizedBox72,
                        color: themeApp.primaryColor.withOpacity(0.25),
                      ),
                      SizedBox(height: tertiaryPaddingSize,),
                      TitleText(
                        label: 'Pilih file',
                        customColor: true,
                        textColor: themeApp.primaryColor,
                      )
                    ],
                  ),
                ),
              ),
            )
          ),
          SizedBox(height: primaryPaddingSize,),
          Consumer<MainProvider>(
            builder: (contextt, value, child) => value.listMasterData.isNotEmpty ? RoundedCard(
              child: ListView.separated(
                itemCount: 50,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: secondaryPaddingSize, vertical: tertiaryPaddingSize),
                  child: Column(
                    children: [
                      OverlineText(
                        label: 'Kode Barang'
                      ),
                      BodyText(
                        label: value.listMasterData[(value.listMasterData.length - 1) - index].kodeBarang,
                      ),
                      SizedBox(height: smallPaddingSize,),
                      OverlineText(
                        label: 'Nama Barang'
                      ),
                      BodyText(
                        label: value.listMasterData[(value.listMasterData.length - 1) - index].namaBarang,
                      ),
                    ],
                  ),
                ), 
                separatorBuilder: (context, index) => Divider(
                  height: secondaryDividerSize,
                  thickness: secondaryDividerSize,
                  indent: secondaryPaddingSize,
                ), 
              ),
            ) : SizedBox(),
          ),
        ]
      )
    );
  }
}