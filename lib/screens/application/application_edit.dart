import 'package:flutter/material.dart';
import 'package:supa_test/screens/application/applications_list.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../models/User.dart';
import '../../models/student.dart' as s;
import '../../widgets/edit_field.dart';
// import '../calender.dart';

class EditApplication extends StatefulWidget {
  static const id = "EditApplication";

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
    final jobId = ModalRoute.of(context)!.settings.arguments as int;
    var final_val = 'Enter';
    return Scaffold(
      appBar: AppBar(
        title: Text("Upload Resume"),
          ),
      body: Column(children: [
        // EditField(
        //   TextInputType.emailAddress,
        //   "Personal Email",
        //   Icons.email,
        //   (val) {
        //     student1.email = val;
        //   },
        //   enable: false,
        // ),
        // EditField(TextInputType.emailAddress, "Institute Email", Icons.email,
        //     (val) {
        //   student1.instituteEmail = val;
        // }, enable: false),
        // EditField(TextInputType.number, "Phone Number", Icons.phone, (val) {
        //   student1.phone = val;
        // }, enable: false),
        EditField(TextInputType.url, "Resume", Icons.link,
            (val) {
          final_val = val;
        }, enable: true,initialValue: "${s.Student.student['resumeLink']}",),
        Text("All your data will be fetched from your profile"),
        Padding(
          padding: const EdgeInsets.all(15),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {
                  // Navigator.pushReplacementNamed(context, StudentProfile.id);
                  createApplication(
                      jobId: jobId, studentId: user!.id, resumeLink: final_val);
                  Navigator.pushReplacementNamed(context, ApplicationList.id);
                },
                child: const Text("Apply")),
          ),
        )
      ]),
    );
  }
}