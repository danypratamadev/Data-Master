import 'package:data_master/interface/pages-ui/scrollpage.dart';
import 'package:data_master/interface/texts-ui/headline1.dart';
import 'package:flutter/material.dart';

class MasterPage extends StatelessWidget {
  const MasterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppScrollPage(
        title: 'Data Master', 
        largeTitle: Headline1Text(label: 'Data Master'),
        body: [
          
        ]
      )
    );
  }
}