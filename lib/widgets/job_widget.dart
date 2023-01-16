//Kushal's UI

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ItemWidget extends StatelessWidget {
  final dynamic item;
  const ItemWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var parsedDate = DateTime.parse(item['endDateToApply']);
    return InkWell(
        onTap: () {
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 10,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Icon(Icons.add),
                title: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child: Text(item['companyName'],
                          style: TextStyle(
                              color: Colors.black,
                              // fontWeight: FontWeight.bold,
                              fontSize: 18))),
                ),
                subtitle: Center(
                    child: Text(item['title'],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          // fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ))),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "${item['salary']}",
                      style: TextStyle(
                          color: Colors.purple,
                          // fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    Text(
                      "${DateFormat.yMMMMd('en_US').format(parsedDate)}",
                      style: TextStyle(
                          color: Colors.purple,
                          // fontWeight: FontWeight.bold,
                          fontSize: 10),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
