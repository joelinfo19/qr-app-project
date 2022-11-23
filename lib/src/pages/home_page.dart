
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:qr_project/widgets/scan_button.dart';

class HomePage extends StatefulWidget{
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controllerName=TextEditingController();

  final controllerCode=TextEditingController();
  final controllerDni=TextEditingController();
  String dropdownvalue = 'Ponencia 1'; 
   var items = [   
    'Ponencia 1',
    'Ponencia 2',
    'Ponencia 3',
    'Ponencia 4',
    'Ponencia 5',
     'Ponencia 6',
    'Ponencia 7',
    'Ponencia 8',
    'Ponencia 9',
    'Ponencia 10',
     'Ponencia 11',
    'Ponencia 12',
    'Ponencia 13',
    'Ponencia 14',
    'Ponencia 15',
     'Ponencia 16',
    'Ponencia 17',
    'Ponencia 18',
    'Ponencia 19',
    'Ponencia 20',
     'Ponencia 21',
    'Ponencia 22',
    'Ponencia 23',
    'Ponencia 24',
    'Ponencia 25',
     'Ponencia 26',
    'Ponencia 27',
    'Ponencia 28',
    'Ponencia 29',
    'Ponencia 30',
     'Ponencia 31',
    'Ponencia 32',
    'Ponencia 33',
    'Ponencia 34',
    'Ponencia 35',
     'Ponencia 36',
    'Ponencia 37',
    'Ponencia 38',
    'Ponencia 39',
    'Ponencia 40',
     'Ponencia 41',
    'Ponencia 42',
    'Ponencia 43',
    'Ponencia 44',
    'Ponencia 45',
  ];

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
            TextField(
              controller: controllerDni,
              decoration: decoration('Dni'),
            ),
            const SizedBox(height: 24),

            DropdownButton(value: dropdownvalue,icon: const Icon(Icons.keyboard_arrow_down),items: items.map((String items){
              return DropdownMenuItem(
                value:items,
                child: Text(items),
              );
            }).toList(),
             onChanged: (String ?newValue){
              setState(() {
                dropdownvalue=newValue!;
              });
            }),
            const SizedBox(height: 24),
            OutlinedButton(onPressed: (){
              final user=User(name: controllerName.text,code: controllerCode.text, date: DateTime.now(),dni: controllerDni.text,presentation: dropdownvalue);
              createUser(user);
              const snackBar = SnackBar(
                content: Text("USUARIO AGREGADO"),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);

              // Navigator.pop(context);
            }, child: Text('Create'), style:ElevatedButton.styleFrom(onPrimary: Colors.blue,)),
      
      ],
      ),
      floatingActionButton: ScanButton(presentation:dropdownvalue),

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
  final String dni;
  String ?presentation;

  User({
    this.id='',
    required this.name,    
    required this.code,
    required this.date,
    required this.dni,
    this.presentation
  });

  Map<String,dynamic> toJson()=>{
    'id':id,
    'name':name,
    'code':code,
    'date':date,
    'dni':dni,
    'presentation':presentation,
  };

}

