import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:supa_test/widgets/job_card.dart';

final supabase = Supabase.instance.client;

class ArchivedJobList extends StatefulWidget {
  static const id = "ArchivedJobList";
  const ArchivedJobList({Key? key}) : super(key: key);

  @override
  State<ArchivedJobList> createState() => _ArchivedJobListState();
}

class _ArchivedJobListState extends State<ArchivedJobList> {
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
        title: const Text("Previous Jobs On Campus"),
      ),
      body: StreamBuilder(
          stream: _stream,
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              final jobList = snapshot.data;

              var jobLen = jobList?.length;
              jobLen ??= 0;
              jobList.sort((a, b) => compare(a, b));
              return ListView.builder(
                  itemCount: jobLen,
                  itemBuilder: (context, index) {
                    if ((DateTime.parse(jobList[index]['endDateToApply'])
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
                    ;
                    return SizedBox.shrink();
                  });
            }
            return const Center(child: CircularProgressIndicator());
          }),
    );
  }

  int compare(dynamic a, dynamic b) {
    if (a['endDateToApply'] == b['endDateToApply']) {
      if (a['id'] < b['id']) {
        return 1;
      } else {
        return -1;
      }
    }
    if ((DateTime.parse(a['endDateToApply'])
        .difference(DateTime.parse(b['endDateToApply']))
        .isNegative)) {
      return 1;
    }
    return -1;
  }
}
