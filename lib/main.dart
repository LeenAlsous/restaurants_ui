import 'package:flutter/material.dart';
import 'package:oop/presentation/views/bottom_nav_bar.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
          // primary color: 73211D
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primaryColor: const Color(0xFF73211D)),
          home: const BottomNavBar());
    });
  }
}
