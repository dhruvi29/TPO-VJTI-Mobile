import 'package:flutter/material.dart';

import 'package:supa_test/screens/job/job_display.dart';

class JobCard extends StatelessWidget {
  final companyName, isArchive, title, salary, timeLeft, location, id;

  const JobCard(
    this.title,
    this.companyName,
    this.isArchive,
    this.salary,
    this.timeLeft,
    this.location,
    this.id, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, JobProfile.id, arguments: id),
      child: Card(
        elevation: 10,
        child: Column(
          children: [
            cardHeader(),
            const Divider(),
            cardFooter()
          ],
        ),
      ),
    );
  }

  ListTile cardHeader() {
    return ListTile(
            leading: CircleAvatar(
                backgroundColor: Colors.amber,
                child: Text(
                  companyName[0],
                  style: const TextStyle(color: Colors.white),
                )),
            title: Text(title),
            subtitle: Text(companyName),
            trailing: isArchive
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(20.0), //or 15.0
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      color: const Color(0xffFF0E58),
                      child: const Text(
                        "Archived",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                : ElevatedButton(
                    child: const Text(
                      "Apply",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      // Navigator.pushNamed(context, EditApplication.id,arguments: id);
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.red))),
          );
  }

  Row cardFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        detailIcon(Icons.currency_rupee, salary),
        const VerticalDivider(),
        detailIcon(Icons.access_time, timeLeft),
        const VerticalDivider(),
        detailIcon(Icons.location_city, location)
      ],
    );
  }

  Padding detailIcon(icon, text) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0),
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(
            width: 5,
          ),
          Text(text),
        ],
      ),
    );
  }
}
