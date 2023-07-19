import 'dart:convert';
import 'package:edwin_componant_admin/constants.dart';
import 'package:edwin_componant_admin/models/user_data_card.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

List data = [];
class UserData extends StatefulWidget {
  const UserData({super.key});

  @override
  State<UserData> createState() => _UserDataState();
}

class _UserDataState extends State<UserData> {

@override
  void initState() {
    super.initState();
    getUserData();
  }
  void getUserData()async{
    var request =await http.get(Uri.parse(userdata));
    final res = jsonDecode(request.body);
    setState(() {
      data = res;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text('User Data' , style: TextStyle(color: Colors.white , fontSize: 25 , fontWeight: FontWeight.bold),),),
      body: SafeArea(
        child: ListView.builder(itemBuilder: (context , index){
        return  UserDataCard(email: data[index]['name'], item: data[index]['items']);
        },itemCount: data.length,),
      ),
    );
  }
}