import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../shared/list_tile.dart';
import '../application/application_edit.dart';

final supabase = Supabase.instance.client;

class JobProfile extends StatefulWidget {
  static const id = "JobProfile";
  JobProfile({Key? key}) : super(key: key);

  @override
  State<JobProfile> createState() => _JobProfileState();
}

class _JobProfileState extends State<JobProfile> {
  // Future createApplication({
  //   required final int jobId,
  //   required final String studentId,
  //   required final String resumeLink,
  // }) async {
  //   PostgrestResponse? response = await supabase.from('Applications').insert(
  //       {"jobId": jobId, "studentId": studentId, "resumeLink": resumeLink});
  // }

  Future<void> readData(int id_) async {
    final data = await supabase.from('Job_Details').select('''
      *''').match({'id': id_});
    return data;
  }

  // Future<List?> readApplications(int jobId, String studentId) async {
  //   var data = await supabase.from('Applications').select('''
  //     *''').match({'jobId': jobId, 'studentId': studentId});
  //   print('Response Data ${data}');
  //   final dataList = data as List;
  //   return dataList;
  // }

  @override
  Widget build(BuildContext context) {
    double c_width = MediaQuery.of(context).size.width * 0.9 - 60;
    final jobId = ModalRoute.of(context)!.settings.arguments as int;
    // final studentId = ModalRoute.of(context)!.settings.arguments as int;
    // final resumeLink = "test";
    return FutureBuilder(
        future: readData(jobId),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var data = snapshot.data[0];
            print(data);
            // int len = data.length;
            // return Container();
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
                    rowDisplay(
                        context, "Eligibility", "Eligible", Icons.person),
                    eligibility(jobId),
                    SizedBox(
                        width: double.infinity,
                        child: Container(
                          padding: const EdgeInsets.all(15.0),
                          child: ElevatedButton(
                            onPressed: () async {
                              //TODO Add application row in db
                              Navigator.pushReplacementNamed(
                                  context, EditApplication.id);
                              // print("==========");
                              // dynamic dataList = readApplications(
                              //     2, "77fc94b0-7c9a-423a-bb09-a05bfb2b9bf");
                              // print(dataList);
                              // print("==========");
                              // createApplication(
                              //     jobId: jobId,
                              //     studentId:
                              //         '77fc94b0-7c9a-423a-bb09-a05bfb2b9bfe',
                              //     resumeLink:
                              //         "https://docs.google.com/document/d/1CNkznkHiSqI1zSHLY-NRZy0MgXhDHg-RDPe5EuJqwQk/edit");
                              // final response =
                              //     await supabase!.from('Applications').insert({
                              //   jobId: 4,
                              //   studentId:
                              //       '77fc94b0-7c9a-423a-bb09-a05bfb2b9bfe',
                              //   resumeLink:
                              //       "https://docs.google.com/document/d/1CNkznkHiSqI1zSHLY-NRZy0MgXhDHg-RDPe5EuJqwQk/edit"
                              // });
                            },
                            child: Text(
                              'Apply Now',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.pink)),
                          ),
                        ))
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
      *''').match({'jobId': 15});
    print(data);
    return data;
  }

  FutureBuilder<void> eligibility(int jobId) {
    return FutureBuilder(
        future: readEligility(jobId),
        builder: ((context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var criteria = snapshot.data[0];
            return Column(
              children: [
                criteria["10th"] == 0
                    ? Container()
                    : ListTile(
                        leading: Icon(Icons.check_circle),
                        title: Text("Tenth"),
                        subtitle: Text(criteria["10th"].toString()),
                      ),
                criteria["12th"] == 0
                    ? Container()
                    : ListTile(
                        leading: Icon(Icons.check_circle),
                        title: Text("Twevth"),
                        subtitle: Text(criteria["12th"].toString()),
                      ),
                criteria["cpi"] == 0
                    ? Container()
                    : ListTile(
                        leading: Icon(Icons.check_circle),
                        title: Text("CPI"),
                        subtitle: Text(criteria["cpi"].toString()),
                      ),
                ListTile(
                  leading: Icon(Icons.check_circle),
                  title: Text("Backlogs"),
                  subtitle: Text(criteria["backlogs"].toString()),
                ),
                criteria["allowedBranches"] == null
                    ? Container()
                    : ListTile(
                        leading: Icon(Icons.check_circle),
                        title: Text("Branches"),
                        subtitle: Text(criteria["allowedBranches"]),
                      ),
                criteria["allowedGenders"] == null
                    ? Container()
                    : ListTile(
                        leading: Icon(Icons.check_circle),
                        title: Text("Gender"),
                        subtitle: Text(criteria["allowedGenders"]),
                      ),
                criteria["allowedPrograms"] == null
                    ? Container()
                    : ListTile(
                        leading: Icon(Icons.check_circle),
                        title: Text("Allowed Programs"),
                        subtitle: Text(criteria["allowedPrograms"]),
                      ),
              ],
            );
          }
          return const Center(child: CircularProgressIndicator());
        }));
  }

  Padding rowDisplay(
      BuildContext context, String supTitle, String title, IconData icon_) {
    double c_width = MediaQuery.of(context).size.width * 0.9 - 60;
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
            width: c_width,
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
