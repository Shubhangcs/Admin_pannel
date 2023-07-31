import 'package:flutter/material.dart';



class UserDetails extends StatefulWidget {
  const UserDetails({super.key});

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
      ),
      body: Container(
        child: ListView.builder(itemBuilder: (context , index){
            return Container(
              margin: EdgeInsets.only(left: 60 , right: 60 , top: 10),
              width: 100,
              height: 80,
              child: Column(
                
              ),
            );
        }, itemCount: 5,),
      ),
    );
  }
}