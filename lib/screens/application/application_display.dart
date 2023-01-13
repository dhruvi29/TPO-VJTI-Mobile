import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/profile_details.dart';
import '../../shared/list_tile.dart';

class ApplicationDisplay extends StatefulWidget {
  static const id = "ApplicationDisplay";
  ApplicationDisplay({Key? key}) : super(key: key);

  @override
  State<ApplicationDisplay> createState() => _ApplicationDisplayState();
}

class _ApplicationDisplayState extends State<ApplicationDisplay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomListTile(
                icon: Icons.book,
                titleString: student1.program,
                iconColor: Colors.amber),
            CustomListTile(
                icon: Icons.computer,
                titleString: student1.branch,
                iconColor: Colors.amber),
            CustomListTile(
                icon: Icons.email,
                titleString: student1.email,
                iconColor: Colors.amber),
            CustomListTile(
                icon: Icons.email_outlined,
                titleString: student1.instituteEmail,
                iconColor: Colors.amber),
            CustomListTile(
                icon: Icons.grade_sharp,
                titleString: student1.registrationId,
                iconColor: Colors.amber),
            CustomListTile(
                icon: Icons.phone,
                titleString: student1.phone,
                iconColor: Colors.amber),
            CustomListTile(
                icon: Icons.cake,
                titleString: DateFormat.yMd()
                    .format(student1.birthdate ?? DateTime.now())
                    .toString(),
                iconColor: Colors.amber),
            CustomListTile(
                icon: Icons.link,
                titleString: "Resume",
                iconColor: Colors.amber),
          ],
        ),
      ),
      
    );
  }
}