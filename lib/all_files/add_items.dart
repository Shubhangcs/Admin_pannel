import 'dart:convert';
import 'package:edwin_componant_admin/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddItems extends StatefulWidget {
  const AddItems({super.key});

  @override
  State<AddItems> createState() => _AddItemsState();
}

class _AddItemsState extends State<AddItems> {
  final componentName = TextEditingController();
  final description = TextEditingController();
  final imageLink = TextEditingController();

  void addComp() async {
    if (componentName.text.isNotEmpty &&
        description.text.isNotEmpty &&
        imageLink.text.isNotEmpty) {
      var resbody = {
        "name": componentName.text,
        "image": imageLink.text,
        "subtitle": description.text
      };
      var send = await http.post(Uri.parse(addcomp),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(resbody));
      var response = jsonDecode(send.body);
      if (response['status']) {
        navigate();
      } else {
        resError();
      }
    }
  }
  void navigate(){
  Navigator.popAndPushNamed(context, '/addcomponents');
  }

  void resError() {
    var snackBar = const SnackBar(
      content: Text(
        'Error occured during sending the data',
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Components',
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
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
                        'Components',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        margin:
                            const EdgeInsets.only(left: 60, right: 60, top: 60),
                        child: TextField(
                          controller: componentName,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              labelText: 'Components name'),
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
                          controller: imageLink,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            labelText: 'Image link',
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 40),
                        child: ElevatedButton(
                          onPressed: () {
                            addComp();
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
