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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 1.h),
            child: ClipRRect( borderRadius: BorderRadius.circular(10), child: Image.asset(detail.photo, width: 40.w, height: 17.h, fit: BoxFit.fill,)),
          ),
          Text(detail.title),
          Text(detail.subTitle)
        ],
      ),
    );
  }
}
