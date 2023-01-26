import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supa_test/models/student_user.dart';
import 'package:supa_test/screens/auth/signin.dart';
import 'package:supa_test/screens/home_page.dart';

class Decision extends StatelessWidget {
  static const id = "decision";
  const Decision({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    StudentUser? user = Provider.of<StudentUser?>(context);
    return user == null?SignIn():const MyHomePage();
  }
}