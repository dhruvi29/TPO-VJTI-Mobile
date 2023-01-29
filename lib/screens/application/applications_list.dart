import 'package:flutter/material.dart';
import 'package:supa_test/models/student.dart';
import 'package:supa_test/models/student_user.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:provider/provider.dart' as pro;


import 'package:supa_test/widgets/application_card.dart';

final supabase = Supabase.instance.client;

class ApplicationList extends StatefulWidget {
  static const id = "ApplicationList";
  const ApplicationList({Key? key}) : super(key: key);

  @override
  State<ApplicationList> createState() => _ApplicationListState();
}

class _ApplicationListState extends State<ApplicationList> {
  Future readData(studentId) async {
    final data = await supabase.from('Applications').select('''
      *,
      Job_Details(id,title,noOfRounds,companyName) ''').match({
      'studentId':studentId
    });
    print(data);
    return data;
  }

  static const applicationStatus = {
    'text': {-1: "Rejected", 0: "In Progress", 1: "Selected"},
    'color': {-1: Colors.red, 0: Colors.amber, 1: Colors.green}
  };


  @override
  Widget build(BuildContext context) {
    // final data = readData();

    Student? studentVar = pro.Provider.of<Student?>(context);
    StudentUser? userVar = pro.Provider.of<StudentUser?>(context);
    print(userVar??"looser");


    return Scaffold(
      appBar: AppBar(
        title: const Text("Your applications"),
      ),
      body: FutureBuilder(
        future: readData(studentVar?.id??0),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var data = snapshot.data;
            int len = data.length;  
            return ListView.builder(
              itemCount: len,
              itemBuilder: (context, index) {
                var s = data[index] ?? {};
                return ApplicationCard(
                  title: s['Job_Details']['title'],
                  companyName: s['Job_Details']['companyName'],
                  status: applicationStatus['text']![s['selectionStatus']],
                  color: applicationStatus['color']![s['selectionStatus']],
                );
              },
            );
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
