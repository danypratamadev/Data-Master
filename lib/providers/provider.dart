import 'dart:convert';
import 'dart:io';

import 'package:data_master/models/mmaster_data.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class MainProvider extends ChangeNotifier {

  //! GLOBAL VARIABLE **************************************************************************
  double textScaleFactor = 1.0;

  bool darkMode = false;
  bool showCardShadow = true;
  bool showCardBorder = false;

  List<MasterDataModel> listMasterData = <MasterDataModel>[];

  //! GLOBAL METHOD ****************************************************************************
  onRefresh({required BuildContext context, required int action}){

  }

  chooseFile() async {
    
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowMultiple: false,
      allowedExtensions: ['txt'],
    );
    if(result != null){
      listMasterData.clear();

      PlatformFile pfile = result.files.first;
      final file = File(pfile.path!);
      String value = await file.readAsString();

      List<String> listValue = value.replaceAll('\n', ',').split(',').toList();
      String kode = '-';
      String nama = '-';
      for(int i = 0; i < listValue.length; i++){
        print('LOOP KE -> $i');
        if(i % 2 == 1){
          nama = listValue[i];
          MasterDataModel data = MasterDataModel(kodeBarang: kode, namaBarang: nama);
          listMasterData.add(data);
          kode = '-';
          nama = '-';
        } else {
          kode = listValue[i];
        }
      }
      notifyListeners();
      print('JUMLAH DATA -> ${listValue.length}');
      print('JUMLAH DATA TERSIMPAN -> ${listMasterData.length}');
    }
  }

}