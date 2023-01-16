import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {

  final icon, titleString, onPressed, iconColor;

  CustomListTile({Key? key,this.icon = Icons.one_k, this.titleString = "TellME", this.onPressed, this.iconColor = Colors.lightBlue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
          leading: Container(
            padding: const EdgeInsets.all(10.0),
            child: Icon(
              icon,
              color: iconColor,
            ),
          ),
          title: Text(titleString),
          onTap: onPressed,

        );
  }
}