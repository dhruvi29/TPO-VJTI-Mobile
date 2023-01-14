import 'package:flutter/material.dart';
import 'package:supa_test/models/profile_details.dart';
import 'package:supa_test/shared/profile_appbar.dart';

import '../../components/edit_field.dart';
import 'student_profile.dart';

class EditProfile extends StatefulWidget {
  static const id = "EditProfile";

  EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    final student_id = ModalRoute.of(context)!.settings.arguments as String;
    var final_val = 'Enter';
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Resume'),
      ),

      body: Column(children: [
        // EditField(TextInputType.emailAddress,"Personal Email",Icons.email,(val){
        //   student1.email = val;
        // }),
        // EditField(TextInputType.emailAddress,"Institute Email",Icons.email,(val){
        //   student1.instituteEmail = val;
        // }),
        // EditField(TextInputType.number, "Phone Number", Icons.phone, (val) {
        //   student1.phone = val;
        // }),
        EditField(TextInputType.url, "Resume Link", Icons.link, (val) {
          final_val = val;
        }),

        Padding(
          padding: const EdgeInsets.all(15),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () async {
                  var newR = await supabase.from('Students').update(
                      {'resumeLink': final_val}).match({'id': student_id});
                  Navigator.pushReplacementNamed(context, StudentProfile.id);
                },
                child: const Text("Save")),
          ),
        )
      ]),
    );
  }
}
