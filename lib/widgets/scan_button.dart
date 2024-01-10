import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
// import 'package:provider/provider.dart';


class ScanButton extends StatelessWidget {
  final String ?presentation;
  const ScanButton({Key? key,this.presentation}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation:0,
      child:Icon(Icons.filter_center_focus),
      onPressed:()async{
        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
                                                    '#3d8bef', 
                                                    'Cancelar', 
                                                    false, 
                                                    ScanMode.QR);

        // String barcodeTest="{\"name\": \"John Smith\",\"code\": \"171260\"}";  
       
   //{"name": "Cristina","code": "171549"}
        // print(barcodeScanRes);
        if(barcodeScanRes=='-1'){
          return;
        }
        Map<String, dynamic> userMap = await jsonDecode(barcodeScanRes);
        var users =  User.fromJson(userMap);
        
        // print('Howdy, ${users.name}!');
        // print('Howdy, ${users.code}!');
        final user=User(name: users.name,code: users.code, date: DateTime.now(),dni:users.dni,presentation: presentation);
        createUser(user);
        print('Howdy, ${presentation}!');
        print('Howdy, ${users.name}!');
        print('Howdy, ${users.code}!');
        print('Howdy, ${users.dni}!');

        // if(barcodeScanRes!=null||barcodeScanRes!='-1'||barcodeScanRes!=-1){
        //   Map<String, dynamic> userMap = await jsonDecode(barcodeScanRes);
        //   var users =  User.fromJson(userMap);
          
        //   // print('Howdy, ${users.name}!');
        //   // print('Howdy, ${users.code}!');
        //   final user=User(name: users.name,code: users.code, date: DateTime.now());
        //   createUser(user);
        //    print('Howdy, ${users.name}!');
        //   print('Howdy, ${users.code}!');
        // }else{
        //   print('NO SCAN');
        // }

      } );
  }
  Future createUser(User user) async{
    final docUser=FirebaseFirestore.instance.collection('users').doc();
    user.id=docUser.id;
    final json=user.toJson();
    await docUser.set(json);


  }
}
class User{
  late String id;
  final String name;
  final String code;
   DateTime ?date;
   final String dni;
  String ?presentation;

  User({
    this.id='',
    required this.name,    
    required this.code,
    this.date,
    required this.dni,
    this.presentation,

  });
  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        code = json['code'],
        dni = json['dni'];

  Map<String,dynamic> toJson()=>{
    'id':id,
    'name':name,
    'code':code,
    'date':date,
    'dni':dni,
    'presentation':presentation
  };

}





