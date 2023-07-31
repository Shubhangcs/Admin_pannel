import 'package:edwin_componant_admin/all_files/add_items.dart';
import 'package:edwin_componant_admin/all_files/components.dart';
import 'package:edwin_componant_admin/all_files/user_data.dart';
import 'package:edwin_componant_admin/all_files/user_details.dart';
import 'package:flutter/material.dart';

import 'materials.dart';

class AdminMain extends StatefulWidget {
  const AdminMain({super.key});

  @override
  State<AdminMain> createState() => _AdminMainState();
}

class _AdminMainState extends State<AdminMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ADMIN PANNEL',
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          children: [
            DrawerHeader(
                child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 50),
                  width: 80,
                  height: 80,
                  child: Image.asset('logo.png'),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 50, left: 20),
                  child: const Text(
                    'Edwin\'s Component \nLibrary',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Components()),
                );
              },
              child: const ListTile(
                leading: Icon(Icons.desktop_mac_sharp),
                title: Text(
                  'Components',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                subtitle: Text(
                  'the user components',
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.normal,
                      fontSize: 13),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UserDetails()));
              },
              child: const ListTile(
                leading: Icon(Icons.account_tree),
                title: Text(
                  'User Details',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                subtitle: Text(
                  'user information',
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.normal,
                      fontSize: 13),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const UserData()));
              },
              child: const ListTile(
                leading: Icon(Icons.person),
                title: Text(
                  'User Data',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                subtitle: Text(
                  'user activity',
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.normal,
                      fontSize: 13),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const AddItems()));
              },
              child: const ListTile(
                leading: Icon(Icons.create_new_folder),
                title: Text(
                  'Add Components',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                subtitle: Text(
                  'to add new items',
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.normal,
                      fontSize: 13),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Materials()));
              },
              child: const ListTile(
                leading: Icon(Icons.book_sharp),
                title: Text(
                  'Add Materials',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
                subtitle: Text(
                  'to add new study materials',
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.normal,
                      fontSize: 13),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
