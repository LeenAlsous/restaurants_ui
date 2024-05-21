import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class RestaurantPage extends StatelessWidget {
  const RestaurantPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
        body: Column(
      children: [
        Stack(children: [
          SizedBox(
              height: 30.h,
              width: 100.w,
              child: Image.asset(
                'assets/restaurant.jpeg',
                fit: BoxFit.fill,
              )),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
              child: BackButton(
                  color: const Color(0xFFF3B149),
                  style: ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12))),
                      backgroundColor: const MaterialStatePropertyAll(
                        Color(0xFFFDF9E2),
                      ))))
        ]),
        Expanded(child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.vertical(top: Radius.circular(25)), color: Colors.white),
        ))
      ],
    ));
  }
}
