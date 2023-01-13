import 'package:flutter/material.dart';
import 'package:supa_test/shared/circular_image.dart';

import '../models/profile_details.dart';
import '../screens/profile/edit_profile.dart';

class ProfileAppBar extends StatelessWidget with PreferredSizeWidget {
  final firstName, midName, lastName;
  final student_id;
  const ProfileAppBar(
      {this.firstName, this.lastName, this.midName, this.student_id, Key? key})
      : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(200);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text('${firstName} ${midName} ${lastName}'),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(250),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Center(
                child: CircularImage(size: 100.00, imgPath: student1.picLink)),
            const SizedBox(height: 40),
          ],
        ),
      ),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(300),
              bottomLeft: Radius.circular(300))),
      actions: [
        Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100), color: Colors.white),
            child: IconButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, EditProfile.id,
                      arguments: student_id);
                },
                icon: const Icon(Icons.edit)))
      ],
    );
  }
}
