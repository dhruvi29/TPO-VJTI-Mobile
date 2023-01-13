import 'package:flutter/material.dart';
import '../components/drawer.dart';

class MyHomePage extends StatefulWidget {
  static const id = "HomePage";

  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
      ),
      body: SingleChildScrollView(child: Text("hello")),
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

