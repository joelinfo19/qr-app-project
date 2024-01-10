

import '../models/scan_model.dart';

import 'package:flutter/material.dart';

class ScanListProvider extends ChangeNotifier{

  List<ScanModel> scans=[];
  nuevoScan(String valor) async{
    final nuevoScan=new ScanModel(name: valor);

  }
}