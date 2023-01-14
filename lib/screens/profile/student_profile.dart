import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:supa_test/screens/profile/edit_profile.dart';
import 'package:supa_test/shared/list_tile.dart';
import 'package:supa_test/shared/profile_appbar.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../models/profile_details.dart';
import 'package:url_launcher/url_launcher_string.dart';

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
        .select('''*''').match({'id': '0173a65e-ac39-405c-8a92-e2fa1d6d49cb'});
    print(data);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
        future: readData(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var data = snapshot.data;
            int len = data.length;

            var first_name = data[0]['firstName'];
            var mid_name = data[0]['middleName'];
            var last_name = data[0]['lastName'];
            var student_id = data[0]['id'];

            return Scaffold(
                appBar: ProfileAppBar(
                  firstName: first_name,
                  midName: mid_name,
                  lastName: last_name,
                  student_id: student_id,
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
                        child: Icon(
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
                    // CustomListTile(
                    //     icon: Icons.link,
                    //     titleString: data[0]['resumeLink'],
                    //     iconColor: Colors.amber),
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
                            trailText: student1.tenthBoard,
                          ),
                          DisplayGrade(
                            sem: "XII",
                            score: data[0]['12th'],
                            trailText: student1.twelthBoard,
                          ),
                        ],
                      ),
                    ),
                  ],
                )));
          }
          return Scaffold(body: const CircularProgressIndicator());
        });
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
