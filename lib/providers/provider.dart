import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class MainProvider extends ChangeNotifier {

  //! GLOBAL VARIABLE **************************************************************************
  double textScaleFactor = 1.0;

  bool darkMode = false;
  bool showCardShadow = true;
  bool showCardBorder = false;

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
      
    }
  }

}