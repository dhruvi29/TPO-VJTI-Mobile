import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:supa_test/models/User.dart';
import 'package:supa_test/models/student.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../shared/list_tile.dart';

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
      print(student);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    double c_width = MediaQuery.of(context).size.width * 0.9 - 60;
    final jobId = ModalRoute.of(context)!.settings.arguments as int;

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
                        data['endDateToApply']==null?"N/A":DateFormat.yMd().format(DateTime.parse(data['endDateToApply'])).toString(),
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
                            onPressed: () {},
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
        builder: ((context,AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var criteria = snapshot.data[0];
            return Column(
              children: [
                
                criteria["10th"]==0?Container():ListTile(
                  leading: Icon(Icons.check_circle),
                  title: Text("Tenth"),
                  subtitle: Text(criteria["10th"].toString(),
                  
                  ),
                ),
                criteria["12th"]==0?Container():ListTile(
                  leading: Icon(Icons.check_circle),
                  title: Text("Twevth"),
                  subtitle: Text(criteria["12th"].toString()),
                ),
                criteria["cpi"]==0?Container():ListTile(
                  leading: Icon(Icons.check_circle),
                  title: Text("CPI"),
                  subtitle: Text(criteria["cpi"].toString()),
                ),
                ListTile(
                  leading: Icon(Icons.check_circle),
                  title: Text("Backlogs"),
                  subtitle: Text(criteria["backlogs"].toString()),
                ),
                criteria["allowedBranches"] == null ? Container():ListTile(
                  leading: Icon(Icons.check_circle),
                  title: Text("Branches"),
                  subtitle: Text(criteria["allowedBranches"]),
                ),
                criteria["allowedGenders"] == null ? Container():ListTile(
                  leading: Icon(Icons.check_circle),
                  title: Text("Gender"),
                  subtitle: Text(criteria["allowedGenders"]),
                ),
                criteria["allowedPrograms"] == null ? Container():ListTile(
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
