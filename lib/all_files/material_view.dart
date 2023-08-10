import 'dart:convert';
import 'package:edwin_componant_admin/constants.dart';
import 'package:edwin_componant_admin/models/material_card.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
  List materials = [];

class MaterialViews extends StatefulWidget {
  const MaterialViews({super.key});

  @override
  State<MaterialViews> createState() => _MaterialViewsState();
}

class _MaterialViewsState extends State<MaterialViews> {



      @override
  void initState() {
    super.initState();
    getcomponants();
  }

  Future<void> getcomponants() async {
    final response = await http.get(Uri.parse(displaymaterials));
    final res = jsonDecode(response.body);
    setState(() {
      materials = res;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Materials',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return MaterialCard(title: materials[index]['name'], subtitle: materials[index]['subtitle'], image: 'assets/logo.png' ,);
          },
          itemCount: materials.length,
        ),
      ),
    );
  }
}