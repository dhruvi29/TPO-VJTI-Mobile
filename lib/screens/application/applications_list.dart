import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../widgets/application_card.dart';

final supabase = Supabase.instance.client;

class ApplicationList extends StatefulWidget {
  static const id = "ApplicationList";
  const ApplicationList({Key? key}) : super(key: key);

  @override
  State<ApplicationList> createState() => _ApplicationListState();
}

class _ApplicationListState extends State<ApplicationList> {
  Future<void> readData() async {
    final data = await supabase.from('Applications').select('''
      *,
      Job_Details(id,title,noOfRounds,companyName) ''').match({/* match Student.student id here */});
    return data;
  }

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
                return ApplicationCard(
                    title: data[index]['Job_Details']['title'],
                    companyName: data[index]['Job_Details']['companyName'],
                    status: "In Progress");
              },
            );
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
