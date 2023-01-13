import 'package:flutter/material.dart';
import 'package:supa_test/screens/application/applications_list.dart';
import 'package:supa_test/screens/calender.dart';
import 'package:supa_test/screens/job/job_display.dart';
import 'package:supa_test/screens/job/jobs_list.dart';

import '../models/profile_details.dart';
import '../screens/profile/student_profile.dart';
import '../shared/circular_image.dart';
import '../shared/list_tile.dart';

Widget myHeaderDrawer(BuildContext context) {
  return Container(
    width: double.infinity,
    color: Colors.amber,
    padding: const EdgeInsets.only(top: 60),
    child: Column(
      children: [
        CircularImage(size: 100, imgPath: student1.picLink),
        Text(student1.name ?? "User"),
        TextButton(
            onPressed: (() {
              Navigator.pop(context);
              Navigator.pushNamed(context, StudentProfile.id);
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
        CustomListTile(icon: Icons.add_reaction,titleString: "Past Experiences"),
        const Divider(),
        CustomListTile(icon: Icons.logout,titleString: "Logout"),
        
      ],
    ),
  );
}
