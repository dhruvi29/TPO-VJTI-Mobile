import 'package:flutter/material.dart';
import 'package:supa_test/models/User.dart';
import 'package:supa_test/screens/auth/signin.dart';
import 'package:supa_test/screens/home_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Decision extends StatelessWidget {
  static const id = "decision";
  const Decision({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    user = Supabase.instance.client.auth.currentUser;


    return user == null?SignIn():const MyHomePage();
  }
}