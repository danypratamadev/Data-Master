import 'package:data_master/interface/buttons-ui/elevatedbutton.dart';
import 'package:data_master/interface/cards-ui/roundedcard.dart';
import 'package:data_master/interface/pages-ui/scrollpage.dart';
import 'package:data_master/interface/texts-ui/body.dart';
import 'package:data_master/interface/texts-ui/headline1.dart';
import 'package:data_master/interface/texts-ui/headline3.dart';
import 'package:data_master/interface/texts-ui/overline.dart';
import 'package:data_master/interface/texts-ui/subtitle.dart';
import 'package:data_master/interface/texts-ui/title.dart';
import 'package:data_master/providers/provider.dart';
import 'package:data_master/shared/theme.dart';
import 'package:data_master/shared/variables.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';

class MasterPage extends StatelessWidget {
  const MasterPage({super.key});

  @override
  Widget build(BuildContext context) {

    final mainProvider = Provider.of<MainProvider>(context, listen: false);
    final themeApp = Theme.of(context);

    return Stack(
      children: [
        Positioned(
          left: 0.0,
          right: 0.0,
          top: 0.0,
          bottom: 0.0,
          child: Scaffold(
            body: AppScrollPage(
              title: 'Data Master', 
              largeTitle: Headline1Text(label: 'Data Master'),
              showLeading: true,
              leadingWidget: IconButton(
                icon: Icon(
                  Icons.arrow_back_rounded,
                ),
                onPressed: (){
                  Navigator.pop(context);
                }, 
              ),
              body: [
                Consumer<MainProvider>(
                  builder: (contextt, value, child) => RoundedCard(
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: !value.loadingGetData ? (){
                          mainProvider.chooseFile();
                        } : null,
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
                ),
                SizedBox(height: primaryPaddingSize,),
                Consumer<MainProvider>(
                  builder: (contextt, value, child) => Row(
                    children: [
                      Expanded(
                        child: Headline3Text(
                          label: 'Daftar Barang',
                          fontFamily: jakartaBold,
                        ),
                      ),
                      if(value.loadingGetData)
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CupertinoActivityIndicator(
                            radius: sizedBox8,
                          ),
                          SizedBox(width: sizedBox5,),
                          SubtitleText(
                            label: 'Loading...',
                            customColor: true,
                            textColor: themeApp.disabledColor,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: smallPaddingSize,),
                Consumer<MainProvider>(
                  builder: (contextt, value, child) => value.listMasterData.isNotEmpty ? RoundedCard(
                    child: ListView.separated(
                      itemCount: 50,
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: NeverScrollableScrollPhysics(),
                      reverse: true,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: secondaryPaddingSize, vertical: tertiaryPaddingSize),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                ),SizedBox(height: sizedBox72 + sizedBox72,),
              ]
            )
          ),
        ),
        Positioned(
          left: 0.0,
          right: 0.0,
          bottom: 0.0,
          child: Container(
            color: themeApp.scaffoldBackgroundColor,
            child: Column(
              children: [
                Divider(
                  height: 0.0,
                  thickness: primaryDividerSize,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: primaryPaddingSize, right: primaryPaddingSize, bottom: primaryPaddingSize, top: secondaryPaddingSize),
                  child: Consumer<MainProvider>(
                    builder: (contextt, value, child) => ElevatedButtonApp(
                      label: 'Simpan Data', 
                      onTap: () {

                      }, 
                      buttonEnable: value.buttonEnableMaster, 
                      loadingEnable: value.buttonLoadingMaster,
                      textScaleFactor: value.textScaleFactor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}