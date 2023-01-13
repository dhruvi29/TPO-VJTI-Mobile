import 'package:flutter/material.dart';
import 'package:supa_test/screens/application/application_edit.dart';

import '../screens/job/job_display.dart';

class JobCard extends StatelessWidget {
  final companyName, isArchive,title,salary,timeLeft,location,id;

  const JobCard(this.title,this.companyName,this.isArchive,this.salary,this.timeLeft,this.location,this.id,{
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, JobProfile.id,arguments: id),
      child: Card(
        elevation: 10,
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                  backgroundColor: Colors.amber,
                  child: Text(
                    companyName[0],
                    style: const TextStyle(color: Colors.white),
                  )),
              title: Text(title),
              subtitle: Text(companyName),
              trailing: isArchive? ClipRRect(
        borderRadius: BorderRadius.circular(20.0), //or 15.0
        child: Container(
          padding: EdgeInsets.all(10),
          color: const Color(0xffFF0E58),
          child: Text(
    "Archived",
    style: const TextStyle(color: Colors.white),
          ),
        ),
      ): ElevatedButton(
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                detailIcon(Icons.currency_rupee,salary),
                detailIcon(Icons.access_time,timeLeft),
                detailIcon(Icons.location_city,location)
    
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
    return Padding(
      padding: const EdgeInsets.only(left:15.0, right: 15.0),
      child: Row(
        children: [
          Icon(icon),
          SizedBox(width: 5,),
          Text(text),
        ],
      ),
    );
  }
}
