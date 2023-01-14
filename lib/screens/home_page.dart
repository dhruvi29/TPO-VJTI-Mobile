import 'package:flutter/material.dart';
import 'package:supa_test/models/User.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../components/drawer.dart';
import '../models/student.dart';

class MyHomePage extends StatefulWidget {
  static const id = "HomePage";

  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
// final supabase = Supabase.instance.client;



class _MyHomePageState extends State<MyHomePage> {
  Future<void> getUserData ()async {
      final data = await supabase
        .from('Students')
        .select('''*''').match({'id': '0173a65e-ac39-405c-8a92-e2fa1d6d49cb'});
    student = data[0];
    print(data);
    return data[0];
}
  @override
  Widget build(BuildContext context) {
    print(user);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
      ),
      body: SingleChildScrollView(child: Text(user?.id??'No ID')),
      drawer: Drawer(
        child: FutureBuilder(
          future: getUserData(),
          builder: ((context, snapshot) {
            return SingleChildScrollView(
            child: Column(
              children: [
                myHeaderDrawer(context),
                myDrawerList(context),
              ],
            ),
          );
          }),
        ),
      ),
    );
  }
}

