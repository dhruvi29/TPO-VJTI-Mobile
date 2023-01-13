import 'package:flutter/material.dart';

class CircularImage extends StatelessWidget {

  final size, imgPath;
  const CircularImage({Key? key,this.size = 100.0, this.imgPath = 'assets/default_user.png'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
          height: 100,
          width: 100,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image(image: AssetImage(imgPath)),
          ),
        );
  }
}