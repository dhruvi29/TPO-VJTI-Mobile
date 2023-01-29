import 'package:flutter/material.dart';
import 'package:provider/provider.dart' as pro;
import 'package:supa_test/models/student.dart';
import 'package:supa_test/screens/application/applications_list.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supa_test/widgets/edit_field.dart';

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

    final Student studentVar = pro.Provider.of<Student>(context);
    return Scaffold(

      appBar: AppBar(
        title: const Text("Upload Resume"),
          ),
      body: Column(children: [
        
        EditField(TextInputType.url, "Resume", Icons.link,
            (val) {
          final_val = val;
        }, enable: true,initialValue: "${studentVar.resumeLink}",),
        const Text("All your data will be fetched from your profile"),
        Padding(
          padding: const EdgeInsets.all(15),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {
                  createApplication(
                      jobId: jobId, studentId: studentVar.id, resumeLink: final_val);
                  Navigator.pushReplacementNamed(context, ApplicationList.id);
                },
                child: const Text("Apply")),
          ),
        )
      ]),
    );
  }
}