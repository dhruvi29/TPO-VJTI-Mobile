import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../widgets/application_card.dart';
import '../../models/student.dart' as s;

final supabase = Supabase.instance.client;

class ApplicationList extends StatefulWidget {
  static const id = "ApplicationList";
  const ApplicationList({Key? key}) : super(key: key);

  @override
  State<ApplicationList> createState() => _ApplicationListState();
}

class _ApplicationListState extends State<ApplicationList> {
  Future<void> readData() async {
    print(s.Student.student);
    final data = await supabase.from('Applications').select('''
      *,
      Job_Details(id,title,noOfRounds,companyName) ''').match({
      'studentId': s.Student.student['id']
    });
    return data;
  }

  static const application_status = {
    'text': {-1: "Rejected", 0: "In Progress", 1: "Selected"},
    'color': {-1: Colors.red, 0: Colors.amber, 1: Colors.green}
  };

  @override
  Widget build(BuildContext context) {
    // final data = readData();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your applications"),
      ),
      body: FutureBuilder<void>(
        future: readData(),
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
                  status: application_status['text']![s['selectionStatus']],
                  color: application_status['color']![s['selectionStatus']],
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
