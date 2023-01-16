import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'package:supa_test/models/User.dart';

import 'package:supa_test/widgets/list_tile.dart';
import 'package:supa_test/widgets/profile_appbar.dart';
import 'package:supa_test/widgets/display_grade.dart';

final supabase = Supabase.instance.client;

class StudentProfile extends StatefulWidget {
  static const id = "StudentProfile";

  StudentProfile({Key? key}) : super(key: key);

  @override
  State<StudentProfile> createState() => _StudentProfileState();
}

class _StudentProfileState extends State<StudentProfile> {
  Future<void> readData() async {
    final data = await supabase
        .from('Students')
        .select('''*''').match({'id': user!.id});
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
        future: readData(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {

            var data = snapshot.data;

            var firstName = data[0]['firstName'];
            var midName = data[0]['middleName'];
            var lastName = data[0]['lastName'];
            var studentId = data[0]['id'];

            return myProfile(firstName, midName, lastName, studentId, data);
          }
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        });
  }

  myProfile(firstName, midName, lastName, studentId, data) {
    return Scaffold(
              appBar: ProfileAppBar(
                firstName: firstName,
                midName: midName,
                lastName: lastName,
                student_id: studentId,
              ),
              body: SingleChildScrollView(
                  child: Column(
                children: [
                  CustomListTile(
                      icon: Icons.book,
                      titleString: data[0]['programme'],
                      iconColor: Colors.amber),
                  CustomListTile(
                      icon: Icons.computer,
                      titleString: data[0]['branch'],
                      iconColor: Colors.amber),
                  CustomListTile(
                      icon: Icons.email,
                      titleString: data[0]['personalEmail'],
                      iconColor: Colors.amber),
                  CustomListTile(
                      icon: Icons.email_outlined,
                      titleString: data[0]['clgEmail'],
                      iconColor: Colors.amber),
                  CustomListTile(
                      icon: Icons.grade_sharp,
                      titleString: data[0]['clgId'].toString(),
                      iconColor: Colors.amber),
                  CustomListTile(
                      icon: Icons.phone,
                      titleString: data[0]['mobileNumber'].toString(),
                      iconColor: Colors.amber),
                  CustomListTile(
                      icon: Icons.cake,
                      titleString: DateFormat.yMd()
                          .format(DateTime.parse(data[0]['dob']))
                          .toString(),
                      iconColor: Colors.amber),
                  ListTile(
                    leading: Container(
                      padding: const EdgeInsets.all(10.0),
                      child: const Icon(
                        Icons.link,
                        color: Colors.amber,
                      ),
                    ),
                    title: InkWell(
                      onTap: () async {
                        try {
                          await launchUrlString(
                              data[0]['resumeLink'].toString());
                        } catch (err) {
                          debugPrint('Something bad happened');
                        }
                      },
                      child: Text(
                        data[0]['resumeLink'],
                      ),
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
                              "Semester Grades",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w400),
                            )),
                        const Divider(),
                        DisplayGrade(
                            sem: "I", score: (data[0]['SPI1'].toString())),
                        DisplayGrade(
                            sem: "II", score: (data[0]['SPI2'].toString())),
                        DisplayGrade(
                            sem: "III", score: (data[0]['SPI3'].toString())),
                        DisplayGrade(
                            sem: "IV", score: (data[0]['SPI4'].toString())),
                        DisplayGrade(
                            sem: "V", score: (data[0]['SPI5'].toString())),
                        DisplayGrade(
                            sem: "VI", score: (data[0]['SPI6'].toString())),
                        DisplayGrade(
                            sem: "VII", score: (data[0]['SPI7'].toString())),
                        DisplayGrade(
                            sem: "VIII", score: (data[0]['SPI8'].toString())),
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
                            title: Text((data[0]['CPI']).toString()),
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
                          score: data[0]['10th'],
                          trailText: "ICSE",
                        ),
                        DisplayGrade(
                          sem: "XII",
                          score: data[0]['12th'],
                          trailText: "HSC",
                        ),
                      ],
                    ),
                  ),
                ],
              )));
  }
}

