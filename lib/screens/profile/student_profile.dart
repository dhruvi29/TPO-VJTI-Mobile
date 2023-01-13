import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:supa_test/screens/profile/edit_profile.dart';
import 'package:supa_test/shared/list_tile.dart';
import 'package:supa_test/shared/profile_appbar.dart';

import '../../models/profile_details.dart';

class StudentProfile extends StatefulWidget {
  static const id = "StudentProfile";

  StudentProfile({Key? key}) : super(key: key);

  @override
  State<StudentProfile> createState() => _StudentProfileState();
}

class _StudentProfileState extends State<StudentProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const ProfileAppBar(),
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
            Card(
              margin: const EdgeInsets.all(10),
              elevation: 10,
              child: Column(
                children: [
                  Container(
                      padding: const EdgeInsets.all(10),
                      child: const Text(
                        "Semester Grades",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400),
                      )),
                  const Divider(),
                  DisplayGrade(
                      sem: "I", score: (student1.grades ?? dummyGrades)[0]),
                  DisplayGrade(
                      sem: "II", score: (student1.grades ?? dummyGrades)[1]),
                  DisplayGrade(
                      sem: "III", score: (student1.grades ?? dummyGrades)[2]),
                  DisplayGrade(
                      sem: "IV", score: (student1.grades ?? dummyGrades)[3]),
                  DisplayGrade(
                      sem: "V", score: (student1.grades ?? dummyGrades)[4]),
                  DisplayGrade(
                      sem: "VI", score: (student1.grades ?? dummyGrades)[5]),
                  const Divider(),
                  Container(
                    child: ListTile(
                      leading: const Text(
                        "CPI",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                            color: Colors.amber),
                      ),
                      title: Text((student1.cpi ?? '-').toString()),
                    ),
                    padding: const EdgeInsets.all(5),
                  ),
                ],
              ),
            ),
            Card(
              margin: const EdgeInsets.all(10),
              elevation: 10,
              child: Column(
                children: [
                  Container(
                      padding: const EdgeInsets.all(10),
                      child: const Text(
                        "Previous Scores",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400),
                      )),
                  const Divider(),
                  DisplayGrade(
                    sem: "X",
                    score: student1.tenth,
                    trailText: student1.tenthBoard,
                  ),
                  DisplayGrade(
                    sem: "XII",
                    score: student1.twelth,
                    trailText: student1.twelthBoard,
                  ),
                ],
              ),
            ),
          ],
        )));
  }
}

class DisplayGrade extends StatelessWidget {
  final sem, score, trailText;
  Widget? trailWidget;
  DisplayGrade({Key? key, this.sem, this.score, this.trailText})
      : super(key: key) {
    if (trailText != null) {
      trailWidget = ClipRRect(
        borderRadius: BorderRadius.circular(20.0), //or 15.0
        child: Container(
          height: 30.0,
          width: 50.0,
          color: const Color(0xffFF0E58),
          child: Center(
              child: Container(
                  padding: const EdgeInsets.all(4),
                  child: Text(
                    trailText,
                    style: const TextStyle(color: Colors.white),
                  ))),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
          backgroundColor: Colors.amber,
          child: Text(
            sem,
            style: const TextStyle(color: Colors.white),
          )),
      title: Text(score.toString()),
    );
  }
}
