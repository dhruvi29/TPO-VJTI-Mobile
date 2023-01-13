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

      // DONOT DELETE THIS COMMENT
      // appBar: AppBar(
      //   centerTitle: true,
      //   title: Text("Dhruvi Doshi"),
      //   // backgroundColor: Colors.amber,
      //   bottom: PreferredSize(
      //     preferredSize: Size.fromHeight(200),
      //     // child: Text("c"),
      //     child: Column(
      //       children: [
      //         SizedBox(height: 10),
      //         Center(
      //             child: Stack(
      //           children: [
      //             SizedBox(
      //                 height: 120,
      //                 child: ClipRRect(
      //                     borderRadius: BorderRadius.circular(150),
      //                     child: Image(
      //                       image: AssetImage('assets/dhruvi.png'),
      //                     ))),
      //             Positioned(
      //                 bottom: 0,
      //                 right: 0,
      //                 child: Container(
      //                     width: 35,
      //                     height: 35,
      //                     decoration: BoxDecoration(
      //                         borderRadius: BorderRadius.circular(100),
      //                         color: Colors.white),
      //                     child: Icon(
      //                       Icons.camera_alt,
      //                       color: Colors.amber,
      //                     )))
      //           ],
      //         )),
      //         SizedBox(height: 40),
      //       ],
      //     ),
      //   ),
      //   shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.only(
      //           bottomRight: Radius.circular(300),
      //           bottomLeft: Radius.circular(300))),
      // ),
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
