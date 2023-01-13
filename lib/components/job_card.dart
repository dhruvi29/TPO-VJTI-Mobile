import 'package:flutter/material.dart';
import 'package:supa_test/screens/application/application_edit.dart';

import '../screens/job/job_display.dart';

class JobCard extends StatelessWidget {
  const JobCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, JobProfile.id),
      child: Card(
        elevation: 10,
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                  backgroundColor: Colors.amber,
                  child: Text(
                    "JP",
                    style: const TextStyle(color: Colors.white),
                  )),
              title: Text("SEP Summer Intern"),
              subtitle: Text("J.P. MOrgan & Chase"),
              trailing: ElevatedButton(
                  child: Text(
                    "Apply",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, EditApplication.id);
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.red))),
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                detailIcon(Icons.currency_rupee,"1,00,000"),
                detailIcon(Icons.access_time,"3 days left"),
                detailIcon(Icons.location_city,"Mumbai,Bangalore")
    
              ],
            )
          ],
        ),
      ),
    );
  }
}

class detailIcon extends StatelessWidget {

  final icon, text;
  const detailIcon(
    this.icon,this.text,{
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        Text(text),
      ],
    );
  }
}
