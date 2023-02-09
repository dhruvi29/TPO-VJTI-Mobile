import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supa_test/models/student_user.dart';
import 'package:supa_test/screens/auth/signin.dart';
import 'package:supa_test/screens/home_page.dart';
import 'package:supa_test/screens/profile/set__profile.dart';

import 'constants/supabse_client.dart';

class Decision extends StatelessWidget {
  static const id = "decision";
  const Decision({Key? key}) : super(key: key);
  Future<bool> gethasSetProfile(id) async {
    final hasSetProfile =
        await supabase.from('Students').select('hasSetProfile').eq("id", id);

    return hasSetProfile[0]["hasSetProfile"];
  }

  @override
  Widget build(BuildContext context) {
    StudentUser? user = Provider.of<StudentUser?>(context);
    // return user == null ? SignIn() : const MyHomePage();
    if (user == null) {
      print("No login YET");
      return SignIn();
    } else {
      return FutureBuilder(
          future: gethasSetProfile(user.userID),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              var data = snapshot.data;
              if (data == true) {
                print("Profile SET");
                return const MyHomePage();
              } else if (data == false) {
                print("Profile NOT SET");
                return const SetProfile();
              }
            }
            return const Scaffold(
                body: Center(child: CircularProgressIndicator()));
          });
    }
  }
}
