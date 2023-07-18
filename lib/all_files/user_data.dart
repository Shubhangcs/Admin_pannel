import 'package:edwin_componant_admin/models/user_data_card.dart';
import 'package:flutter/material.dart';


class UserData extends StatefulWidget {
  const UserData({super.key});

  @override
  State<UserData> createState() => _UserDataState();
}

class _UserDataState extends State<UserData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text('User Data'),),
      body: SafeArea(
        child: ListView.builder(itemBuilder: (context , index){
        return  UserDataCard(email: "hello", item: []);
        },itemCount: 5,),
      ),
    );
  }
}