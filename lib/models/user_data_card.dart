import 'dart:convert';

import 'package:edwin_componant_admin/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserDataCard extends StatefulWidget {
  final String email;
  final List item;
  const UserDataCard({super.key, required this.email, required this.item});

  @override
  State<UserDataCard> createState() => _UserDataCardState();
}

class _UserDataCardState extends State<UserDataCard> {
  Future<void> returnedComponents() async {
    var res = {
      "name": widget.email,
      "items":widget.item
    };
    var response = await http.post(Uri.parse(deleteuserdata),
        body: jsonEncode(res), headers: {"Content-Type": "application/json"});
    var jsonResponse = jsonDecode(response.body);
    if (jsonResponse['status']) {
      // ignore: use_build_context_synchronously
      Navigator.popAndPushNamed(context, '/userdata');
    } else {
      error();
    }
  }

  void error() {
    var snackBar = const SnackBar(
      content: Text(
        'Email already exist',
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
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      width: double.infinity,
      height: 350,
      child: Card(
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20),
              width: 300,
              child: Text(widget.email),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 20),
                height: 300,
                child: Column(
                  children: [
                    SingleChildScrollView(
                      child: SizedBox(
                        width: double.infinity,
                        height: 290,
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return SizedBox(
                              width: 100,
                              height: 100,
                              child: Card(
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(left: 27),
                                        width: 60,
                                        height: 60,
                                        child: Image.network(
                                            widget.item[index]['image']),
                                      ),
                                      Container(
                                        width: 1150,
                                        margin: const EdgeInsets.only(left: 20),
                                        height: 60,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(widget.item[index]['name']),
                                            Text(widget.item[index]['subtitle'])
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(left: 20),
                                        child: Text('date and time'),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          itemCount: widget.item.length,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              width: 80,
              height: 30,
              decoration: BoxDecoration(
                  color: Colors.red.shade600,
                  borderRadius: const BorderRadius.all(Radius.circular(6))),
              child: TextButton(
                onPressed: () {
                  returnedComponents();
                },
                child: const Text(
                  'Returned',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
