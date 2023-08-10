import 'package:edwin_componant_admin/all_files/admin_main.dart';
import 'package:edwin_componant_admin/all_files/components.dart';
import 'package:edwin_componant_admin/all_files/material_view.dart';
import 'package:edwin_componant_admin/all_files/user_data.dart';
import 'package:flutter/material.dart';

import 'all_files/add_items.dart';
import 'all_files/materials.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     home:const AdminMain(),
     routes: {
      '/component':(context) => const Components(),
      '/addcomponents':(context) => const AddItems(),
      '/userdata':(context) => const UserData(),
      '/materialpage':(context) => const Materials(),
      '/materialview':(context) => const MaterialViews()
     },
    );
  }
}
