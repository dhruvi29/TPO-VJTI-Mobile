import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supa_test/screens/job/archived_joblist.dart';
import 'package:supa_test/widgets/job_card.dart';

final supabase = Supabase.instance.client;

class AllJobs extends StatefulWidget {
  static const id = "AllJobs";
  const AllJobs({Key? key}) : super(key: key);

  @override
  State<AllJobs> createState() => _AllJobsState();
}

class _AllJobsState extends State<AllJobs> {
  final streamR = supabase
      .channel('*')
      .on(
        RealtimeListenTypes.postgresChanges,
        ChannelFilter(event: '*', schema: '*'),
        (payload, [ref]) {},
      )
      .subscribe();

  @override
  Widget build(BuildContext context) {
    final _stream = supabase.from('Job_Details').stream(primaryKey: ['id']);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Upcoming On Campus"),
        actions: [
          IconButton(
              icon: const Icon(
                IconData(0xe091, fontFamily: 'MaterialIcons'),
                color: Colors.white,
                semanticLabel: 'Archived',
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(context, ArchivedJobList.id);
              })
        ],
      ),
      body: StreamBuilder(
          stream: _stream,
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              final jobList = snapshot.data;

              var jobLen = jobList?.length;
              jobLen ??= 0;

              return ListView.builder(
                  itemCount: jobLen,
                  itemBuilder: (context, index) {
                    if (!(DateTime.parse(jobList[index]['endDateToApply'])
                        .toUtc()
                        .difference(DateTime.now().toUtc())
                        .isNegative)) {
                      return JobCard(
                        jobList[index]['title'],
                        jobList[index]['companyName'],
                        jobList[index]['isArchived'] ?? false,
                        jobList[index]['salary'].toString(),
                        jobList[index]['endDateToApply'] == null
                            ? ""
                            : DateTime.parse(jobList[index]['endDateToApply'])
                                    .toUtc()
                                    .difference(DateTime.now().toUtc())
                                    .inDays
                                    .toString() +
                                " days",
                        jobList[index]['locations'].toString(),
                        jobList[index]['id'],

                        // true
                      );
                    }
                    return SizedBox.shrink();
                  });
            }

            return const Center(child: CircularProgressIndicator());
          }),
    );
  }
}
