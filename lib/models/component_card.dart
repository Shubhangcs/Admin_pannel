import 'dart:convert';
import 'package:edwin_componant_admin/all_files/components.dart';
import 'package:edwin_componant_admin/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ComopnentCard extends StatefulWidget {
  
  final String title;
  final String subtitle;
  final String image;
  const ComopnentCard(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.image});

  @override
  State<ComopnentCard> createState() => _ComopnentCardState();
}

class _ComopnentCardState extends State<ComopnentCard> {
  void deleteData() async {
    var resbody = {'name': widget.title};
    var send = await http.post(Uri.parse(deletedata),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(resbody));
    var response = jsonDecode(send.body);
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
                  setState(() {
                    var snackBar = const SnackBar(
                      content: Text(
                        'Deleted Successfully',
                        style: TextStyle(color: Colors.black),
                      ),
                      backgroundColor: Colors.white,
                      elevation: 10,
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    Navigator.popAndPushNamed(context, '/component' );
                    data.removeWhere((element) => element["name"] == widget.title);
                  });
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
