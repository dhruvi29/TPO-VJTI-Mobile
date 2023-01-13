import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Calender extends StatefulWidget {
  static const id = "Calender";
  const Calender({Key? key}) : super(key: key);

  @override
  State<Calender> createState() => _CalenderState();
}

final supabase = Supabase.instance.client;

class _CalenderState extends State<Calender> {
  final streamR = supabase.channel('*').on(
    RealtimeListenTypes.postgresChanges,
    ChannelFilter(event: '*', schema: '*'),
    (payload, [ref]) {
      // print('hello');
      // print('Change received: ${payload.toString()}');
    },
  ).subscribe();

  final _stream = supabase.from('Rounds').stream(primaryKey: ['id']);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("TPO Schedule"),
      ),
      body: StreamBuilder(
        stream: _stream,
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          } else {
            var roundData = snapshot.data;
            var event_len = roundData?.length;

            if (event_len == null) {
              event_len = 0;
            }

            List<CalendarEventData> events_r = [];
            for (int i = 0; i < event_len; i++) {
              dynamic round_spe = roundData?.elementAt(i);
              var singleEve = CalendarEventData(
                title:
                    "${round_spe['companyName']} Round ${round_spe['roundNo']}",
                date: DateTime.parse(round_spe['roundTime']),
                event: "Event ${i}",
              );
              events_r.add(singleEve);
              CalendarControllerProvider.of(context).controller.add(singleEve);
            }
            // CalendarControllerProvider.of(context).controller.

            return MonthView(
              onCellTap: (events, date) {
                // Implement callback when user taps on a cell.
                List<String> events_list = [];
                bool event_pre = false;
                if (events.length != 0) {
                  event_pre = true;
                  for (var e in events) {
                    events_list.add(e.title);
                  }
                }
                Widget setupAlertDialoadContainer() {
                  return Container(
                      height: 100.0, // Change as per your requirement
                      width: 300.0, // Change as per your requirement
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: events_list.length,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                                onTap: () {
                                  print("Click event on Container");
                                },
                                child: Container(
                                  height: 50,
                                  child: Center(
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                        Text(events_list[index]),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          color: Colors.blue,
                                        ),
                                        Text(DateFormat.Hms()
                                            .format(events[index].date))
                                      ])),
                                ));
                          }));
                }

                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: Text("Events"),
                          content: event_pre
                              ? setupAlertDialoadContainer()
                              : Text("No events"),
                          actions: [
                            TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text("Ok")),
                          ],
                        ));
              },
              // onEventTap: (event, date) => print(event),
              // onDateLongPress: (date) => print(date),
            );
          }
          // print("hellooooooooo");
          // print(snapshot.data);
        },
      ),
    );
  }
}
