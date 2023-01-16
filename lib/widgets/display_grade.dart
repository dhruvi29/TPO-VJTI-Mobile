import 'package:flutter/material.dart';

class DisplayGrade extends StatelessWidget {
  final sem, score, trailText;
  Widget? trailWidget;
  DisplayGrade({Key? key, this.sem, this.score, this.trailText})
      : super(key: key) {
    if (trailText != null) {
      trailWidget = ClipRRect(
        borderRadius: BorderRadius.circular(20.0), //or 15.0
        child: Container(
          height: 30.0,
          width: 50.0,
          color: const Color(0xffFF0E58),
          child: Center(
              child: Container(
                  padding: const EdgeInsets.all(4),
                  child: Text(
                    trailText,
                    style: const TextStyle(color: Colors.white),
                  ))),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
          backgroundColor: Colors.amber,
          child: Text(
            sem,
            style: const TextStyle(color: Colors.white),
          )),
      title: Text(score.toString()),
    );
  }
}
