import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Carousel extends StatefulWidget {
  const Carousel({Key? key}) : super(key: key);

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  List<String> images = [
    'assets/boba.png',
    'assets/deli.png',
    'assets/pizza.png'
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 20.h,
    width: 90.w,
    child: PageView.builder(itemBuilder: (context, index) => ClipRRect(borderRadius: BorderRadius.circular(4.w),child: Image.asset(images[index], fit: BoxFit.fill,)), itemCount: images.length));
  }
}
