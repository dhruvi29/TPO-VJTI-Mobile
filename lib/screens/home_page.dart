import 'package:flutter/material.dart';
import 'package:supa_test/models/User.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../components/drawer.dart';

class MyHomePage extends StatefulWidget {
  static const id = "HomePage";

  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
// final supabase = Supabase.instance.client;

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    print(user);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
      ),
      body: SingleChildScrollView(child: Text(user?.id??'No ID')),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              myHeaderDrawer(context),
              myDrawerList(context),
            ],
          ),
        ),
      ),
    );
  }
}

