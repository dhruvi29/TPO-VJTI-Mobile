import 'package:flutter/material.dart';
import 'package:supa_test/screens/profile/student_profile.dart';

import 'package:supa_test/widgets/edit_field.dart';
import 'package:supa_test/models/student.dart' as s;
import 'package:supa_test/constants/supabse_client.dart' as supa;


class EditProfile extends StatefulWidget {
  static const id = "EditProfile";

  EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    final studentId = ModalRoute.of(context)!.settings.arguments as String;
    var finalVal = 'Enter';
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Resume'),
      ),

 
      body: Column(children: [

        EditField(TextInputType.url, "Resume Link", Icons.link, (val) {
          finalVal = val;
        },initialValue: "${s.Student.student['resumeLink']}"),

        Padding(
          padding: const EdgeInsets.all(15),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () async {
                  await supa.supabase.from('Students').update(
                      {'resumeLink': finalVal}).match({'id': studentId});
                  Navigator.pushReplacementNamed(context, StudentProfile.id);
                },
                child: const Text("Save")),
          ),
        )
      ]),
    );
  }
}
