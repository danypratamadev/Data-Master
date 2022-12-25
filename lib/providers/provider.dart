import 'dart:io';
import 'package:data_master/interface/dialog-ui/dialog.dart';
import 'package:data_master/interface/texts-ui/headline3.dart';
import 'package:data_master/models/mmaster_data.dart';
import 'package:data_master/shared/variables.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';

class MainProvider extends ChangeNotifier {

  //! GLOBAL VARIABLE **************************************************************************
  double textScaleFactor = 1.0;

  bool darkMode = false;
  bool showCardShadow = true;
  bool showCardBorder = false;

  //! GLOBAL METHOD ****************************************************************************
  onRefresh({required BuildContext context, required int action}){

  }

  //? PUSH ROUTE METHOD
  pushRoute({required BuildContext context, required String route, bool passData = false, Map<String, dynamic> argument = const {'name': 'data'}}){
    if(passData){
      Navigator.of(context).pushNamed(route, arguments: argument);
    } else {
      Navigator.of(context).pushNamed(route);
    }
  }

  //? PUSH ROUTE METHOD
  pushReplacementRoute({required BuildContext context, required String route, bool passData = false, Map<String, dynamic> argument = const {'name': 'data'}}){
    if(passData){
      Navigator.of(context).pushReplacementNamed(route, arguments: argument);
    } else {
      Navigator.of(context).pushReplacementNamed(route);
    }
  }

  //? PUSH ROUTE METHOD
  pushRemoveUntilRoute({required BuildContext context, required String route, bool passData = false, Map<String, dynamic> argument = const {'name': 'data'}}){
    if(passData){
      Navigator.of(context).pushNamedAndRemoveUntil(route, (route) => false, arguments: argument);
    } else {
      Navigator.of(context).pushNamedAndRemoveUntil(route, (route) => false);
    }
  }

  //? ALERT DIALOG METHOD
  showAlertDialogApp({required BuildContext context, required String title, required String message, required bool dismissible, required List<CupertinoButton> action}){
    DialogApps.showAlertDialogApp(
      context: context, 
      title: Padding(
        padding: const EdgeInsets.only(bottom: sizedBox3),
        child: Headline3Text(
          label: title, 
          textAlign: TextAlign.center,
        ),
      ), 
      message: message, 
      textScaleFactor: textScaleFactor,
      dismissible: dismissible,
      action: action,
      darkMode: darkMode,
    );
  }
  

  //! MASTER PAGE ASSETS ***********************************************************************
  //? VARIABLE
  bool loadingGetData = false;
  bool buttonEnableMaster = false;
  bool buttonLoadingMaster = false;

  List<MasterDataModel> listMasterData = <MasterDataModel>[];

  //? METHOD
  chooseFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowMultiple: false,
      allowedExtensions: ['txt'],
    );
    if(result != null){
      loadingGetData = true;
      notifyListeners();

      PlatformFile pfile = result.files.first;
      final file = File(pfile.path!);
      String value = await file.readAsString();
      List<String> listValue = value.replaceAll('\n', ',').split(',').toList();

      String kode = '-';
      String nama = '-';
      List<MasterDataModel> listMasterDataTemp = <MasterDataModel>[];
      for(int i = 0; i < listValue.length; i++){
        print('LOOP KE -> $i');
        if(i % 2 == 1){
          nama = listValue[i];
          MasterDataModel data = MasterDataModel(kodeBarang: kode, namaBarang: nama);
          listMasterDataTemp.add(data);
          kode = '-';
          nama = '-';
        } else {
          kode = listValue[i];
        }
      }

      loadingGetData = false;
      listMasterData = listMasterDataTemp;
      if(listMasterData.isNotEmpty){
        buttonEnableMaster = true;
      }
      notifyListeners();
    }
  }

}