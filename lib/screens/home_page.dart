import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supa_test/models/student_user.dart';
import 'package:supa_test/services/auth_service.dart';
import 'package:supa_test/services/student_service.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'package:supa_test/screens/calender.dart';
import 'package:supa_test/screens/profile/student_profile.dart';
import 'package:supa_test/models/student.dart';
import 'package:supa_test/screens/application/applications_list.dart';
import 'package:supa_test/screens/auth/signin.dart';
import 'package:supa_test/screens/job/jobs_list.dart';
import 'package:supa_test/widgets/dashboard_item.dart';

class MyHomePage extends StatefulWidget {
  static const id = "HomePage";

  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Student? studentVar = Provider.of<Student?>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(
              Icons.person,
              color: Colors.white,
            ),
            onPressed: (() => Navigator.pushNamed(context, StudentProfile.id))),
        title: const Text("TPO VJTI"),
        actions: [
          IconButton(
              icon: const Icon(
                Icons.logout,
                color: Colors.white,
              ),
              onPressed: () {
                AuthService().signOut();
                Navigator.pushReplacementNamed(context, SignIn.id);
              })
        ],
      ),
      body: studentVar == null ? Container():Container(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 2.0),
        child: GridView.count(
          crossAxisCount: 2,
          padding: const EdgeInsets.all(3.0),
          children: <Widget>[
            makeDashboardItem("Hello, ${studentVar.firstName}", Icons.person,
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
            }
            ),
            makeDashboardItem("Search Jobs", Icons.search,
                () => Navigator.pushNamed(context, AllJobs.id)),
            makeDashboardItem("Announcements", Icons.announcement, null),
          ],
        ),
      ),
    );
  }
}
