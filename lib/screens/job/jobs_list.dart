import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../components/job_card.dart';
import '../../components/job_widget.dart';

final supabase = Supabase.instance.client;

class AllJobs extends StatefulWidget {
  static const id = "AllJobs";
  const AllJobs({Key? key}) : super(key: key);

  @override
  State<AllJobs> createState() => _AllJobsState();
}

class _AllJobsState extends State<AllJobs> {

  
  final streamR = supabase.channel('*').on(
    RealtimeListenTypes.postgresChanges,
    ChannelFilter(event: '*', schema: '*'),
    (payload, [ref]) {
      print('hello');
      print('Change received: ${payload.toString()}');
    },
  ).subscribe();


  @override
  Widget build(BuildContext context) {
    final _stream = supabase.from('Job_Details').stream(primaryKey: ['id']);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Upcoming On Campus"),
      ),
      body: StreamBuilder(
        stream: _stream,
        builder: (context,AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            final job_list = snapshot.data;

            var e = job_list?.iterator;
            job_list?.elementAt(0);
            // print(job_list?.elementAt(0));
            // print("''''''''");
            // print(job_list);
            print(job_list?.length);
            var job_len = job_list?.length;

            if (job_len == null) {
              job_len = 0;
            }
            print("here");
            return ListView.builder(
                itemCount: job_len,
                itemBuilder: (context, index) {
                  // return Text("T");
                  return ItemWidget(item: job_list?.elementAt(index));
                });
          }
          print("there");
          return Text("Hello");
        }),

    );
  }
}

