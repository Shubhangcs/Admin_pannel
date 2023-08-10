import 'dart:convert';

import 'package:edwin_componant_admin/all_files/material_view.dart';
import 'package:edwin_componant_admin/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MaterialCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final String image;
  const MaterialCard(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.image});

  @override
  State<MaterialCard> createState() => _MaterialCardState();
}

class _MaterialCardState extends State<MaterialCard> {
    void deleteData() async {
    var resbody = {'name': widget.title};
    var send = await http.post(Uri.parse(deletematerials),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(resbody));
    var response = jsonDecode(send.body);
    if (response['status']) {
      materials.removeWhere((element) => element["name"] == widget.title);
    } else {
      setState(() {
        error();
      });
    }
  }

  void error() {
    var snackBar = const SnackBar(
      content: Text(
        'Error occured...',
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
      margin: const EdgeInsets.only(top: 10, right: 20, left: 20),
      width: double.infinity,
      height: 100,
      child: Card(
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 20),
              width: 60,
              height: 60,
              child: Image.network(widget.image),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 20),
                height: 60,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    Text(
                      widget.subtitle,
                      style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              decoration: BoxDecoration(
                  color: Colors.red.shade600,
                  borderRadius: BorderRadius.circular(6)),
              width: 60,
              height: 30,
              child: TextButton(
                onPressed: () {
                  deleteData();
                  Navigator.popAndPushNamed(context, '/materialview');
                },
                child: const Text(
                  'Delete',
                  style: TextStyle(color: Colors.white, fontSize: 13),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
