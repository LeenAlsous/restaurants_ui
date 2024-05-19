import 'package:flutter/cupertino.dart';
import 'package:oop/business_logic/models/details.dart';
import 'package:sizer/sizer.dart';

class CustomContainer extends StatelessWidget {
  final Details detail;
  const CustomContainer({Key? key, required this.detail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45.w,
      margin: EdgeInsets.only(right: 3.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: CupertinoColors.systemGrey6
      ),
      child: Column(
        children: [
          Image.asset(detail.photo),
          Text(detail.title),
          Text(detail.subTitle)
        ],
      ),
    );
  }
}
