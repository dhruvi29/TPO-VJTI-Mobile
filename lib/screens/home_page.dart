import 'package:flutter/material.dart';
import 'package:supa_test/models/User.dart';
import 'package:supa_test/screens/calender.dart';
import 'package:supa_test/screens/profile/student_profile.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../components/drawer.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../models/student.dart';
import 'application/applications_list.dart';
import 'auth/signin.dart';
import 'job/jobs_list.dart';

final supabase = Supabase.instance.client;

class MyHomePage extends StatefulWidget {
  static const id = "HomePage";

  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
// final supabase = Supabase.instance.client;

class _MyHomePageState extends State<MyHomePage> {
  Future<void> getUserData() async {
    final data =
        await supabase.from('Students').select('''*''').match({'id': user!.id});

    Student.student = data[0];
    return data[0];
  }

  @override
  Widget build(BuildContext context) {
    print(user);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.person,
              color: Colors.white,
            ),
            onPressed: (() => Navigator.pushNamed(context, StudentProfile.id))),
        title: const Text("TPO VJTI"),
        actions: [
          IconButton(
              icon: Icon(
                Icons.logout,
                color: Colors.white,
              ),
              onPressed: () {
                supabase.auth.signOut();
                Navigator.pushReplacementNamed(context, SignIn.id);
              })
        ],
      ),
      body: FutureBuilder(
        future: getUserData(),
        builder: ((context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 2.0),
              child: GridView.count(
                crossAxisCount: 2,
                padding: EdgeInsets.all(3.0),
                children: <Widget>[
                  makeDashboardItem(
                      "Hello, ${snapshot.data['firstName']}",
                      Icons.person,
                      () => Navigator.pushNamed(context, StudentProfile.id)),
                  makeDashboardItem("My Applications", Icons.document_scanner,
                      () => Navigator.pushNamed(context, ApplicationList.id)),
                  makeDashboardItem(
                      "TPO Schedule",
                      Icons.calendar_month,
                      () => Navigator.pushNamed(
                            context,
                            Calender.id,
                          )),
                  makeDashboardItem("Past Experiences", Icons.add_reaction,
                      () async {
                    try {
                      await launchUrlString(
                          "https://drive.google.com/drive/folders/1BCKFtr9FWDI0iJ74bTYJdsYS74uKBq98?usp=sharing");
                    } catch (err) {
                      debugPrint('Something bad happened');
                    }
                  }),
                  makeDashboardItem(
                      "Search Jobs",
                      Icons.search,
                      () => Navigator.pushNamed(context, AllJobs.id)),
                  makeDashboardItem(
                      "Notifications", Icons.notifications_active, null),
                ],
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        }),
      ),
    );
  }

  Card makeDashboardItem(String title, IconData icon, onPressed) {
    return Card(
        elevation: 1.0,
        margin: EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(color: Color.fromARGB(178, 255, 226, 139)),
          child: InkWell(
            onTap: onPressed,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                SizedBox(height: 50.0),
                Center(
                    child: Icon(
                  icon,
                  size: 40.0,
                  color: Colors.amber,
                )),
                SizedBox(height: 20.0),
                Center(
                  child: Text(title,
                      style: TextStyle(fontSize: 18.0, color: Colors.black)),
                )
              ],
            ),
          ),
        ));
  }
}
