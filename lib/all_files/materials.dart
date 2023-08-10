import 'dart:convert';

import 'package:edwin_componant_admin/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Materials extends StatefulWidget {
  const Materials({super.key});

  @override
  State<Materials> createState() => _MaterialsState();
}

class _MaterialsState extends State<Materials> {

  Future<void> addMaterials()async{
    var res = {
      "name":materialName.text,
      "subtitle":description.text,
      "link":materialPath.text
    };
    var response = await http.post(Uri.parse(addmaterials) , body: jsonEncode(res) , headers: {"Content-Type":"application/json"});
    var jsonResponse = jsonDecode(response.body);
    if(jsonResponse['status']){
      navigateTo();
    }
    else{
      showSnack();
    }
  }

  void navigateTo(){
    Navigator.popAndPushNamed(context, '/materialpage');
  }


  void showSnack(){
     var snackBar = const SnackBar(
      content: Text(
        'Error occured',
        style: TextStyle(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      elevation: 10,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }


  final materialName = TextEditingController();
  final description = TextEditingController();
  final materialPath = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text('Add Materials' , style: TextStyle(color: Colors.white , fontSize: 25 , fontWeight: FontWeight.bold),),),
       body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 170, left: 200, right: 200),
                width: double.infinity,
                height: 600,
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        'Materials',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        margin:
                            const EdgeInsets.only(left: 60, right: 60, top: 60),
                        child: TextField(
                          controller: materialName,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              labelText: 'Book name'),
                        ),
                      ),
                      Container(
                        margin:
                            const EdgeInsets.only(left: 60, right: 60, top: 60),
                        child: TextField(
                          controller: description,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              labelText: 'Description'),
                        ),
                      ),
                      Container(
                        margin:
                            const EdgeInsets.only(left: 60, right: 60, top: 60),
                        child: TextField(
                          controller: materialPath,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            labelText: 'Material link',
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 40),
                        child: ElevatedButton(
                          onPressed: () {
                            addMaterials();
                          },
                          child: const Text('Submit'),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}