import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oop/business_logic/models/restaurants_info.dart';
import 'package:oop/dummy_data/restaurants_dummy_info.dart';
import 'package:oop/presentation/widgets/carousel.dart';
import 'package:oop/presentation/widgets/restaurant_container.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const List<RestaurantsInfoModel> restaurants = dummyData;
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Find your\nfavorite food'),
                  Icon(
                    Icons.notifications_none,
                    color: Colors.greenAccent,
                    size: 4.h,
                  )
                ],
              ),
              SizedBox(height: 2.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 78.w,
                    child: TextFormField(
                      // color FDF9E2
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 2.h),
                        filled: true,
                        fillColor: const Color(0xFFFDF9E2),
                        prefixIcon: const Icon(
                          CupertinoIcons.search,
                          color: Color(0xFFF3B149),
                        ),
                        hintText: 'What do you want to order?',
                        hintStyle: const TextStyle(color: Color(0xFFF3B149)),
                        focusedBorder: _getBorderStyle(),
                        enabledBorder: _getBorderStyle(),
                      ),
                    ),
                  ),
                  Container(
                    width: 12.w,
                    height: 12.w,
                    decoration: BoxDecoration(
                        color: const Color(0xFFFDF9E2),
                        borderRadius: BorderRadius.circular(3.w)),
                    child: Padding(
                      padding: EdgeInsets.all(2.w),
                      child: Image.asset('assets/filter.png'),
                    ),
                  )
                ],
              ),
              SizedBox(height: 2.h),
              const Carousel(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Nearest restaurants'),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        'View more',
                        style: TextStyle(color: Color(0xFFF3B149)),
                      ))
                ],
              ),
              SizedBox(
                  height: 27.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) =>
                        RestaurantContainer(restaurant: restaurants[index]),
                    itemCount: restaurants.length,
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Popular menu'),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        'View more',
                        style: TextStyle(color: Color(0xFFF3B149)),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  OutlineInputBorder _getBorderStyle() {
    return OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(3.w));
  }
}
