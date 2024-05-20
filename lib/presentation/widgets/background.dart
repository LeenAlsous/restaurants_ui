import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class BackgroundImage extends StatelessWidget {
  final Widget child;
  const BackgroundImage({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/registration.png'),
                fit: BoxFit.cover)),
        child: SizedBox(
            width: 100.w,
            child: child
        ));
  }
}
