import 'package:flutter/material.dart';
import 'package:supa_test/models/profile_details.dart';
import 'package:supa_test/shared/profile_appbar.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../components/edit_field.dart';
import '../calender.dart';

class EditApplication extends StatefulWidget {
  static const id = "EditProfile";

  EditApplication({Key? key}) : super(key: key);

  @override
  State<EditApplication> createState() => _EditApplicationState();
}

class _EditApplicationState extends State<EditApplication> {
  Future createApplication({
    required final int jobId,
    required final String studentId,
    required final String resumeLink,
  }) async {
    PostgrestResponse? response = await supabase.from('Applications').insert(
        {"jobId": jobId, "studentId": studentId, "resumeLink": resumeLink});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                CircleAvatar(backgroundColor: Colors.pink, child: Text('JP')),
          ),
          title: ListTile(
            // leading: ,
            title: Text("SEP Summer Intern"),
            subtitle: Text("J.P. Morgan & Chase"),
          )),
      body: Column(children: [
        EditField(
          TextInputType.emailAddress,
          "Personal Email",
          Icons.email,
          (val) {
            student1.email = val;
          },
          enable: false,
        ),
        EditField(TextInputType.emailAddress, "Institute Email", Icons.email,
            (val) {
          student1.instituteEmail = val;
        }, enable: false),
        EditField(TextInputType.number, "Phone Number", Icons.phone, (val) {
          student1.phone = val;
        }, enable: false),
        EditField(TextInputType.url, "Resume Link", Icons.phone, (val) {
          student1.resumeLink = val;
        }, enable: false),
        Padding(
          padding: const EdgeInsets.all(15),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {
                  // Navigator.pushReplacementNamed(context, StudentProfile.id);
                  createApplication(
                      jobId: 2,
                      studentId: '77fc94b0-7c9a-423a-bb09-a05bfb2b9bfe',
                      resumeLink:
                          "https://docs.google.com/document/d/1CNkznkHiSqI1zSHLY-NRZy0MgXhDHg-RDPe5EuJqwQk/edit");
                },
                child: const Text("Apply")),
          ),
        )
      ]),
    );
  }
}
