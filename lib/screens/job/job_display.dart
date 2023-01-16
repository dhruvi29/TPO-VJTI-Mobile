import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:supa_test/models/student.dart';
import 'package:supa_test/screens/application/application_edit.dart';

final supabase = Supabase.instance.client;

class JobProfile extends StatefulWidget {
  static const id = "JobProfile";
  JobProfile({Key? key}) : super(key: key);

  @override
  State<JobProfile> createState() => _JobProfileState();
}

class _JobProfileState extends State<JobProfile> {

  Future<void> readData(int id_) async {
    final data = await supabase.from('Job_Details').select('''
      *''').match({'id': id_});
    return data;
  }

  bool studentEligibility = true;

  @override
  Widget build(BuildContext context) {
    final jobId = ModalRoute.of(context)!.settings.arguments as int;
    return FutureBuilder(
        future: readData(jobId),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var data = snapshot.data[0];
            return Scaffold(
              appBar: AppBar(
                  leading: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                        backgroundColor: Colors.pink,
                        child: Text(data['companyName'][0])),
                  ),
                  title: ListTile(
                    // leading: ,
                    title: Text(data['title']),
                    subtitle: Text(data['companyName']),
                  )),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    rowDisplay(
                        context,
                        "Application Deadline",
                        // data['endDateToApply'].toString(),
                        data['endDateToApply'] == null
                            ? "N/A"
                            : DateFormat.yMd()
                                .format(DateTime.parse(data['endDateToApply']))
                                .toString(),
                        Icons.calendar_month),
                    const Divider(),
                    rowDisplay(context, "Location", data['locations'] ?? "PAN",
                        Icons.location_city),
                    const Divider(),
                    rowDisplay(context, "Cost to Company (CTC)",
                        data['salary'].toString(), Icons.currency_rupee),
                    const Divider(),
                    rowDisplay(context, "Eligibility", "", Icons.person),
                    eligibility(data['title'],data['companyName'],jobId),
                    
                  ],
                ),
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        });
  }

  Future<void> readEligility(int id_) async {
    final data = await supabase.from('Job_Requirements').select('''
      *''').match({'jobId': 2});
  }

  FutureBuilder<void> eligibility(String title,String companyName, int jobId) {
    return FutureBuilder(
        future: readEligility(jobId),
        builder: ((context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var criteria = snapshot.data[0];
            return Column(
              children: [
                tenth(criteria),
                twelvth(criteria),
                cpi(criteria),
                backlogs(criteria),
                allowedBranches(criteria),
                allowedGenders(criteria),
                allowedPrograms(criteria),
                SizedBox(
                        width: double.infinity,
                        child: Container(
                          padding: const EdgeInsets.all(15.0),
                          child: ElevatedButton(
                            onPressed: studentEligibility? () {
                              Navigator.pushReplacementNamed(context, EditApplication.id,arguments: jobId);
                            }:null,
                            child: Text(
                              studentEligibility?'Apply Now':'Not Eligible',
                              style:
                                  const TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(studentEligibility?Colors.pink:Colors.grey)),
                          ),
                        ))
              ],
            );
          }
          return const Center(child: CircularProgressIndicator());
        }));
  }

  Widget backlogs(var criteria) {
    if (criteria["backlogs"] == 0) {
      return Container();
    }
    bool e = true;
    if (criteria["backlogs"] < Student.student['backlogs']) {
      e = false;

      studentEligibility = false;
    }
    return ListTile(
      leading: e
          ? const Icon(
              Icons.check_circle,
              color: Colors.green,
            )
          : const Icon(
              Icons.disabled_by_default,
              color: Colors.red,
            ),
      title: const Text("Backlogs"),
      subtitle: Text(
        criteria["backlogs"].toString(),
      ),
    );
  }

  Widget cpi(var criteria) {
    if (criteria["cpi"] == Null || criteria["cpi"] == 0) {
      return Container();
    }
    bool e = true;
    if (criteria["cpi"] > Student.student['CPI']) {
      e = false;

      studentEligibility = false;
    }
    return ListTile(
      leading: e
          ? const Icon(
              Icons.check_circle,
              color: Colors.green,
            )
          : const Icon(
              Icons.disabled_by_default,
              color: Colors.red,
            ),
      title: const Text("CPI"),
      subtitle: Text(
        criteria["cpi"].toString(),
      ),
    );
  }

  Widget twelvth(var criteria) {
    if (criteria["12th"] == 0) {
      return Container();
    }
    bool e = true;
    if (criteria["12th"] > Student.student['12th']) {
      e = false;

      studentEligibility = false;
    }
    return ListTile(
      leading: e
          ? const Icon(
              Icons.check_circle,
              color: Colors.green,
            )
          : const Icon(
              Icons.disabled_by_default,
              color: Colors.red,
            ),
      title: const Text("Twelvth"),
      subtitle: Text(
        criteria["12th"].toString(),
      ),
    );
  }

  Widget tenth(var criteria) {
    if (criteria["10th"] == 0) {
      return Container();
    }
    bool e = true;
    if (criteria["10th"] > Student.student['10th']) {
      e = false;
      studentEligibility = false;
    }

    return ListTile(
      leading: e
          ? const Icon(
              Icons.check_circle,
              color: Colors.green,
            )
          : const Icon(
              Icons.disabled_by_default,
              color: Colors.red,
            ),
      title: Text("Tenth"),
      subtitle: Text(
        criteria["10th"].toString(),
      ),
    );
  }

  Widget allowedGenders(var criteria) {
    if (criteria["allowedGenders"] == null) {
      return Container();
    }
    bool e = true;
    if (!criteria["allowedGenders"]
        .split(",")
        .contains(Student.student['gender'])) {
      e = false;
      studentEligibility = false;
    }

    return ListTile(
      leading: e
          ? const Icon(
              Icons.check_circle,
              color: Colors.green,
            )
          : const Icon(
              Icons.disabled_by_default,
              color: Colors.red,
            ),
      title: const Text("Genders"),
      subtitle: Text(
        criteria["allowedGenders"].toString(),
      ),
    );
  }

  Widget allowedBranches(var criteria) {
    if (criteria["allowedBranches"] == null) {
      return Container();
    }
    bool e = true;
    if (!criteria["allowedBranches"]
        .split(",")
        .contains(Student.student['branch'])) {
      e = false;
      studentEligibility = false;
    }

    return ListTile(
      leading: e
          ? const Icon(
              Icons.check_circle,
              color: Colors.green,
            )
          : const Icon(
              Icons.disabled_by_default,
              color: Colors.red,
            ),
      title: const Text("Branches"),
      subtitle: Text(
        criteria["allowedBranches"].toString(),
      ),
    );
  }

  Widget allowedPrograms(var criteria) {
    if (criteria["allowedPrograms"] == null) {
      return Container();
    }
    bool e = true;
    if (!criteria["allowedPrograms"]
        .split(",")
        .contains(Student.student['programme'])) {
      e = false;
      studentEligibility = false;
    }

    return ListTile(
      leading: e
          ? const Icon(
              Icons.check_circle,
              color: Colors.green,
            )
          : const Icon(
              Icons.disabled_by_default,
              color: Colors.red,
            ),
      title: const Text("Programs"),
      subtitle: Text(
        criteria["allowedPrograms"].toString(),
      ),
    );
  }

  Padding rowDisplay(
      BuildContext context, String supTitle, String title, IconData icon_) {
    double cWidth = MediaQuery.of(context).size.width * 0.9 - 60;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: 30,
            backgroundColor: Theme.of(context).primaryColor,
            child: Icon(
              icon_,
              size: 30,
              color: Colors.white,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            width: cWidth,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  supTitle,
                  style: const TextStyle(color: Colors.pink, fontSize: 18),
                  textAlign: TextAlign.left,
                ),
                Text(title.toString(),
                    style: const TextStyle(color: Colors.black, fontSize: 24),
                    textAlign: TextAlign.left),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
