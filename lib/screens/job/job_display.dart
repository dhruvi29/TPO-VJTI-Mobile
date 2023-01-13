import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../shared/list_tile.dart';

class JobProfile extends StatelessWidget {
  static const id = "JobProfile";
  JobProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double c_width = MediaQuery.of(context).size.width * 0.9 - 60;
    return Scaffold(
      appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                CircleAvatar(backgroundColor: Colors.pink, child: Text('JP')),
          ),
          title: ListTile(
            // leading: ,
            title: Text("SEP Summer Intern"),
            subtitle: Text("J.P. Morgan & Chase"),
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            rowDisplay(
                context,
                "Application Deadline",
                DateFormat.yMd().format(DateTime.now()).toString(),
                Icons.calendar_month),
            const Divider(),
            rowDisplay(
                context,
                "Location",
                ["Mumbai", "Chennai", "Bangalore"].join(", "),
                Icons.location_city),
            const Divider(),
            rowDisplay(context,"Cost to Company (CTC)","10,00,000",Icons.currency_rupee),
            const Divider(),
            rowDisplay(context, "Eligibility", "Eligible", Icons.person),
            CustomListTile(icon: Icons.check_circle,titleString: "CGPA > 6.5",iconColor: Colors.green),
            CustomListTile(icon: Icons.check_circle,titleString: "CGPA > 6.5",iconColor: Colors.green),
            CustomListTile(icon: Icons.check_circle,titleString: "CGPA > 6.5",iconColor: Colors.green),
      
            
            
            SizedBox(
                width: double.infinity,
                child: Container(
                  padding: const EdgeInsets.all(15.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Apply Now',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.pink)),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Padding rowDisplay(
      BuildContext context, String supTitle, String title, IconData icon_) {
    double c_width = MediaQuery.of(context).size.width * 0.9 - 60;
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            radius: 30,
            backgroundColor: Theme.of(context).primaryColor,
            child: Icon(
              icon_,
              size: 30,
              color: Colors.white,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8.0),
            width: c_width,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  supTitle,
                  style: const TextStyle(color: Colors.pink, fontSize: 18),
                  textAlign: TextAlign.left,
                ),
                Text(title.toString(),
                    style: const TextStyle(color: Colors.black, fontSize: 24),
                    textAlign: TextAlign.left),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
