import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oop/business_logic/models/restaurants_info.dart';
import 'package:sizer/sizer.dart';

class RestaurantContainer extends StatelessWidget {
  final RestaurantsInfoModel restaurant;
  const RestaurantContainer({Key? key, required this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45.w,
      margin: EdgeInsets.only(right: 3.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: CupertinoColors.systemGrey6
      ),
      child: Column(
        children: [
          Image.asset(restaurant.logo),
          Text(restaurant.name),
          Text(restaurant.distance)
        ],
      ),
    );
  }
}
