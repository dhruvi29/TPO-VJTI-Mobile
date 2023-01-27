import 'package:flutter/material.dart';

class ApplicationCard extends StatelessWidget {
  final title, companyName, status, color;
  const ApplicationCard({
    this.title,
    this.companyName,
    this.status,
    this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () => Navigator.pushNamed(context, ApplicationDisplay.id),
      child: Card(
        elevation: 10,
        child: ListTile(
          leading: CircleAvatar(
              backgroundColor: Colors.amber,
              child: Text(
                companyName[0],
                style: const TextStyle(color: Colors.white),
              )),
          title: Text(title),
          subtitle: Text(companyName),
          trailing: ClipRRect(
            borderRadius: BorderRadius.circular(20.0), //or 15.0
            child: Container(
              padding: const EdgeInsets.all(10),
              color: color ?? Colors.amber,
              child: Text(
                status,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
