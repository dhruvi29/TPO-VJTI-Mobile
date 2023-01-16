import 'package:flutter/material.dart';

Card makeDashboardItem(String title, IconData icon, onPressed) {
  return Card(
      elevation: 1.0,
      margin: const EdgeInsets.all(8.0),
      child: Container(
        decoration:
            const BoxDecoration(color: Color.fromARGB(178, 255, 226, 139)),
        child: InkWell(
          onTap: onPressed,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            verticalDirection: VerticalDirection.down,
            children: <Widget>[
              const SizedBox(height: 50.0),
              Center(
                  child: Icon(
                icon,
                size: 40.0,
                color: Colors.amber,
              )),
              const SizedBox(height: 20.0),
              Center(
                child: Text(title,
                    style:
                        const TextStyle(fontSize: 18.0, color: Colors.black)),
              )
            ],
          ),
        ),
      ));
}
