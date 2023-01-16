// ununsed currently, for future use

import 'package:flutter/material.dart';
import 'package:supa_test/screens/application/applications_list.dart';
import 'package:supa_test/screens/calender.dart';
import 'package:supa_test/screens/job/job_display.dart';
import 'package:supa_test/screens/job/jobs_list.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart';


import '../screens/auth/signin.dart';
import '../models/student.dart' as s;
import 'circular_image.dart';
import 'list_tile.dart';

final supabase = Supabase.instance.client;


Widget myHeaderDrawer(BuildContext context) {
  return Container(
    width: double.infinity,
    color: Colors.amber,
    padding: const EdgeInsets.only(top: 60),
    child: Column(
      children: [
        CircleAvatar(backgroundColor: Colors.white, child: Text("${s.Student.student['firstName'][0]}${s.Student.student['lastName'][0]}")),
        Text("${s.Student.student['firstName']} ${s.Student.student['lastName']}"),
        TextButton(
            onPressed: (() {
              Navigator.pop(context);
              Navigator.pushNamed(context, s.Student.student.id);
            }),
            child: const Text("View Profile",
                style: TextStyle(color: Colors.white)))
      ],
    ),
  );
}

Widget myDrawerList(BuildContext context) {
  return Container(
    padding: EdgeInsets.all(20),
    child: Column(
      children: [
        CustomListTile(icon: Icons.notifications_active,titleString: "Notifications"),
        const Divider(),
        CustomListTile(icon: Icons.search,titleString: "Search Jobs",onPressed:()=>
          Navigator.pushNamed(context, AllJobs.id)),
        CustomListTile(icon: Icons.document_scanner,titleString: "Application Status",onPressed: ()=>Navigator.pushNamed(context, ApplicationList.id)),
        const Divider(),
        CustomListTile(icon: Icons.calendar_month,titleString: "Schedule",onPressed: ()=>Navigator.pushNamed(context, Calender.id,)),
        const Divider(),
        CustomListTile(icon: Icons.add_reaction,titleString: "Past Experiences",onPressed: () async {
                          try {
                            await launchUrlString(
                                "https://drive.google.com/drive/folders/1BCKFtr9FWDI0iJ74bTYJdsYS74uKBq98?usp=sharing");
                          } catch (err) {
                            debugPrint('Something bad happened');
                          }
                        },),
        const Divider(),
        CustomListTile(icon: Icons.logout,titleString: "Logout",onPressed: (){
          supabase.auth.signOut();
          Navigator.pushReplacementNamed(context, SignIn.id);
        },),
        
      ],
    ),
  );
}
