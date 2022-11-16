import 'package:flutter/material.dart';
// import 'package:qr_project/src/pages/contador_page.dart';
import 'package:qr_project/src/pages/home_page.dart';
// import 'package:qr_project/src/pages/home_page.dart';


class MyApp extends StatelessWidget{

  @override
  Widget build(context){
    return MaterialApp(
       title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home:Center(child:ContadorPage( title: 'Flutter Demo Home Page'))
      // home:ContadorPage( title: 'Flutter Demo Home Page'),
            home:HomePage( ),

      
    );
  }
}