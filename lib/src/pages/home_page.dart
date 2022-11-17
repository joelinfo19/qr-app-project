
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:qr_project/widgets/scan_button.dart';

class HomePage extends StatelessWidget{
  final controllerName=TextEditingController();
  final controllerCode=TextEditingController();



  InputDecoration decoration(String label)=>InputDecoration(
      labelText: label,
      border: OutlineInputBorder(),
    );
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('QR PROJECT'),
        centerTitle: true,
        // actions: [
        //   IconButton(onPressed: (){
        //     final name=controller.text;
        //     createUser(name: name);
        //   }, icon: Icon(Icons.add))
        // ],
      ),
      body: ListView(
        padding:EdgeInsets.all(16),
        children:<Widget> [
       
            TextField(
              controller: controllerName,
              decoration: decoration('Name'),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: controllerCode,
              decoration: decoration('Code'),

            ),
            const SizedBox(height: 24),
            OutlinedButton(onPressed: (){
              final user=User(name: controllerName.text,code: controllerCode.text, date: DateTime.now());
              createUser(user);
              const snackBar = SnackBar(
                content: Text("USUARIO AGREGADO"),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);

              // Navigator.pop(context);
            }, child: Text('Create'), style:ElevatedButton.styleFrom(onPrimary: Colors.blue,)),
      
      ],
      ),
      floatingActionButton: ScanButton(),

    );
    
  }
  
  Future createUser(User user) async{
    final docUser=FirebaseFirestore.instance.collection('users').doc();
    user.id=docUser.id;
    final json=user.toJson();
    await docUser.set(json);


  }
}

class User{
  String id;
  final String name;
  final String code;
  final DateTime date;

  User({
    this.id='',
    required this.name,    
    required this.code,
    required this.date
  });

  Map<String,dynamic> toJson()=>{
    'id':id,
    'name':name,
    'code':code,
    'date':date
  };

}

