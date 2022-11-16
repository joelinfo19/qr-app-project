
import 'package:flutter/material.dart';
import 'package:qr_project/widgets/scan_button.dart';

class HomePage extends StatelessWidget{
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
        centerTitle: true,
      ),
      body: Center(child: Text('Holaaaa')),
      floatingActionButton: ScanButton(),

    );
  }
}

