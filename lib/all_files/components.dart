import 'dart:convert';

import 'package:edwin_componant_admin/models/component_card.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import '../constants.dart';

List data = [];

class Components extends StatefulWidget {
  const Components({super.key});

  @override
  State<Components> createState() => _ComponentsState();
}

class _ComponentsState extends State<Components> {


    @override
  void initState() {
    super.initState();
    getcomponants();
  }

  Future<void> getcomponants() async {
    final response = await http.get(Uri.parse(componants));
    final res = jsonDecode(response.body);
    setState(() {
      data = res;
    });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Components',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return ComopnentCard(title: data[index]['name'], subtitle: data[index]['subtitle'], image: data[index]['image'] ,);
          },
          itemCount: data.length,
        ),
      ),
    );
  }
}
