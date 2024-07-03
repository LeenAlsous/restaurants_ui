import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class Shimmery extends StatelessWidget {
  const Shimmery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(baseColor: CupertinoColors.systemGrey6,
    highlightColor: Theme.of(context).primaryColor,
    child: Container(
      width: 45.w,
      height: 27.5.h,
      color: CupertinoColors.systemGrey6,
    ),);
  }
}
